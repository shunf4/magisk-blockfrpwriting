# Block FRP Writing on SM-T825c

---
# **Block FRP Writing on SM-T825c**
## Description
Some devices like Samsung SM-T825c, does not have the option `OEM Unlocking` in Development Settings, disabling users to stay rooted while having their Google Account signed in. There are two solutions:

- Don't use the stock Google Play Services Core. Use [microG](https://microg.org/) instead.

- Block FRP status writing by `com.android.google.gms` after adding Google Accounts at each reboot.

  This Magisk module is the latter one. It can:

- Execute a script every booting-up. It can re-write the partition named *persistent* which contains FRP information written by Google Play Service, so that FRP will not automatically turn on.
- Tweak `framework-res.apk` (of SM-T825c firmware `T825CZHU1ARA2`) to remove `com.google.android.gms` from `config_persistentDataPackageName`, preventing Google Play Service from writing FRP partition.
## Changelog
v0.0.0.1
## Requirements
- SM-T825c firmware `T825CZHU1ARA2`
  - if the device's firmware is not `T825CZHU1ARA2`, decompile `framework-res.apk` , modify the value of `config_persistentDataPackageName` in `framework-res.apk/res/values/strings.xml` to an empty string, then re-compile it and place it under `/external_sd/framework-res/` then reinstall this module. **BE CAREFUL OF POSSIBLE BOOTLOOP CAUSED BY INAPPROPRIATE framework-res.apk!**
- Has `/dev/block/bootdevice/by-name/persistent` as the *persistent* partition defined as `ro.frp.pst=/dev/block/persistent`  in `/system/build.prop`.
## Instructions

- Install Magisk.
- Make sure now your FRP status is not locked (by having not logged in Google Account).
- Place `framework-res.apk` under `/external_sd/framework-res/` if you have compiled one for firmwares other than SM-T825c firmware `T825CZHU1ARA2`.
- Install this module.
- Profit.

## Links

[Module XDA Forum Thread](https://forum.xda-developers.com/apps/magisk/module-url-here "Module official XDA thread")

[Latest stable Magisk](http://www.tiny.cc/latestmagisk)
