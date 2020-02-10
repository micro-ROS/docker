FROM microros/base:dashing

WORKDIR /uros_ws

RUN mkdir -p toolchain

RUN curl -fsSLO https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 \
    && tar --strip-components=1 -xvjf gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 -C toolchain  > /dev/null \
    && rm ./gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2

ENV UROS_EXTERNAL_DEPS /uros_ws/toolchain/bin/arm-none-eabi-