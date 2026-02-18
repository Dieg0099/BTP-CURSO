@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZSUPPL_C_1303
  as projection on ZSUPPL_r_1303
{
  key TravelID,
  key BookingID,
  key BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent ZBOOKING_C_1303,
      _Product,
      _SupplementText,
      _Travel : redirected to ZTRAVEL_C_1303
}
