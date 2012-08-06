%%=================================================================================================
%% data2latex.m
%%=================================================================================================
%%
%% Obtain a latex table from a plain text data file compatible with octave/gnuplot.
%%
%%-------------------------------------------------------------------------------------------------
%% Author: David Estévez Fernández, GPL license Aug 2012
%% ================================================================================================

function data2latex( file )

% Clear system:
close all; clc;


% Load file
%=====================================================
fprintf("\nLoading data...");
table = load( file );			% Load data into table variable.
dim_table = size(table);		% Find the dimensions of table and store them.
fprintf("[OK]\n");

% Create system variables
% =====================================================
fprintf("Creating system variables...");

names_set = false;			% True if column names have been defined
table_headers = "\0";			% Initialize the list of names of the columns of the table

dec_places = 2 * ones(1, dim_table(2));	% Decimal places for the output for each column of data
sci_not = zeros(1, dim_table(2));	% Scientific notation disabled for all columns (0 == false)



% Menu 
%=====================================================
% Stay until end of program
flag = true;

while (flag)
	% Clear previous messages:
	clc;

		
	% Menu itself
	% #############################################################################################

	choice = menu( "Customize output\n------------------" , 'Continue', 'Set name of each column', 'Number output style', 'Enable/disable scientific notation' );



	% Option #1
	% ##############################################################################################
	% Continue and print the resultant code in the screen.
	% Is always the first choice because it has to be always present, and this way more features can 
	% be added easily.
	
	if choice == 1	% Print LaTeX code

		% Clear previous messages:
		clc;
		

		% Instructions + header of the table:
		% ------------------------------------------------------
		fprintf("Copy and paste this into your LaTeX file:\n\n");
		fprintf("\\begin{center}\n");
		fprintf("\t\\begin{tabular}{|");
	
		for i=[1:dim_table(2)]
			fprintf("c|");		% Defining centered columns
		endfor

		fprintf("} \\hline\n");


		% If the names of the columns have been set, print them:
		% -------------------------------------------------------

		if names_set 
			
			% ### Print column names ### %  (need to be commented out)
			fprintf("\t\t");
			
			for i=[2:size(table_headers,1)-1]
				fprintf("%s & ", strtrim(table_headers(i, :) ));
			endfor
			
			fprintf("%s \\\\ \\hline \\hline\n", strtrim(table_headers( size(table_headers,1), :) ));
		endif


		% Print the data (numbers):
		% -------------------------------------------------------
		if sci_not
			% Print the numbers with scientific notation
			input("Sorry, not implemented yet\n");			

		else
			% Print the numbers without scientific notation

			% Loop for rows
			for i=[1:dim_table(1)]		
				fprintf("\t\t");
	
				% Loop for columns
				for j=[1:dim_table(2)-1]	
					% Standard style, dec_places store the number of decimal places
					string = ["%." num2str(dec_places(j)) "f & "];
					fprintf(string, table(i,j) );
				endfor
			
				% Last element has different style
				string = ["%." num2str(dec_places(dim_table(2))) "f \\\\\\\\ \\\\hline \\n"];
				fprintf( string , table(i, dim_table(2)) );
			endfor

		endif

		% Footer
		% ----------------------------------------------------------
		fprintf("\t\\end{tabular}\n");
		fprintf("\\end{center}\n\n");
	
		% Exit the main loop
		% ----------------------------------------------------------
		flag = false;
	endif



	% Option #2
	% ######################################################################################

	if choice == 2		% Input the name of the columns

			% Set variables
			names_set = true;		% Set flag to true
			table_headers = "\0";		% Reset the matrix for re-editing

			% Ask user for names:
			fprintf( "Set the names that will be on top of the columns of the table.\n");
	
			for i = [1:dim_table(2)]
				fprintf("Insert text for column number %i/%i", i, dim_table(2) );
				string = input( ">", "s");
				
				
				table_headers = [table_headers; string];
			endfor

			
	endif



	% Option #3
	% ######################################################################################

	if choice == 3		

		% Set the number of decimal places
		dec_places = num_dec_places( dec_places );
		
		% Return to the menu
	endif



	% Option #4
	% ######################################################################################

	if choice == 4		
		
		% Enable/disable scientific notation
		sci_not = toggle_sci_not( sci_not);

		% Return to the menu
	endif

endwhile
endfunction
