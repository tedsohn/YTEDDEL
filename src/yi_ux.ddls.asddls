//@AbapCatalog.sqlViewName: 'YTV_RAP_UXTEAM'
//@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Inf View for UX Team'
@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST,#UNION]
@Analytics.dataCategory: #CUBE
//made it as cube to create ALP 
//new line code - 2026 0412 

define root view entity YI_UX as select from ytrap_uxteam_t {
key id as Id,
firstname as Firstname,
lastname as Lastname,
age as Age,
role as Role,
salary as Salary,
// cast( 'USD' as abap.cuky ) as USDcurrency, 
// @Semantics.amount.currencyCode: 'USDcurrency' 
// @DefaultAggregation: #SUM 
// cast (salary as abap.curr( 19,2)) as SalaryMeasure,
active as Active,
@Semantics.systemDateTime.lastChangedAt: true
last_changed_at as LastChangedAt,
@Semantics.systemDateTime.localInstanceLastChangedAt: true
local_last_changed_at as LocalLastChangedAt
}

