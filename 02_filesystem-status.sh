#!/bin/bash 



# df is used to check the sysytem files and -h is forhuman readable 
# grep sda one for perticular sda files 
#tr is used for terminate an -d for delete tr -d is used for dleteting the percent sign 
fileusage=$(df -h | grep sda1 | awk '{print $5}'| tr -d %)
limit=10 #set according to yourself 

echo "Set limit is $limit %"
 

if [[ $fileusage -ge $limit  ]]
then 
	echo "Consumed Space is $fileusage % "
	echo "Your Consumed space is more than $limit %"
	echo "WARNING !!! Your File Space is running low " 
	read -p "Please Enter Your EMail to send Alert message " email
	echo "DISK SPACE ALERT: Your disk usage is at $fileusage%" | mail -s "DISK SPACE ALERT" "$email"
	
	
	if [[ $? -eq 0 ]]
	
	then 
		echo "Mail Sent Succeffully"
	else 
		echo "Mail Not Sent"
	fi 
else 
	echo "Consumed Space is $fileusage % "
	echo "Your Consumed space is less than $limit % "
	echo "Your file space is enough , DONT WORRY !! "

fi

 
