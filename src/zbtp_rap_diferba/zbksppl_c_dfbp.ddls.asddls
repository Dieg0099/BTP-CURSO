@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_C_DFBP
  as projection on ZBKSPPL_R_dfbp
{
  key BooksupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LocalLastChangedAt,

      /* Associations */
      _Booking : redirected to parent ZBOOKING_C_DFBP,
      _Product,
      _SupplementText,
      _Travel : redirected to ZTRAVEL_C_DFBP
}
