# Используем базовый образ Ubuntu
FROM ubuntu:20.04

# Устанавливаем часовой пояс неинтерактивно
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo "Europe/Moscow" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev \
    gfortran \
    python3-dev \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Python и pip
RUN pip3 install --upgrade pip

# Скачиваем и собираем OpenCV из исходников
RUN git clone https://github.com/opencv/opencv.git /opencv \
    && git clone https://github.com/opencv/opencv_contrib.git /opencv_contrib \
    && cd /opencv \
    && mkdir build \
    && cd build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=/usr/local \
            -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib/modules \
            -D ENABLE_PRECOMPILED_HEADERS=OFF \
            -D BUILD_EXAMPLES=OFF \
            -D BUILD_TESTS=OFF \
            -D BUILD_PERF_TESTS=OFF \
            -D BUILD_opencv_java=OFF \
            -D BUILD_opencv_python2=OFF \
            -D BUILD_opencv_python3=ON \
            -D PYTHON3_EXECUTABLE=/usr/bin/python3 \
            -D PYTHON3_INCLUDE_DIR=/usr/include/python3.8 \
            -D PYTHON3_PACKAGES_PATH=/usr/local/lib/python3.8/dist-packages \
            .. \
    && make -j$(nproc) \
    && make install \
    && ldconfig

# Устанавливаем OpenCV для Python
RUN pip3 install numpy

# Копируем твой скрипт в контейнер
COPY . /app
WORKDIR /app

# Устанавливаем зависимости Python
RUN pip3 install -r requirements.txt

# Запускаем скрипт
CMD ["python3", "face_detection.py"]
