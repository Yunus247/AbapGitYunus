@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'employee_query'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z37_C_EmployeeQuery
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats
  as select from Z37_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentID,
      _Department.Description                                                                as DepartmentDescription,

      // String function: concatinate with space
      concat_with_space(_Department._Assistant.FirstName,_Department._Assistant.LastName,1 ) as AssistantName,


      @EndUserText.label: 'Employee Role'
      case EmployeeId
      when _Department.HeadId  then 'H'
      when _Department.AssistantId then 'A'
       else ''  end                                                                          as EmployeeRole,


      @Semantics.amount.currencyCode: 'CurrencyCode'
      @EndUserText.label: 'Annual Salary'
      cast(AnnualSallary as abap.fltp) / 12.0                                                as MonthlySalary,
      //CurrencyCode,
      //cast('USD' as /dmo/currency_code)                                                      as CurrencyCodeUSD,
      $parameters.p_target_curr                                                              as CurrencyCode,

      @EndUserText.label: 'Monthly salary'
      @EndUserText.quickInfo: 'Monthly salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      // date functions : dats_days_between
      division(dats_days_between( EntryDate,$parameters.p_date),365,1)                       as CompanyAffiliation,

      @EndUserText.label: 'Annual Salary'
      @EndUserText.quickInfo: 'Annual Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(
        amount => AnnualSallary,
        source_currency => CurrencyCode,
        target_currency => $projection.CurrencyCode,
        exchange_rate_date => $parameters.p_date )                                         as AnnualSalaryConverted,




      /* Associations */
      _Department
}
