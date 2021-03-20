@AbapCatalog.sqlViewName: 'ZQMATRUPTURA'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@Analytics.query: true
@OData.publish: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Ruptura dos materiais Query - CJ'
define view ZQ_MATERIALRUPTURA
  as select from ZC_MATERIALRUPTURA
{
  //ZC_MATERIALRUPTURA
  Material,
  MaterialNome,
  OrdemRemessa,
  Empresa,
  @AnalyticsDetails.query.decimals: 0
  @DefaultAggregation: #SUM
  QtdeCarteira,
  DataEntrega,
  @DefaultAggregation: #FORMULA
  @AnalyticsDetails.query.formula: 'QtdeEstoque'
  @EndUserText.label: 'QtdeEstoque'
  @AnalyticsDetails: {   exceptionAggregationSteps: [{  exceptionAggregationBehavior : #AVG, exceptionAggregationElements: ['OrdemRemessa']   }]  }
  @AnalyticsDetails.query.decimals: 0
  0 as QtdeEstoque,
  @DefaultAggregation: #FORMULA
  @AnalyticsDetails.query.formula: 'QtdeEstoque1000'
  @EndUserText.label: 'QtdeEstoque1000'
  @AnalyticsDetails: {   exceptionAggregationSteps: [{  exceptionAggregationBehavior : #AVG, exceptionAggregationElements: ['OrdemRemessa']   }]  }
  @AnalyticsDetails.query.decimals: 0
  0 as QtdeEstoque1000,
  @DefaultAggregation: #FORMULA
  @AnalyticsDetails.query.formula: 'QtdeEstoque1025'
  @EndUserText.label: 'QtdeEstoque1025'
  @AnalyticsDetails: {   exceptionAggregationSteps: [{  exceptionAggregationBehavior : #AVG, exceptionAggregationElements: ['OrdemRemessa']   }]  }
  @AnalyticsDetails.query.decimals: 0
  0 as QtdeEstoque1025,
//  @DefaultAggregation: #FORMULA
//  @AnalyticsDetails.query.formula: 'QtdeEstoque1060'
//  @EndUserText.label: 'QtdeEstoque1060'
//  @AnalyticsDetails: {   exceptionAggregationSteps: [{  exceptionAggregationBehavior : #AVG, exceptionAggregationElements: ['OrdemRemessa']   }]  }
//  @AnalyticsDetails.query.decimals: 0
//  0 as QtdeEstoque1060
  @DefaultAggregation: #FORMULA
  @AnalyticsDetails.query.formula: 'QtdeEstoqueMADA'
  @EndUserText.label: 'QtdeEstoqueMADA'
  @AnalyticsDetails: {   exceptionAggregationSteps: [{  exceptionAggregationBehavior : #AVG, exceptionAggregationElements: ['OrdemRemessa']   }]  }
  @AnalyticsDetails.query.decimals: 0
  0 as QtdeEstoqueMADA
}

