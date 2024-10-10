@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'department_query'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z37_C_DEPARMENTQUERY
with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats
   as select from Z37_C_EMPLOYEEQUERY ( p_target_curr: $parameters.p_target_curr, p_date: $parameters.p_date)
{
  
      DepartmentID,
      DepartmentDescription,
      CompanyAffiliation,
      avg(CompanyAffiliation as abap.dec(16,2)) as AverageAffiliation,
    
     
      @Semantics.amount.currencyCode:'CurrencyCode' 
      sum(AnnualSalaryConverted) as TotalSalary,
      CurrencyCode
    
}
group by
  DepartmentID,
  DepartmentDescription,
  CompanyAffiliation,
  CurrencyCode
