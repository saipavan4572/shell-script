#!/bin/bahs

movies=("Pushpa" "RRR" "Salar")

#size of the above array is 3
# index are 0,1,2
#list always start with 0

echo "First movie is: ${movies[0]}"
echo "Second movie is: ${movies[1]}"

#to print all the contents/values in the array
echo "All movies list is: ${movies[@]}"