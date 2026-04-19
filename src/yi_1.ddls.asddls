@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Inf View for UX Team'
@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST,#UNION]
@Analytics.dataCategory: #CUBE
define root view entity YI_1 
as select from ytrap_uxteam_t {
key id as Id
}

