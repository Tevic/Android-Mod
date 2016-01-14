fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *MSM8974" || echo Missmatching image and device
fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *MSM8974" || exit /B 1
fastboot %* getvar board_version 2>&1 | findstr /r /c:"^board_version: *4.4" && echo Missmatching board version
fastboot %* getvar board_version 2>&1 | findstr /r /c:"^board_version: *4.4" && exit /B 1
fastboot %* getvar board_version 2>&1 | findstr /r /c:"^board_version: *5.[0-9]" && echo Missmatching board version
fastboot %* getvar board_version 2>&1 | findstr /r /c:"^board_version: *5.[0-9]" && exit /B 1

fastboot %* flash partition %~dp0images\gpt_both0.bin || @echo "Flash partition error" && exit /B 1
fastboot %* flash tz %~dp0images\tz.mbn
fastboot %* flash dbi %~dp0images\sdi.mbn
fastboot %* flash sbl1 %~dp0images\sbl1.mbn
fastboot %* flash rpm %~dp0images\rpm.mbn
fastboot %* flash aboot %~dp0images\emmc_appsboot.mbn
fastboot %* reboot-bootloader
ping 127.0.0.1 -n 5 -w 1000 > nul
fastboot %* erase DDR
fastboot %* flash misc %~dp0images\misc.img
fastboot %* flash modem %~dp0images\NON-HLOS.bin
fastboot %* flash recovery %~dp0images\recovery.img
fastboot %* boot %~dp0images\recovery.img
