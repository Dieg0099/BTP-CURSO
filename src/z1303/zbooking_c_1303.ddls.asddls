@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZBOOKING_C_1303
  as projection on ZBOOKING_R_1303
{
  key TravelID,
  key BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */
      _Bksppl : redirected to composition child ZSUPPL_C_1303,
      _BookingStatus,
      _Carrier,
      _Connection,
      _Customer,
      _Travel : redirected to parent ZTRAVEL_C_1303
}
