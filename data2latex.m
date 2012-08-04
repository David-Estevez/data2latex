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

fprintf("Creating system variables...");
sci_not = false;			% Scientific notation disabled
dec_places = 2 * ones(1, dim_table(2));	% Decimal places for the output for each column of data

% Menu 
%=====================================================
choice = menu( "Customize output\n------------------" , 'Enable scientific notation', 'Number output style', 'Continue');

if choice == 3
	% Clear previous messages:
	clc;
	
	% Instructions + header of the table:
	fprintf("Copy and paste this into your LaTeX file:\n\n");
	fprintf("\\begin{center}\n");
	fprintf("\t\\begin{tabular}{|");
	
	for i=[1:dim_table(2)]
		fprintf("c|");		% Defining centered columns
	endfor

	fprintf("} \\hline\n");

	% Print the data:
	for i=[1:dim_table(1)]		% Loop for rows
		fprintf("\t\t");

		for j=[1:dim_table(2)-1]	%Loop for columns
			% Standard style, dec_places store the number of decimal places
			string = ["%." num2str(dec_places(j)) "f & "];
			fprintf(string, table(i,j) );
		endfor
		
		%Last element has different style
		string = ["%." num2str(dec_places(dim_table(2))) "f \\\\\\\\ \\\\hline \\n"];
		fprintf( string , table(i, dim_table(2)) );
	endfor

	% Footer
	fprintf("\t\\end{tabular}\n");
	fprintf("\\end{center}\n\n");
endif

endfunction
