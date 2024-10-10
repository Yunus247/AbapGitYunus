CLASS zcl_37_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_37_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF st_connection,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
           END OF st_connection.

    TYPES lt_table TYPE TABLE OF st_connection.

    DATA test TYPE st_connection.
    DATA test2 TYPE z37_connection.
    DATA test3 TYPE lt_table.

  ENDMETHOD.
ENDCLASS.
