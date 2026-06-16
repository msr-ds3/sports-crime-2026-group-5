#!/bin/bash

# decompress the original file 
# and filter out filter out years from 2000 to 2005 only

# unzip and only extract the years 2000 to 2005 
unzip offense_segment_csv_1991_2024.zip "nibrs_offense_segment_200[0-5].csv"
