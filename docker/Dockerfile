FROM nginx:stable-alpine
LABEL maintainer="nextgods"
ARG BASE_URL=https://ghproxy.com/https://github.com/CocoSilent/intranet-access
ARG BASE_BRANCH=main
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ " \
    WORK_DIR=/intranet-access
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update -f \
        && apk upgrade \
        && apk --no-cache add -f bash \
                                 git \
        && rm -rf /var/cache/apk/* \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone \
    && git clone -b ${BASE_BRANCH} ${BASE_URL} ${WORK_DIR} \
    && cd ${WORK_DIR}/ \
    && ln -sf ${WORK_DIR}/docker/git_pull.sh /usr/local/bin/git_pull \
    && cp -f ${WORK_DIR}/docker/address1.conf  /etc/nginx/conf.d/address1.conf \
    && mv  /etc/nginx/conf.d/default.conf  /etc/nginx/conf.d/default.conf2 \
    && cp -f ${WORK_DIR}/docker/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh \
    && chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && echo ${WORK_DIR}
WORKDIR ${WORK_DIR}
ENTRYPOINT ["docker-entrypoint.sh"]