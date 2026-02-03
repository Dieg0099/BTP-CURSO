@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clients'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_CLIE_LOG as select from ztclie_diferba as Clients

    inner join   ztclieli_diferba as RelCliLib on RelCliLib.id_cliente = Clients.id_cliente

{
  key RelCliLib.id_libro  as BookID,
  key Clients.id_cliente  as ClientID,
  key Clients.tipo_acceso as AccessType,
      Clients.nombre      as Name,
      Clients.apellidos   as LastName,
      Clients.email       as Email,
      Clients.url         as Images
}
