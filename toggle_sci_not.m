function new_sci_not = toggle_sci_not( sci_not)
	
	% Function  toggle_sci_not()
	% -------------------------------------------------------------------------------
	% Input -> current state of scientific notation (enabled/disabled) on each column
	% Output -> new state of scientific notation (enabled/disabled) on each column
	% -------------------------------------------------------------------------------

	%Toggle scientific notation:
	if sci_not
		new_sci_not = false;
	else
		new_sci_not = true;
	endif

endfunction
