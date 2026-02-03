@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Clients Books'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity zc_clints_book_log
  as select from ztclieli_diferba
{
  key id_libro                     as BookID,
      count( distinct id_cliente ) as Sales
}
group by
  id_libro;
