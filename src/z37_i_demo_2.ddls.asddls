@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Arithmetic Operators'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity Z37_I_DEMO_2
  as select from /dmo/flight
{
  seats_max,
  seats_occupied,
  seats_max-seats_occupied              as SeatsFree,
  seats_occupied+1                      as SeatsOccupiedPlus1,
  @Semantics.amount.currencyCode: 'currency_code'
  price,
  @Semantics.amount.currencyCode: 'currency_code'
  price*2                               as DoublePrice,
  cast(price as abap.fltp)* 1.4         as NewPrice,

  seats_occupied / seats_max            as Ratio,
  division(seats_occupied, seats_max,2) as Ratio2, //besser als div weil man nachkommastellen angeben kann
  div(seats_max, seats_occupied)        as Div,
  mod(seats_max, seats_occupied)        as Mod,

  'LH'                                  as CarrierId1,
  cast('LH' as /dmo/carrier_id)         as CarrierId2, // mit cast bekommt carrierId2 annotations im gegensatz zu CarrierId1
  cast('EUR' as abap.cuky)              as CurrencyCode, //

  currency_code

}
