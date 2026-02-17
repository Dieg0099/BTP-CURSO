@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_I_dfbp as projection on ZBKSPPL_R_dfbp
{
    key BooksupplUUID,
    TravelUUID,
    BookingUUID,
    BookingSupplementID,
    SupplementID,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChangedAt,
    
    /* Associations */
    _Booking : redirected to parent ZBOOKING_I_DFBP,
    _Product,
    _SupplementText,
    _Travel : redirected to ZTRAVEL_i_DFBP
}
