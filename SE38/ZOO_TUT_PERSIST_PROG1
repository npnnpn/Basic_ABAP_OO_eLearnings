"*&---------------------------------------------------------------------*
*& Report  ZOO_TUT_PERSIST_PROG1
"*&---------------------------------------------------------------------*
REPORT  zoo_tut_persist_prog1.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
PARAMETER:
  p_carrid TYPE sflight-carrid DEFAULT 'AA',
  p_connid TYPE sflight-connid DEFAULT '0017',
  p_fldate TYPE sflight-fldate DEFAULT '20080130'.
SELECTION-SCREEN END OF BLOCK b1.

DATA:
  my_flight TYPE REF TO zcl_oo_tut_pers_sflight,
  seatsocc TYPE sflight-seatsocc,
  seatsmax TYPE sflight-seatsmax,
  seatsfree TYPE sflight-seatsocc,
  ierr TYPE REF TO cx_root,
  ierr2 TYPE REF TO cx_os_system_error,
  ierr3 TYPE REF TO cx_os_error.

TRY.

****Use the Agent Class to create an instance of our Persistent Class
	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
   	i_carrid = p_carrid
   	i_connid = p_connid
   	i_fldate = p_fldate ).

****Perform Calculations using our Get Methods instead of the attributes directly
	seatsfree = my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ).
	seatsmax  = my_flight->get_seatsmax( ).
	seatsocc  = my_flight->get_seatsocc( ).

	WRITE: / 'Seats Free: '(001), seatsfree.
	WRITE: / 'Seats Max: '(002), seatsmax.
	WRITE: / 'Seats Occupied: '(003), seatsocc.

	IF seatsfree > 0.
  	WRITE: / 'Now Booking a new Person'(004).
  	seatsocc = my_flight->get_seatsocc( ) + 1.
  	my_flight->set_seatsocc( seatsocc ).
  	COMMIT WORK AND WAIT.

  	CLEAR my_flight.
  	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
     	i_carrid = p_carrid
     	i_connid = p_connid
     	i_fldate = p_fldate ).

  	seatsfree = my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ).
  	seatsmax  = my_flight->get_seatsmax( ).
  	seatsocc  = my_flight->get_seatsocc( ).

  	WRITE: / 'Seats Free: '(001), seatsfree.
  	WRITE: / 'Seats Max: '(002), seatsmax.
  	WRITE: / 'Seats Occupied: '(003), seatsocc.
	ENDIF.

  CATCH cx_root INTO ierr.
	MESSAGE ierr TYPE 'I'.
ENDTRY."
"*&---------------------------------------------------------------------*
*& Report  ZOO_TUT_PERSIST_PROG2
*&---------------------------------------------------------------------*
REPORT  zoo_tut_persist_prog2.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
PARAMETER:
  p_carrid TYPE sflight-carrid DEFAULT 'AA',
  p_connid TYPE sflight-connid DEFAULT '0017',
  p_fldate TYPE sflight-fldate DEFAULT '20080130'.
SELECTION-SCREEN END OF BLOCK b1.

DATA:
  lr_flight TYPE REF TO zcl_oo_tut_pers_sflight,
  seatsocc TYPE sflight-seatsocc,
  seatsmax TYPE sflight-seatsmax,
  seatsfree TYPE sflight-seatsocc,
  ierr TYPE REF TO cx_root,
  ierr2 TYPE REF TO cx_os_system_error,
  ierr3 TYPE REF TO cx_os_error.

TRY.

****Use the Agent Class to create an instance of our Persistent Class
	lr_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
   	i_carrid = p_carrid
   	i_connid = p_connid
   	i_fldate = p_fldate ).

****Perform Calculations using our Get Methods instead of the attributes directly
	seatsfree = lr_flight->get_seatsmax( ) - lr_flight->get_seatsocc( ).
	seatsmax  = lr_flight->get_seatsmax( ).
	seatsocc  = lr_flight->get_seatsocc( ).

	WRITE: / 'Seats Free: '(001), seatsfree.
	WRITE: / 'Seats Max: '(002), seatsmax.
	WRITE: / 'Seats Occupied: '(003), seatsocc.

	IF seatsfree > 0.
  	WRITE: / 'Now Booking a new Person'(004).
  	seatsocc = lr_flight->get_seatsocc( ) + 1.
  	lr_flight->set_seatsocc( seatsocc ).
  	COMMIT WORK AND WAIT.

  	lr_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
     	i_carrid = p_carrid
     	i_connid = p_connid
     	i_fldate = p_fldate ).

  	seatsfree = lr_flight->get_seatsmax( ) - lr_flight->get_seatsocc( ).
  	seatsmax  = lr_flight->get_seatsmax( ).
  	seatsocc  = lr_flight->get_seatsocc( ).

  	WRITE: / 'Seats Free: '(001), seatsfree.
  	WRITE: / 'Seats Max: '(002), seatsmax.
  	WRITE: / 'Seats Occupied: '(003), seatsocc.
	ENDIF.

	DATA query_mng TYPE REF TO if_os_query_manager.
	DATA query_by_sflight TYPE REF TO if_os_query.
	query_mng = cl_os_system=>get_query_manager( ).
	query_by_sflight = query_mng->create_query(
                   	i_filter = `CARRID = PAR1 AND CONNID = PAR2 AND FLDATE = PAR3` ).

	data lt_sbooks TYPE OSREFTAB.
	lt_sbooks = zca_oo_tut_pers_sbook=>agent->if_os_ca_persistency~get_persistent_by_query(
    	i_query = query_by_sflight
    	i_par1  = p_carrid
    	i_par2  = p_connid
    	i_par3  = p_fldate ).

	FIELD-SYMBOLS <Wa_sbook>.
	data lr_sbook type ref to zcl_oo_tut_pers_sbook.
	data booking_id type sbook-bookid.
	data cust_id	type sbook-customid.
	loop at lt_sbooks ASSIGNING <Wa_sbook>.
  	lr_sbook ?= <Wa_sbook>.
  	booking_id = lr_sbook->get_bookid( ).
  	cust_id = lr_sbook->get_customid( ).
  	WRITE: / 'Booking: '(005), booking_id, cust_id.
	endloop.

  CATCH cx_root INTO ierr.
	MESSAGE ierr TYPE 'I'.
ENDTRY."
"*&---------------------------------------------------------------------*
*& Report  ZOO_TUT_PERSIST_PROG3
*&---------------------------------------------------------------------*
REPORT  zoo_tut_persist_prog3.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
PARAMETER:
  p_carrid TYPE sflight-carrid DEFAULT 'AA',
  p_connid TYPE sflight-connid DEFAULT '0017',
  p_fldate TYPE sflight-fldate DEFAULT '20080130'.
SELECTION-SCREEN END OF BLOCK b1.

DATA:
  my_flight TYPE REF TO zcl_oo_tut_pers_sflight,
  seatsocc TYPE sflight-seatsocc,
  seatsmax TYPE sflight-seatsmax,
  seatsfree TYPE sflight-seatsocc,
  ierr TYPE REF TO cx_root.

DATA: transaction_manager TYPE REF TO if_os_transaction_manager.
DATA: transaction     	TYPE REF TO if_os_transaction.
*---------------------------------------------------------------------*
*   	CLASS transaction_handler DEFINITION
*---------------------------------------------------------------------* 
CLASS transaction_handler DEFINITION.
  PUBLIC SECTION.
	METHODS handle FOR EVENT finished OF if_os_transaction
        	IMPORTING status.
ENDCLASS.                	""transaction_handler DEFINITION
*---------------------------------------------------------------------*
*   	CLASS transaction_handler IMPLEMENTATION
*---------------------------------------------------------------------* 
CLASS transaction_handler IMPLEMENTATION.
  METHOD handle.
	DATA:   lr_flight TYPE REF TO zcl_oo_tut_pers_sflight.
	IF status = oscon_tstatus_fin_success.
  	MESSAGE 'Update commited' TYPE 'I'.

  	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
           	i_carrid = p_carrid
           	i_connid = p_connid
           	i_fldate = p_fldate ).

  	seatsfree = my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ).
  	seatsmax  = my_flight->get_seatsmax( ).
  	seatsocc  = my_flight->get_seatsocc( ).

  	WRITE: / 'Seats Free: '(001), seatsfree.
  	WRITE: / 'Seats Max: '(002), seatsmax.
  	WRITE: / 'Seats Occupied: '(003), seatsocc.

	ENDIF.
  ENDMETHOD.                	""handle
ENDCLASS.                	""transaction_handler IMPLEMENTATION

DATA handler TYPE REF TO transaction_handler.

LOAD-OF-PROGRAM.
  cl_os_system=>init_and_set_modes(
    	i_external_commit = oscon_false
    	i_update_mode 	= oscon_dmode_update_task_sync ).

START-OF-SELECTION.

  transaction_manager = cl_os_system=>get_transaction_manager( ).
  transaction     	= transaction_manager->create_transaction( ).

  CREATE OBJECT handler.
  SET HANDLER handler->handle FOR transaction.

  TRY.
  	transaction->start( ).

****Use the Agent Class to create an instance of our Persistent Class
  	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
     	i_carrid = p_carrid
     	i_connid = p_connid
     	i_fldate = p_fldate ).

****Perform Calculations using our Get Methods instead of the attributes directly
  	seatsfree = my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ).
  	seatsmax  = my_flight->get_seatsmax( ).
  	seatsocc  = my_flight->get_seatsocc( ).

  	WRITE: / 'Seats Free: '(001), seatsfree.
  	WRITE: / 'Seats Max: '(002), seatsmax.
  	WRITE: / 'Seats Occupied: '(003), seatsocc.

  	IF seatsfree > 0.
    	WRITE: / 'Now Booking a new Person'(004).
    	seatsocc = my_flight->get_seatsocc( ) + 1.
    	my_flight->set_seatsocc( seatsocc ).
    	transaction->end( ).
  	ENDIF.

	CATCH cx_root INTO ierr.
  	MESSAGE ierr TYPE 'I'.
  ENDTRY."
"*&---------------------------------------------------------------------*
*& Report  ZOO_TUT_PERSIST_PROG4
*&---------------------------------------------------------------------*
REPORT  zoo_tut_persist_prog4.

DATA:
  my_flight TYPE REF TO zcl_oo_tut_pers_sflight,
  ierr TYPE REF TO cx_root.
  TYPES tr_flight TYPE REF TO zcl_oo_tut_pers_sflight.
  DATA lt_flight TYPE STANDARD TABLE OF tr_flight.
  DATA wa_flight LIKE LINE OF lt_flight.

TRY.

	DATA it_source TYPE STANDARD TABLE OF sflight.
	FIELD-SYMBOLS <wa_source> LIKE LINE OF it_source.

	SELECT * FROM sflight INTO TABLE it_source.
	LOOP AT it_source ASSIGNING <wa_source>.
  	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
     	i_carrid = <wa_source>-carrid
     	i_connid = <wa_source>-connid
     	i_fldate = <wa_source>-fldate ).
    	APPEND my_flight TO lt_flight.
	ENDLOOP.

  CATCH cx_root INTO ierr.
	MESSAGE ierr TYPE 'I'.
ENDTRY.

  data l_sflight type sflight.
  FIELD-SYMBOLS: <wa_flight> like line of lt_flight.
  data lt_bookings type zsbook_pers_table_type.
  data numbookings type i.
  LOOP AT lt_flight ASSIGNING <wa_flight>.
	l_sflight-carrid = <wa_flight>->get_carrid( ).
	l_sflight-connid = <wa_flight>->get_connid( ).
	l_sflight-fldate = <wa_flight>->get_fldate( ).
	l_sflight-price = <wa_flight>->get_price( ).
	l_sflight-currency = <wa_flight>->get_currency( ).
	WRITE: / l_sflight-carrid, l_sflight-connid, l_sflight-fldate.
	WRITE: / 'Flight Price: ', l_sflight-price CURRENCY l_sflight-currency, l_sflight-currency.
	lt_bookings = <wa_flight>->get_bookings( ).
	numbookings = lines( lt_bookings ).
	write: / 'Number of Bookings: ', numbookings.
  ENDLOOP."
"*&---------------------------------------------------------------------*
*& Report  ZOO_TUT_PERSIST_PROG5
*&---------------------------------------------------------------------*
REPORT  zoo_tut_persist_prog5.

DATA:
  my_flight TYPE REF TO zcl_oo_tut_pers_sflight,
  ierr TYPE REF TO cx_root.
TYPES tr_flight TYPE REF TO zcl_oo_tut_pers_sflight.
DATA lt_flight TYPE STANDARD TABLE OF tr_flight.
DATA wa_flight LIKE LINE OF lt_flight.

TRY.

	DATA it_source TYPE STANDARD TABLE OF sflight.
	FIELD-SYMBOLS <wa_source> LIKE LINE OF it_source.

	SELECT * FROM sflight INTO TABLE it_source.
	LOOP AT it_source ASSIGNING <wa_source>.

  	IF   <wa_source>-planetype CS '747'.
    	my_flight = zca_oo_tut_pers_sflight_747=>agent->get_persistent(
       	i_carrid = <wa_source>-carrid
       	i_connid = <wa_source>-connid
       	i_fldate = <wa_source>-fldate ).
  	ELSEIF <wa_source>-planetype CS '310'.
    	my_flight = zca_oo_tut_pers_sflight_a310=>agent->get_persistent(
       	i_carrid = <wa_source>-carrid
       	i_connid = <wa_source>-connid
       	i_fldate = <wa_source>-fldate ).
  	ELSE.
    	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
       	i_carrid = <wa_source>-carrid
       	i_connid = <wa_source>-connid
       	i_fldate = <wa_source>-fldate ).
  	ENDIF.
  	APPEND my_flight TO lt_flight.
	ENDLOOP.

  CATCH cx_root INTO ierr.
	MESSAGE ierr TYPE 'I'.
ENDTRY.

DATA l_sflight TYPE sflight.
FIELD-SYMBOLS: <wa_flight> LIKE LINE OF lt_flight.
DATA lt_bookings TYPE zsbook_pers_table_type.
DATA numbookings TYPE i.
LOOP AT lt_flight ASSIGNING <wa_flight>.
  l_sflight-carrid = <wa_flight>->get_carrid( ).
  l_sflight-connid = <wa_flight>->get_connid( ).
  l_sflight-fldate = <wa_flight>->get_fldate( ).
  l_sflight-price = <wa_flight>->get_price( ).
  l_sflight-currency = <wa_flight>->get_currency( ).
  WRITE: / l_sflight-carrid, l_sflight-connid, l_sflight-fldate.
  WRITE: / 'Flight Price: ', l_sflight-price CURRENCY l_sflight-currency, l_sflight-currency.
  lt_bookings = <wa_flight>->get_bookings( ).
  numbookings = lines( lt_bookings ).
  WRITE: / 'Number of Bookings: ', numbookings.
ENDLOOP."

