FROM debian:jessie

RUN apt-get update && apt-get install build-essential \
        libyaml-dev \
        libfftw3-dev \
        python-dev \
        libsamplerate0-dev \
        libtag1-dev \
        python-numpy-dev \
        python-numpy \
        git \
        python-setuptools \
        libavcodec-dev \
        libavutil-dev \
        libavfilter-dev \
        libavformat-dev \
        libavresample-dev \
        python-pandas \
        python-scipy -qy && \
    easy_install -U pip && pip install pyyaml --no-cache-dir && \
    cd /tmp && \
    git clone https://github.com/MTG/essentia.git --depth 1 && \
    cd essentia/ && \
    ./waf configure --mode=release --with-python && \
    ./waf && \
    ./waf install && \
    cd /tmp && \
    rm -Rf essentia/ && \
    apt-get remove build-essential \
        libyaml-dev \
        libfftw3-dev \
        python-dev \
        libsamplerate0-dev \
        libtag1-dev \
        python-numpy-dev \
        git \
        libavcodec-dev \
        libavutil-dev \
        libavfilter-dev \
        libavformat-dev \
        libavresample-dev -qy && \
    apt-get autoremove -qy && \
    apt-get clean autoclean -qy && \
    apt-get install libfftw3-3 \
        libyaml-0-2 \
        python \
        libpython2.7 \
        libsamplerate0 \
        libtag1c2a \
        python-numpy \
        libavcodec56 \
        libavutil54 \
        libavfilter5 \
        libavformat56 \
        libavresample2 -qy