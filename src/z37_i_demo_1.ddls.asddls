@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cases and Literals'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z37_I_DEMO_1
  as select from /dmo/flight
{
  //Literals
  'Hello world' as HelloWorld,
  42            as Int1,
  347.43        as Fltp1,

  //Cases
  flight_date,
  case when flight_date >= '20240101' and flight_date <'20250101' then '2024'
  when flight_date >= '20250101' and flight_date <'20260101' then '2025'
  else '0000'
  end           as FlightYear
}
