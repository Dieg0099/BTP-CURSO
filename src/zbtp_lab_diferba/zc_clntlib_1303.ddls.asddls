@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CLNTLIB_1303 as select from ztb_clntlib_1303
{
  key id_libro                     as IDLibro,
      count( distinct id_cliente ) as Ventas
}
group by
  id_libro;
