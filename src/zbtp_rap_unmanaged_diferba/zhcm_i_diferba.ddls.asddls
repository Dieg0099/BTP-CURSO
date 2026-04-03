@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HCM Interface Entity'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZHCM_I_DIFERBA
provider contract transactional_interface
  as projection on ZHCM_R_DIFERBA
{
  key ENumber,
      EName,
      EDepartment,
      Status,
      JobTitle,
      StartDate,
      EndDate,
      Email,
      MNumber,
      MName,
      MDepartment,
      CreaDateTime,
      CreaUname,
      LchgDateTime,
      LchgUname
}
