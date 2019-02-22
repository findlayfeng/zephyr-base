FROM archlinux/base

ARG ZEPHYR_VER=master
ARG ZEPHYR_URL=https://github.com/zephyrproject-rtos/zephyr.git
ARG ZEPHYR_PROJECT_PATH=/zephyrproject
ARG PYPI_URL=https://pypi.org
ARG WORKDIR=${ZEPHYR_PROJECT_PATH}

WORKDIR ${WORKDIR}

ENV LANG=en_US.UTF-8 \
    ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb \
    GNUARMEMB_TOOLCHAIN_PATH=/usr/ \
    BOARD_ROOT=${ZEPHYR_PROJECT_PATH} \
    XDG_CACHE_HOME=/cache

VOLUME [ "${XDG_CACHE_HOME}/zephyr" ]
RUN mkdir -p ${BOARD_ROOT}/boards && mkdir -p ${WORKDIR}

RUN pacman --noconfirm -Sy --needed arm-none-eabi-gcc arm-none-eabi-newlib \
    python dtc gperf cmake make ninja git qemu qemu-arch-extra &&\
    rm -rf \
    /usr/share/man/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/* \
    /etc/pacman.d/mirrorlist.pacnew

RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && \
    python /tmp/get-pip.py && \
    rm /tmp/get-pip.py

RUN pip install -i ${PYPI_URL}/simple/ --no-cache-dir west && \
    west init -m ${ZEPHYR_URL} --mr ${ZEPHYR_VER} ${ZEPHYR_PROJECT_PATH} && \
    pip install -i ${PYPI_URL}/simple/ --no-cache-dir \
    -r ${ZEPHYR_PROJECT_PATH}/zephyr/scripts/requirements.txt && \
    source ${ZEPHYR_PROJECT_PATH}/zephyr/zephyr-env.sh

ENTRYPOINT [ "west" ]
