#!/bin/bash 


free_space=$(free  -mt | grep 'Total' | awk '{print $4}')

# free command for space chekck -m for memmory and -t for total 
#grep for selecting the perticular colums that is total in this case 
#awk  $4 is for selecting the 4 th column 

threshold=5000
echo "Your storage limit is $threshold MB "
if [[ $free_space -lt $threshold ]]
then 
	echo "Low Memory Space Only $free_space MB is available"
	
else 
	echo "Sufficiant Storage : $free_space MB "
	
fi 
