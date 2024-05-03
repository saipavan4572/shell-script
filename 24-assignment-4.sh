#!/bin/bash

## Convert rows into columns and columns to rows
#ex: input:
# name  age
# alice 21
# ryan  20
#
# output:
# name alice ryan
# age   21   20


awk '{ for(i=1;i<=NF;i++) { 
    if(!cols[i]) { cols[i]=$i } 
    else { cols[i]=cols[i] " " $i }
     } } 
     END { for(i=1;i<=length(cols);i++) print cols[i] 
     }' data.txt

#####
<<com
input file give:- data.txt

$ sh 24-assignment-4.sh
name alice ryan
age 21 30


com