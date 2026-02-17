@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel - Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZTRAVEL_i_DFBP
  provider contract transactional_interface
  as projection on ZTRAVEL_R_DFBP
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      
      
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZBOOKING_I_DFBP,
      _Currency,
      _Customer,
      _OverallStatus
}
