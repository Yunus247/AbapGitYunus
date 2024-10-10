@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'flight querry'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z37_C_FLIGHTQUERY
  as select from /dmo/flight
{
  //AggregatFunktionen
  key carrier_id,
  key connection_id,
  count(*)                                as NumberOfFlights,
  count(distinct plane_type_id )          as NumberOfDifferentPlaneTypeIds,

  sum(seats_occupied)                     as TotalNumberOFSeatsOcccupied,
  @Semantics.amount.currencyCode: 'currency_code'
  avg(price as abap.curr( 16,2 )) as AverageFlightPrice,
  currency_code,
  avg(seats_occupied as abap.dec( 16, 2)) as AvarageSeatsOccupiedtPrice,
  
  min(seats_occupied)                     as MinNumofSeats,
  max(seats_occupied)                     as MaxNumofSeats,


  //
  sum(case when seats_max / seats_occupied < 0.5 then 0
  else 1 end)                             as TotalNumOFHaltBookedFlight
}
group by
  currency_code,
  carrier_id,
  connection_id
