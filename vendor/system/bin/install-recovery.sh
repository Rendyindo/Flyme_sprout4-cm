#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7311360 718e6c829a5ab8dc00c3f77ebb281019cfb75f5f 4999168 e35a6a43fd360a36379199fab1a41ded80eaefe4
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:7311360:718e6c829a5ab8dc00c3f77ebb281019cfb75f5f; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:4999168:e35a6a43fd360a36379199fab1a41ded80eaefe4 EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery 718e6c829a5ab8dc00c3f77ebb281019cfb75f5f 7311360 e35a6a43fd360a36379199fab1a41ded80eaefe4:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
