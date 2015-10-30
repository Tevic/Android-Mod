#!/bin/bash
rm 1.txt 2.txt 3.txt 4.txt hosts
URL1=https://coding.net/u/Elaine_ni/p/hosts/git/raw/master/hosts.txt
URL2=https://raw.githubusercontent.com/vokins/simpleu/master/hosts
wget --no-check-certificate $URL1
mv hosts.txt 1.txt
wget --no-check-certificate $URL2
mv hosts 2.txt

sed -n '/^127.0.0.1/p' 1.txt >> 3.txt
sed -n '/^127.0.0.1/p' 2.txt >> 3.txt

echo '#' $(date) > 4.txt
sort 3.txt | uniq >> 4.txt

sed -i '/localhost/d' 4.txt

cp 4.txt hosts
rm 1.txt 2.txt 3.txt 4.txt