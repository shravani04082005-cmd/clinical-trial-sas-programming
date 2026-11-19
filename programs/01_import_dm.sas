libname sasfold "/home/u64601736/dxhtn/sasfolder";

proc import datafile="/home/u64601736/dxhtn/csv/dm.csv"
dbms=csv out=sasfold.raw_dm replace;
guessingrows=MAX;
run;

proc contents data=sasfold.raw_dm varnum;
run;

proc print data=sasfold.raw_dm;
run;

proc import datafile="/home/u64601736/dxhtn/csv/vs.csv"
dbms=csv out=sasfold.raw_vs replace;
guessingrows=MAX;

proc contents data=sasfold.raw_vs varnum;
run;

proc print data=sasfold.raw_vs;
run;

proc import datafile="/home/u64601736/dxhtn/csv/lb.csv"
dbms=csv out=sasfold.raw_lb replace;
guessingrows=MAX;
run;

proc contents data=sasfold.raw_lb varnum;
run;

proc print data=sasfold.raw_lb;
run;

data sasfold.raw_ae;
    infile "/home/u64601736/dxhtn/csv/ae.csv"
        dlm=',' dsd missover firstobs=2 lrecl=32767;

    length USUBJID $17 AETERM $33 AESTDT $10
           AEENDT_RAW $10 AESEV $8 AESER $1
           AEREL $16 AEOUT $26 AEACN $16;

    informat AESEQ best32.;

    input USUBJID $
          AESEQ
          AETERM $
          AESTDT $
          AEENDT_RAW $
          AESEV $
          AESER $
          AEREL $
          AEOUT $
          AEACN $;

    if index(AEENDT_RAW, '/') then
        AEENDT = input(AEENDT_RAW, ddmmyy10.);
    else
        AEENDT = input(AEENDT_RAW, yymmdd10.);

    format AEENDT yymmdd10.;

    drop AEENDT_RAW;
run;


proc contents data=sasfold.raw_ae varnum;
run;

proc print data=sasfold.raw_ae;
run;
