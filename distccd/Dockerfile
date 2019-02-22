FROM fengch/zephyr-build:distcc

ENV DISTCCD_USER=nobody \
    DISTCCD_JOBS=8 \
    DISTCCD_ALLOW=0.0.0.0/0

EXPOSE 3632

ENTRYPOINT [ "" ]

CMD distccd --daemon --jobs=${DISTCCD_JOBS} --user=${DISTCCD_USER} --allow=${DISTCCD_ALLOW} --verbose --no-detach
