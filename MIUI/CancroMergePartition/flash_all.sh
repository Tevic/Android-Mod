fastboot $* getvar product 2>&1 | grep "^product: *MSM8974$"
if [ $? -ne 0 ] ; then echo "Missmatching image and device"; exit 1; fi
fastboot $* getvar board_version 2>&1 | grep "^board_version: *4.4"
if [ $? -eq 0 ] ; then echo "Missmatching board version"; exit 1; fi
fastboot $* getvar board_version 2>&1 | grep "^board_version: *5.[0-9]"
if [ $? -eq 0 ] ; then echo "Missmatching board version"; exit 1; fi

fastboot $* flash partition `dirname $0`/images/gpt_both0.bin
if [ $? -ne 0 ] ; then echo "Flash partition error"; exit 1; fi
fastboot $* flash tz `dirname $0`/images/tz.mbn
fastboot $* flash dbi `dirname $0`/images/sdi.mbn
fastboot $* flash sbl1 `dirname $0`/images/sbl1.mbn
fastboot $* flash rpm `dirname $0`/images/rpm.mbn
fastboot $* flash aboot `dirname $0`/images/emmc_appsboot.mbn
fastboot $* reboot-bootloader
sleep 5
fastboot $* erase DDR
fastboot $* flash misc `dirname $0`/images/misc.img
fastboot $* flash modem `dirname $0`/images/NON-HLOS.bin
fastboot $* flash recovery `dirname $0`/images/recovery.img
fastboot $* boot `dirname $0`/images/recovery.img
