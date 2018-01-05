#!/bin/bash
rm *.txt hosts
URLS=(
    https://coding.net/u/Elaine_ni/p/hosts/git/raw/master/hosts.txt
    https://raw.githubusercontent.com/lack006/Android-Hosts-L/master/hosts_files/2017_hosts/AD
    https://raw.githubusercontent.com/vokins/yhosts/master/hosts
)

EXCLUDES=(
    cps.dianping.com
    fp.fraudmetrix.cn
    static.fraudmetrix.cn
)

INDEX=0
for URL in ${URLS[@]}; do
{
    (( INDEX++ ))
    echo $INDEX. $URL
    wget --no-check-certificate $URL -O $INDEX.txt
    sed -n '/^127.0.0.1/p' $INDEX.txt >> Temp1.txt
}
done
sed -i '/localhost/d' Temp1.txt

echo '#' $(date) > Temp2.txt
sort Temp1.txt | uniq >> Temp2.txt

for EXCLUDE in ${EXCLUDES[@]}; do
{
    sed -i "/${EXCLUDE}/d" Temp2.txt
}
done

cp Temp2.txt hosts
rm *.txt