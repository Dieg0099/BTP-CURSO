@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZSUPPL_r_1303
  as select from ztb_suppl_1303
//  association        to parent ZBOOKING_R_1303 as _Booking        on $projection.BookingID = _Booking.BookingID
//  association [1..1] to ZTRAVEL_R_1303         as _Travel         on $projection.TravelID = _Travel.TravelID
  association [1..1] to /DMO/I_Supplement      as _Product        on $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText  as _SupplementText on $projection.SupplementID = _SupplementText.SupplementID
{
  key travel_id             as TravelID,
  key booking_id            as BookingID,
  key booking_supplement_id as BookingSupplementID,
      supplement_id         as SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at       as LastChangedAt,
//      _Travel,
//      _Booking,
      _Product,
      _SupplementText

}
