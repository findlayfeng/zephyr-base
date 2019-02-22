FROM fengch/zephyr-build

ENV DISTCCD_USER=nobody \
    DISTCCD_JOBS=8 \
    DISTCCD_ALLOW=0.0.0.0/0 \
    DISTCC_HOSTS=localhost \
    GNUARMEMB_TOOLCHAIN_PATH=/usr/lib/distcc/

EXPOSE 3632

RUN pacman --noconfirm -Sy --needed distcc \
    && ln -s /usr/bin/distcc /usr/lib/distcc/arm-none-eabi-gcc \
    && ln -s /usr/bin/distcc /usr/lib/distcc/arm-none-eabi-c++ \
    && ln -s /usr/bin/distcc /usr/lib/distcc/arm-none-eabi-g++ \
    && ln -s /usr/bin/distcc /usr/lib/distcc/arm-none-eabi-cpp \
    && ln -s /usr/bin/distcc /usr/lib/distcc/bin/arm-none-eabi-gcc \
    && ln -s /usr/bin/distcc /usr/lib/distcc/bin/arm-none-eabi-c++ \
    && ln -s /usr/bin/distcc /usr/lib/distcc/bin/arm-none-eabi-g++ \
    && ln -s /usr/bin/distcc /usr/lib/distcc/bin/arm-none-eabi-cpp \
    && ln -s /usr/bin/arm-none-eabi-addr2line /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-dwp /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gcc-nm /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-ld /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-ranlib /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-ar /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-elfedit /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gcc-ranlib /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-ld.bfd /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-readelf /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-as /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gcov /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-ld.gold /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-size /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gcov-dump /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-nm /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-strings /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-c++filt /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gcov-tool /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-objcopy /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-strip /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gcc-ar /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-gprof /usr/lib/distcc/bin/ \
    && ln -s /usr/bin/arm-none-eabi-objdump /usr/lib/distcc/bin/ \
    && rm -rf \
    /usr/share/man/* \
    /var/cache/pacman/pkg/* \
    /var/lib/pacman/sync/* \
    /etc/pacman.d/mirrorlist.pacnew

CMD distccd --daemon --jobs=${DISTCCD_JOBS} --user=${DISTCCD_USER} --allow=${DISTCCD_ALLOW} --verbose --no-detach

ENTRYPOINT ["sh", "-c"]
