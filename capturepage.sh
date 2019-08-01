#!/bin/bash
#This scripts shows a web page and capture it in a log
read -p "Enter the page you want to capture: " WEBPAGE
read -p "Enter the outputfile name: " outfilename
sudo curl ${WEBPAGE} > ${outfilename}.txt
sudo cat ${outfilename}.txt 
