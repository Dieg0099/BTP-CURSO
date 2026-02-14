CLASS zcl_insert_data_diferba DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_INSERT_DATA_DIFERBA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_datos TYPE TABLE OF zrent_customer.

    lt_datos = VALUE #( ( doc_id = '005638984K' matricula = '8764FGH' nombres = 'Olivia' apellidos = 'Allan' email = 'oliviaallan@email.com' cntr_type = '01' ) ).

    DELETE FROM zrent_customer.
    MODIFY zrent_customer FROM TABLE @lt_datos.

  ENDMETHOD.
ENDCLASS.
