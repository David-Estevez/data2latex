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
