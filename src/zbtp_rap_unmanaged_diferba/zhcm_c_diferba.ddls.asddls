@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HCM Consumption Entity'
@Metadata.ignorePropagatedAnnotations: true

@Metadata.allowExtensions: true

define root view entity ZHCM_C_DIFERBA
  provider contract transactional_query
  as projection on ZHCM_R_DIFERBA
{

      @ObjectModel.text.element: [ 'Ename' ]
  key ENumber,
      EName,
      EDepartment,
      Status,
      JobTitle,
      StartDate,
      EndDate,
      Email,
      @ObjectModel.text.element: [ 'MName' ]
      MNumber,
      MName,
      MDepartment,

      @Semantics.systemDateTime.createdAt: true
      CreaDateTime,
      @Semantics.user.createdBy: true
      CreaUname,
      @Semantics.systemDateTime.lastChangedAt: true
      LchgDateTime,
      @Semantics.user.lastChangedBy: true
      LchgUname

}
