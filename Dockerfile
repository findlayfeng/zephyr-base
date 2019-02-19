FROM archlinux/base

ARG ZEPHYR_VER=1.14.0-rc1
ARG ZEPHYR_URL=https://codeload.github.com/zephyrproject-rtos/zephyr/tar.gz/v${ZEPHYR_VER}
ARG ZEPHYR_PATH=/usr/share
ARG PYPI_URL=https://pypi.org
ARG WORKDIR=/app

WORKDIR ${WORKDIR}

ENV LANG=en_US.UTF-8 \
    ZEPHYR_TOOLCHAIN_VARIANT=gnuarmemb \
    GNUARMEMB_TOOLCHAIN_PATH=/usr/ \
    ZEPHYR_BASE=${ZEPHYR_PATH}/zephyr \
    BOARD_ROOT=${ZEPHYR_PATH} \
    XDG_CACHE_HOME=/cache

VOLUME [ "${XDG_CACHE_HOME}/zephyr" ]
RUN mkdir -p ${BOARD_ROOT}/boards && mkdir -p ${WORKDIR}

RUN pacman --noconfirm -Sy --needed arm-none-eabi-gcc arm-none-eabi-newlib \
    python python-pip dtc gperf cmake make ninja tar \
    && rm -rf \
    /usr/share/man/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/* \
    /etc/pacman.d/mirrorlist.pacnew

RUN curl ${ZEPHYR_URL} -o /tmp/zephyr-${ZEPHYR_VER} && \
    tar -xvf /tmp/zephyr-${ZEPHYR_VER} -C /tmp && \
    mv /tmp/zephyr-${ZEPHYR_VER} ${ZEPHYR_PATH}/zephyr

RUN pip install -i ${PYPI_URL}/simple/ --no-cache-dir --upgrade pip \
    && pip install -i ${PYPI_URL}/simple/ --no-cache-dir \
    -r ${ZEPHYR_PATH}/zephyr/scripts/requirements.txt
