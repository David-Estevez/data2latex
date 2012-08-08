function new_sci_not = toggle_sci_not( sci_not)
	
	% Function  toggle_sci_not()
	% -------------------------------------------------------------------------------
	% Input -> current state of scientific notation (enabled/disabled) on each column
	% Output -> new state of scientific notation (enabled/disabled) on each column
	% -------------------------------------------------------------------------------

	% Clear screen
	clc;
	
	% Display menu for changing all entries or just one:

	select = menu( "Scientific notation\n-------------------------\n", "Enable/disable for all columns", "Enable/disable one by one");


	if select == 1
	
		%Toggle scientific notation:
		if sci_not
			new_sci_not = zeros(1, length(sci_not));

			% Give feedback:
			fprintf("Disabled.\nPress any key to return to menu.");
			pause;
		else
			new_sci_not = ones(1, length(sci_not));

			% Give feedback:
			fprintf("Enabled.\nPress any key to return to menu.");
			pause;
		endif

	
		
	endif
	
	if select == 2
		
		% Create 'blank' matrix:
		new_sci_not = zeros(1, length(sci_not) );

		% Ask repeatly for input:
		for i=[1:length(sci_not)]
			
			if sci_not(1, i)
				fprintf("Scientific notation for element %d of %d is enabled. Disable? (y/n)", i, length(sci_not));	
				answer = input("", "s");
				if answer(1) == "y" || answer(1) == "Y"
					new_sci_not(1,i) = false;
				endif;

			else
				fprintf("Scientific notation for element %d of %d is disabled. Enable? (y/n)", i, length(sci_not));
				answer = input("", "s");
				if answer(1) == "y" || answer(1) == "Y"
					new_sci_not(1,i) = true;
				endif;
			endif

		endfor
	
		% Give feedback:
		printf("Values changed.\nPress any key to return to menu.");
		pause;
		
	endif

	

endfunction
