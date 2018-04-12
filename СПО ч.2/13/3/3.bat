@echo off
chcp 855
echo TASK 1
echo TASK 1 > result3.txt

 ipconfig | find "IPv4" >> result3.txt
 ipconfig | find "Subnet" >> result3.txt
 ipconfig | find "Default" >> result3.txt

echo TASK 2 
echo TASK 2 >> result3.txt
ipconfig /all | find "Physical" >> result3.txt

echo TASK 3
echo TASK 3 >> result3.txt
ipconfig /all >> result3.txt
ping www.intel.com >>result3.txt

echo TASK 4
echo TASK 4 >> result3.txt
ping 192.168.0.1  >> result3.txt
ping www.intel.com >> result3.txt

echo TASK 5
echo TASK 5 >> result3.txt
wmic /node:localhost path win32_networkadapter get index, caption, speed  >> result3.txt

echo TASK 6
echo TASK 6 >> result3.txt
ping -n 1 -r 3 www.intel.com >> result3.txt

echo TASK 7
echo TASK 7 >> result3.txt
tracert www.intel.com >> result3.txt

echo TASK 8
echo TASK 8 >> result3.txt
pathping www.intel.com -w 1000 >> result3.txt

echo TASK 9
echo TASK 9 >> result3.txt 
arp -a >> result3.txt

echo TASK 10
echo TASK 10 >> result3.txt
netstat >> result3.txt

echo TASK 11
echo TASK 11 >> result3.txt
ping www.intel.com -f -l 1452 >> result3.txt

echo LAB COMPLETE
pause

