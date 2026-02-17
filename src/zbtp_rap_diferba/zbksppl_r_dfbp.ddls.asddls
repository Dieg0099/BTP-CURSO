@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZBKSPPL_R_dfbp
  as select from zbksppl_dfbp_a
  association        to parent ZBOOKING_R_DFBP as _Booking    on $projection.BookingUUID = _Booking.BookingUUID
  association [1..1] to ZTRAVEL_R_DFBP         as _Travel     on $projection.TravelUUID = _Travel.TravelUUID
  association [1..1] to /DMO/I_Supplement      as _Product    on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _SupplementText     on $projection.SupplementID = _SupplementText .SupplementID
{
  key booksuppl_uuid        as BooksupplUUID,
      root_uuid             as TravelUUID,
      parent_uuid           as BookingUUID,
      booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Travel,
      _Booking,
      _Product,
      _SupplementText
}
