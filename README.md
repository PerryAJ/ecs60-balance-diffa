## compBalanceOutputs

For use with ECS60 Assignment p1 #2 - balances

A quick script used to run compile a balances.cpp file with -Wall and
gdb symbol flags,  run through the series of balance\*.txt files in 
the directory, and send the results to temp files. A diff between your file 
and the executable provided by the instructor will be shown.

#Usage

Simply put the script in your project directory containing your 
balances.cpp file, the balance.txt data files, and Sean's 
balances.out, and run the script:

>zsh compBalanceOutputs.sh


