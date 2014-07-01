#! /bin/zsh
# compBalanceOutputs.sh

#The MIT License (MIT)

#Copyright (c) 2014 Perry Arellano-Jones

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.


# For use in Summer ECS60, UCD, hw1 balances.cpp

# A simple zsh script that will compile a 'balance.cpp' file and 
# Sean's executable ('balance.out') file,
# write the output of each to separate txt files, and 
# then diff the files.  

# Used for testing that output of a batch of balance.txt files
# against the teacher's example.

# Usage: put this file in the directory with your balance.cpp,
# balance*.txt files and Seans balance.out and run the script.
# Example run: zsh compareOutputs.sh


# Colors, to allow pretty output
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_CYAN=$ESC_SEQ"36;01m"

echo "$COL_RED \ncompareOutputs.sh:$COL_RESET Comparing a.out to balanced.out"
echo -e " Compiling $COL_YELLOW balance.cpp $COL_RESET using $COL_GREEN-Wall -g, -ansi $COL_RESET flags:\n"

command g++ -Wall -g -ansi balance.cpp;

echo -e "$COL_RED Compilation complete, beginning run - note any errors:\n$COL_RESET"

# build array of balance files
list=(balance*.txt)

# uncomment to print a list of all balance files in the diretory
# print -l $list

# clear the files if they already exist
echo '' > mine.txt > seans.txt;

# for each balance.txt test file, run executables and
# send output to text files.
for file in $list; 
{ 
  echo "STARTING RUN ON: $file" >> mine.txt >> seans.txt
  command a.out $file >> mine.txt; 
  command balance.out $file >> seans.txt;
  echo "" >> mine.txt >> seans.txt;  # add space between outputs
}

echo -e "$COL_RED \n Run complete, showing 'diff mine.txt seans.txt':\n $COL_RESET"
command diff mine.txt seans.txt;

echo -e "$COL_RED \n To send this diff output to a file, simply run as:"
echo -e "$COL_CYAN   zsh compareOutput.sh > myFileName.txt\n $COL_RESET"
