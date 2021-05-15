#!/bin/bash
set -e

if [ ! ${ADDRESS1} ]; then
  echo -e "没有配置要访问的Ip地址的环境变量ADDRESS1 ...\n"
  exit 1
fi


echo -e "\n========================1. 更新源代码========================\n"
[ ! -d ${WORK_DIR}/log ] && mkdir -p ${WORK_DIR}/log
bash git_pull
echo

echo -e "容器启动成功...\n"
sed -i "5c proxy_pass  $ADDRESS1;" /etc/nginx/conf.d/address1.conf

nginx

bash
