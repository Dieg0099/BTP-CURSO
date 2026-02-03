@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_BOOKS_LOG
  as select from    ztlibros_diferba   as Books

    inner join      ztcat_diferba      as Categ on Books.bi_categ = Categ.bi_categ

    left outer join zc_clints_book_log as Sales on Books.id_libro = Sales.BookID

  association [0..*] to ZC_CLIE_LOG    as _Clients on $projection.Bookid = _Clients.BookID

{

  key Books.id_libro    as Bookid,
      Books.titulo      as Tittle,
      Books.bi_categ    as Category,
      Books.autor       as Author,
      Books.editorial   as Editorial,
      Books.idioma      as Language,
      Books.paginas     as PagesNumber,
      @Semantics.amount.currencyCode: 'Currency'
      Books.precio      as Price,
      Books.moneda      as Currency,

      case
       when Sales.Sales < 1 then 0
       when Sales.Sales = 1 then 1
       when Sales.Sales = 2 then 2
       when Sales.Sales > 2 then 3
      else 0
      end               as Sales,

      Categ.descripcion as Description,


      Books.formato     as BookFormat,
      Books.url         as Images,

      _Clients

}
