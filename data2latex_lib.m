%%=================================================================================================
%% data2latex_lib.m
%%=================================================================================================
%%
%% Contains several functions that are used by the data2latex software
%%
%%-------------------------------------------------------------------------------------------------
%% Author: David Estévez Fernández, GPL license Aug 2012
%% ================================================================================================





% Function  sci_not_string()
% -------------------------------------------------------------------------------------------------
% From a number and the chosen number of decimal places outputs a string corresponding to a number
% in scientific notation in LaTeX syntax.
% ---------------------------------------------------------------------------------------------------
% Input -> decimal places for the current element, numerical value of the current element
% Output -> a string with the number in scientific notation and LaTeX sintax, ready to be "printfed"
% --------------------------------------------------------------------------------------------------


function string = sci_not_string( dec_places, number)
	
	

	% Compose the string we are giving to sprintf as argument to obtain the number on scientific notation:
	aux_string = ["%." num2str(dec_places) "e"];
	aux_string = sprintf( aux_string, number);

	% Separe the obtained string by means of the 'e' into the decimal part and the exponent
	[decimal exponent] = strtok( aux_string, "e" );
 
	% Remove the 'e' from the exponent string and improve the style of the string
	exponent = num2str( str2num ( exponent(2:4)) );	

	% Deal with special cases:

	if str2num(exponent) == 0
		% If exponent is 0 not print 10^0
		string = ["$ " num2str(decimal) " $"];
	else 
		% If exponent is 1 print 10 instead of 10^1, for other cases print the power of 10
		if str2num(exponent) == 1
			string = ["$ " num2str(decimal) " \\cdot 10 $"];
		else
			string = ["$ " num2str(decimal) " \\cdot 10^{" num2str(exponent) "} $ "];
		endif
	endif

endfunction
