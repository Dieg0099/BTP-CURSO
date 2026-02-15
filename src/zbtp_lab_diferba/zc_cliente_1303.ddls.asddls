@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clientes'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_CLIENTE_1303
  as select from ztb_cliente_1303 as Clientes
    inner join   ztb_clntlib_1303 as Clnlib on Clnlib.id_cliente = Clientes.id_cliente
{
  key Clnlib.id_libro      as IdLibro,
  key Clientes.id_cliente  as IdCliente,
  key Clientes.tipo_acceso as TipoAcceso,
      Clientes.nombre      as Nombre,
      Clientes.apellidos   as Apellidos,
      Clientes.email       as Email,
      Clientes.url         as Url
}
