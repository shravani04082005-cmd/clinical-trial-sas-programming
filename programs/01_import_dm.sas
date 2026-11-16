libname sasfold "/home/u64601736/dxhtn/sasfolder";

proc import datafile="/home/u64601736/dxhtn/csv/dm.csv"
dbms=csv out=sasfold.raw_dm replace;
guessingrows=MAX;
run;

proc contents data=raw_dm;
run;
