@AbapCatalog.sqlViewName: 'ZCMATRUPTURA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Analytics.dataCategory: #CUBE
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Ruptura dos materiais - CJ'
define view ZC_MATERIALRUPTURA
  as select from    mara                   as MAT
    inner join      makt                   as MATNAME     on MATNAME.matnr = MAT.matnr

    left outer join vbbe                   as CARTEIRA    on CARTEIRA.matnr = MAT.matnr
                                                          and CARTEIRA.lgort = '2000'
                                                          and CARTEIRA.omeng > 0

    left outer join StockAccount2KeyFigure as ESTOQUE     on  ESTOQUE.matnr = MAT.matnr
                                                          and ESTOQUE.werks = CARTEIRA.werks
                                                          and ESTOQUE.lgort = '2000'

    left outer join StockAccount2KeyFigure as ESTOQUE1000 on ESTOQUE1000.matnr = MAT.matnr
                                                          and ESTOQUE1000.werks = '1100'
                                                          and ESTOQUE1000.lgort = '1000'

    left outer join StockAccount2KeyFigure as ESTOQUE1025 on ESTOQUE1025.matnr = MAT.matnr
                                                          and ESTOQUE1025.werks = '1100'
                                                          and ESTOQUE1025.lgort = '1025'

    left outer join StockAccount2KeyFigure as ESTOQUEMADA on ESTOQUEMADA.matnr = MAT.matnr
                                                          and ESTOQUEMADA.werks = '1200'
                                                          and ESTOQUEMADA.lgort = '2000'

  //    left outer join StockAccount2KeyFigure as ESTOQUE1060 on ESTOQUE1060.matnr = MAT.matnr

{
  MAT.matnr               as Material,
  MATNAME.maktx           as MaterialNome,
  CARTEIRA.vbeln          as OrdemRemessa,
  CARTEIRA.werks          as Empresa,
  @Aggregation.default: #SUM
  CARTEIRA.omeng          as QtdeCarteira,
  CARTEIRA.mbdat          as DataEntrega,
  @Aggregation.default: #SUM
  ESTOQUE.labst           as QtdeEstoque,
  @Aggregation.default: #SUM
  ESTOQUE1000.labst       as QtdeEstoque1000,
  @Aggregation.default: #SUM
  ESTOQUE1025.labst       as QtdeEstoque1025,
  //  @Aggregation.default: #SUM
  //  ESTOQUE1060.labst       as QtdeEstoque1060
  @Aggregation.default: #SUM
  ESTOQUEMADA.labst       as QtdeEstoqueMADA
}
//where
//      CARTEIRA.omeng    > 0
//  and CARTEIRA.lgort    = '2000'
//  and ESTOQUE.lgort     = '2000'
//  and ESTOQUE1000.lgort = '1000'
//  and ESTOQUE1025.lgort = '1025'
//    and ESTOQUE1060.lgort = '1060'
//  and ESTOQUE1000.werks = '1100'
//  and ESTOQUE1025.werks = '1100'
//    and ESTOQUE1060.werks = '1100'
//  and ESTOQUEMADA.werks = '1200'
