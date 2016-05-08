#!/bin/bash

# X00106072(Derek Mulhern)

# The following is a bash script to carry out some tests and collect the required data
# as per the instructions in the CA document

# This line is required to produce the correct header information
# The three columns required are 
# C0 - Number of completed transactions 
# N - Number of concurrent users 

# Idle - The idle time of the CPU
echo "CO N IDLE" > results.dat

# A for loop to mimic the increasing concurrent users from 0 <= n <= 50.
for i in {1..50}
do 
./loadtest $i &

# Using the awk command complete with the END{print $NF} allows the script to collect the required column / row data
# which in our instance is the average of %Idle everytime mpstat collects data. The tricky piece of data
# required is (the last row and last column cell) The end number field.
idle=$(mpstat 9 1 | awk 'END{print $NF}')

# Stop the test
pkill loadtest

# Collect the required data as per the three columns specified
echo `wc -l < synthetic.dat`" "$i" "$idle >> results.dat
done
