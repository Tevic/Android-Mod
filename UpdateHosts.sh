#!/bin/bash
rm *.txt hosts
URL1=https://coding.net/u/Elaine_ni/p/hosts/git/raw/master/hosts.txt
URL2=https://raw.githubusercontent.com/vokins/simpleu/master/data/hosts
URL3=https://raw.githubusercontent.com/lack006/Android-Hosts-L/master/hosts_files/2016_hosts/AD
URL4=https://raw.githubusercontent.com/vokins/yhosts/master/hosts

wget --no-check-certificate $URL1 -O A.txt
wget --no-check-certificate $URL2 -O B.txt
wget --no-check-certificate $URL3 -O C.txt
wget --no-check-certificate $URL4 -O D.txt

sed -n '/^127.0.0.1/p' A.txt >> 1.txt
sed -n '/^127.0.0.1/p' B.txt >> 1.txt
sed -n '/^127.0.0.1/p' C.txt >> 1.txt
sed -n '/^127.0.0.1/p' D.txt >> 1.txt
sed -i '/localhost/d' 1.txt

echo '#' $(date) > 2.txt
sort 1.txt | uniq >> 2.txt

cp 2.txt hosts
rm *.txt