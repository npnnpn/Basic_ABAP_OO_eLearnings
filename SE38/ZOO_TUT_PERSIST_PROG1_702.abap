"*&---------------------------------------------------------------------*
*& Report  ZOO_TUT_PERSIST_PROG1_702
*&---------------------------------------------------------------------*
REPORT  zoo_tut_persist_prog1_702.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME.
PARAMETER:
  p_carrid TYPE sflight-carrid DEFAULT 'AA',
  p_connid TYPE sflight-connid DEFAULT '0017',
  p_fldate TYPE sflight-fldate DEFAULT '20080130'.
SELECTION-SCREEN END OF BLOCK b1.

DATA:
  my_flight TYPE REF TO zcl_oo_tut_pers_sflight,
  ierr TYPE REF TO cx_root,
  lv_output TYPE string.

TRY.

****Use the Agent Class to create an instance of our Persistent Class
	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
   	i_carrid = p_carrid
   	i_connid = p_connid
   	i_fldate = p_fldate ).

****Perform Calculations using our Get Methods instead of the attributes directly
	lv_output = |{ 'Seats Free: '(001) } {
               	my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ) }.|.
	WRITE: / lv_output.
	lv_output = |{ 'Seats Max: '(002) } {
               	my_flight->get_seatsmax( ) }.|.
	WRITE: / lv_output.
	lv_output = |{ 'Seats Occupied: '(003) } {
               	my_flight->get_seatsocc( ) }.|.
	WRITE: / lv_output.

	IF  my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ) > 0.
  	WRITE: / 'Now Booking a new Person'(004).
  	my_flight->set_seatsocc( my_flight->get_seatsocc( ) + 1 ).
  	COMMIT WORK AND WAIT.

  	CLEAR my_flight.
  	my_flight = zca_oo_tut_pers_sflight=>agent->get_persistent(
     	i_carrid = p_carrid
     	i_connid = p_connid
     	i_fldate = p_fldate ).

  	lv_output = |{ 'Seats Free: '(001) } {
                 	my_flight->get_seatsmax( ) - my_flight->get_seatsocc( ) }.|.
  	WRITE: / lv_output.
  	lv_output = |{ 'Seats Max: '(002) } {
                 	my_flight->get_seatsmax( ) }.|.
  	WRITE: / lv_output.
  	lv_output = |{ 'Seats Occupied: '(003) } {
                 	my_flight->get_seatsocc( ) }.|.
  	WRITE: / lv_output.
	ENDIF.

  CATCH cx_root INTO ierr.
	MESSAGE ierr TYPE 'I'.
ENDTRY."

