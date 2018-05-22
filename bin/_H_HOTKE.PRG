*----------------------------------------------------------------------------
*	
*	NAME		:	h_hotkey()...demonstration of h_graph() SET KEY usage
*
*	SYNOPSIS	:	h_graph()
*
*	PARAMETERS  :	none
*
*	RETURNS		:	nothing
*
*	EXAMPLE		:	* Set the Alt-H key to h_hotkey()                       
*					SET KEY 291 TO h_hotkey()
*
*					* then go do the rest of the program
*					DO therestoftheprogram
*
*	CAUTIONS	:	none
*
*	SEE ALSO	:	h_graph(), h_pack(), h_maxblock(), h_used_mem(), 
*					h_free_mem()
*----------------------------------------------------------------------------
PROCEDURE h_hotkey
	PRIVATE hh_scrn
	*------------------------------------------------------------------------
	*	Clear the screen then display an h_graph
	*------------------------------------------------------------------------
	SAVE SCREEN TO hh_scrn

	CLEAR
	h_graph()

	*------------------------------------------------------------------------
	*	Then show, at the bottom of the screen, the state of memory now
	*------------------------------------------------------------------------
	@ 21, 0 SAY "Used Block = " + chr( 177 ) + "   " + "Free Block = " + chr( 254 )
	@ 22, 0 SAY "Total used : " + str( h_used_mem() )
	@ 23, 0 SAY "Total free : " + str( h_free_mem() )

	*------------------------------------------------------------------------
	*	We'll use h_maxblock() as an indication of when memory really starts
	*	to get crunched since, if it goes lower that 64K, we're about to run
	*   into trouble.  We also put Clipper's MEMORY(0) here for comparison
	*------------------------------------------------------------------------
	@ 22, 30 SAY "Largest contiguous block in heap : " + str( h_maxblock() )
	@ 23, 30 SAY "Clipper's MEMORY(0) reports      : " + str( MEMORY(0)    )

	*------------------------------------------------------------------------
	*	Sit around at 24, 0 for a key...
	*------------------------------------------------------------------------
	waitat(24,0)
	RESTORE SCREEN FROM hh_scrn

RETURN

*----------------------------------------------------------------------------
*								  _h_hotke.prg
*----------------------------------------------------------------------------
