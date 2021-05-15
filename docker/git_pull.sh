#!/usr/bin/env bash

## 文件路径、脚本网址、文件版本以及各种环境的判断
ShellDir=${WORK_DIR}
ShellURL=https://ghproxy.com/https://github.com/CocoSilent/intranet-access


function Git_PullShell {
  echo -e "更新shell脚本，原地址：${ShellURL}\n"
  cd ${ShellDir}
  git fetch --all
  ExitStatusShell=$?
  git reset --hard origin/main
}

## 克隆scripts
function Git_CloneScripts {
  git clone -b master ${ScriptsURL} ${ScriptsDir}
  ExitStatusScripts=$?
  echo
}






## 在日志中记录时间与路径
echo -e "\n--------------------------------------------------------------\n"
echo -n "系统时间："
echo $(date "+%Y-%m-%d %H:%M:%S")
if [ "${TZ}" = "UTC" ]; then
  echo
  echo -n "北京时间："
  echo $(date -d "8 hour" "+%Y-%m-%d %H:%M:%S")
fi
echo -e "--------------------------------------------------------------\n"

## 更新shell脚本
Git_PullShell
