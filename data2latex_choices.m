%%=================================================================================================
%% data2latex_choices.m
%%=================================================================================================
%%
%% Contains the functions for each choice of the menu, except for choices #1 and #2, that are 
%% included in data2latex.m, this way is easier to add new functionalities and choices to the menu
%% or modify the existing ones.
%%
%%-------------------------------------------------------------------------------------------------
%% Author: David Estévez Fernández, GPL license Aug 2012
%% ================================================================================================


% Choice #3: select number of decimal places after the decimal point
% ===============================================================================================
% ===============================================================================================

function new_dec_places = num_dec_places( decimal_places )
	
	% Function num_dec_places()
	% -------------------------------------------------------
	% Input -> current number of decimal places of each column
	% Output -> new number of decimal places of each column
	% --------------------------------------------------------
	
	% Clear screen
	clc;
	
	% Display menu for changing all entries or just one:
	
	select = menu( "Number of decimal places\n-------------------------\n", "Same value for all columns", "Edit one by one");

	if select == 1
	
		% Ask for input:
		new_value = input("\nInsert number of decimal places: ");
		new_dec_places = new_value * ones(1, size(decimal_places, 2) );
	
		% Give feedback:
		fprintf("Value changed.\nPress any key to return to menu.");
		pause;
	endif
	
	if select == 2
		
		% Create 'blank' matrix:
		new_dec_places = ones(1, length(decimal_places) );

		% Ask repeatly for input:
		for i=[1:length(decimal_places)]
			fprintf("Insert number of decimal places for element %d of %d: ", i, length(decimal_places));
			new_dec_places(1,i) = input("");
		endfor
	
		% Give feedback:
		fprintf("Value changed.\nPress any key to return to menu.");
		pause;
		
	endif

endfunction




% Choice #4: enable/disable scientific notation
% ===============================================================================================
% ===============================================================================================

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
