#!/bin/bash
set -e


echo -e "\n========================1. 更新源代码========================\n"
[ ! -d ${WORK_DIR}/log ] && mkdir -p ${WORK_DIR}/log
crond
bash git_pull
echo



echo -e "容器启动成功...\n"
