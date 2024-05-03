#!/bin/bash

## script to read a file and count the number of occurences of each word in the file
#FILE=/words.txt

grep -o '\w*' words.txt | sort | uniq -c | sort -nr | head -5


<<com
Result to display top 5 word occurences in words.txt file
$ sh 24-assignment-1.sh
      5 world
      3 welcome
      2 is
      2 hello
      2 DevOps
com
