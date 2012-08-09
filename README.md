
data2latex
===================================================================

Octave function for converting a octave/gnuplot format data file into a latex table.

 * Author: [David Estévez-Fernández](http://github.com/David-Estevez)
 * Released under GPL license , Aug 2012

0. Index
-------------------------------------------------------------------
 * 1.Introduction
 * 2.Dependencies
 * 3.Installation
 * 4.Usage
 * 5.Version log

1. Introduction
-------------------------------------------------------------------
Data2latex is an octave script that allows the user to convert an octave/gnuplot
data file, i.e., a plain text file with data arranged in columns to a LaTeX table, 
that can be copied and pasted on a LaTeX file.

2. Dependencies
-------------------------------------------------------------------
For this script to work you have to have installed [octave](http://www.gnu.org/software/octave/download.html). As octave
scripts are mostly compatible with matlab it could also be used, but I have no idea if it will work on matlab or not.

3. Installation
-------------------------------------------------------------------
This script does not need installation, just download it and use it with octave. For downloading it there are two options:

 * Clone the repo with git:

`git clone https://github.com/David-Estevez/data2latex.git`

 * Download the repo in a .zip file from github.com by clicking the ZIP button.

Once it is downloaded and unzipped (if needed), open a terminal, run octave and make the folder where data2latex.m is your 
current forder with the ` cd ` command.

4. Usage
------------------------------------------------------------------
Once it has been downloaded and octave is running on the same folder as data2latex, using the program is as simple as:

`data2latex( "pathTo/TheDataFile.txt" ); `

Then, the program menu is displayed, and the user can select the desired options. After that, option #1 will print the code
on the screen, as well as create a file called 'LaTeX.txt' with the same code as in the screen.

5. Version Log
-----------------------------------------------------------------

* 0.9 - Pre-release version: beta version of the data2latex program

