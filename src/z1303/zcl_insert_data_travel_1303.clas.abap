CLASS zcl_insert_data_travel_1303 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_travel_1303 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel  TYPE TABLE OF ztb_travel_1303,
          lt_booking TYPE TABLE OF ztb_booking_1303,
          lt_suppl   TYPE TABLE OF ztb_suppl_1303.


    DELETE FROM ztb_travel_1303.

    INSERT ztb_travel_1303 FROM (
    SELECT FROM /dmo/travel
      FIELDS
        travel_id,
        agency_id,
        customer_id,
        begin_date,
        end_date,
        booking_fee,
        total_price,
        currency_code,
        description,
        CASE status WHEN 'B' THEN 'A'
                    WHEN 'P' THEN 'O'
                    WHEN 'N' THEN 'O'
                    ELSE 'X' END AS overall_status,
        createdby AS create_by,
        createdat AS create_at,
        lastchangedby AS last_changed_by,
        lastchangedat AS last_changed_at ).

    out->write( 'Adding Booking data' ).

    DELETE FROM ztb_booking_1303.

    INSERT ztb_booking_1303 FROM (

        SELECT
          FROM /dmo/booking
          JOIN ztb_travel_1303 ON /dmo/booking~travel_id = ztb_travel_1303~travel_id
          JOIN /dmo/travel ON /dmo/travel~travel_id = /dmo/booking~travel_id
          FIELDS  "client,
                  ztb_travel_1303~travel_id,
                  /dmo/booking~booking_id,
                  /dmo/booking~booking_date,
                  /dmo/booking~customer_id,
                  /dmo/booking~carrier_id,
                  /dmo/booking~connection_id,
                  /dmo/booking~flight_date,
                  /dmo/booking~flight_price,
                  /dmo/booking~currency_code,
                  CASE /dmo/travel~status WHEN 'P' THEN 'N'
                                                   ELSE /dmo/travel~status END AS booking_status,
                  ztb_travel_1303~last_changed_at AS last_changed_at ).


    DELETE FROM ztb_suppl_1303.

    out->write( 'Adding Booking Supplements data' ).

    INSERT ztb_suppl_1303 FROM (
       SELECT FROM /dmo/book_suppl  AS supp
              JOIN ztb_travel_1303  AS trvl ON trvl~travel_id  = supp~travel_id
              JOIN ztb_booking_1303 AS book ON book~travel_id  = trvl~travel_id
                                           AND book~booking_id = supp~booking_id
              FIELDS
              trvl~travel_id,
              book~booking_id,
              supp~booking_supplement_id,
              supp~supplement_id,
              supp~price,
              supp~currency_code,
              trvl~last_changed_at    AS last_changed_at ).

  ENDMETHOD.

ENDCLASS.
