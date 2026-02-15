@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Libros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_LIBROS_1303
  as select from    ztb_libros_1303 as libros

    inner join      ztb_catego_1303 as categoria on libros.bi_categ = categoria.bi_categ

    left outer join ZC_CLNTLIB_1303 as clilibs   on libros.id_libro = clilibs.IDLibro

  association [0..*] to ZC_CLIENTE_1303 as _Clientes on $projection.IdLibro = _Clientes.IdLibro
{
  key libros.id_libro   as IdLibro,
  key libros.bi_categ   as BiCateg,
      libros.titulo     as Titulo,
      libros.autor      as Autor,
      libros.editorial  as Editorial,
      libros.idioma     as Idioma,
      libros.paginas    as Paginas,
      @Semantics.amount.currencyCode: 'Moneda'
      libros.precio     as Precio,
      libros.moneda     as Moneda,
      libros.formato    as Formato,
      libros.url        as Url,

      case
      when clilibs.Ventas < 1 then 0
      when clilibs.Ventas = 1 then 1
      when clilibs.Ventas = 2 then 2
      when clilibs.Ventas > 2 then 3
      else 0
      end               as Ventas,

      categoria.descripcion as Descripcion,


      libros.formato     as FormatoLibro,
      libros.url         as Imagenes,

      _Clientes
}
