function new_dec_places = num_dec_places( decimal_places )
	
	% Function num_dec_places()
	% -------------------------------------------------------
	% Input -> current number of decimal places of each column
	% Output -> new number of decimal places of each column
	% --------------------------------------------------------
	
	% Ask for input
	new_value = input("Insert number of decimal places: ");
	new_dec_places = new_value * ones(1, size(decimal_places, 2) );
	

endfunction
