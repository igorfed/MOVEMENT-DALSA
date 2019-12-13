SOURCE_DIR=$(dirname "$0")
patch -N /usr/local/cuda/include/cuda_gl_interop.h $SOURCE_DIR'/cuda_gl_interop.patch'

cd /usr/lib/aarch64-linux-gnu/
ln -sf tegra/libGL.so libGL.so
cd -

apt-get install -y \
	cmake \
	libavcodec-dev \
	libavformat-dev \
	libavutil-dev \
	libeigen3-dev \
	libglew-dev \
	libgtk2.0-dev \
	libgtk-3-dev \
	libjasper-dev \
	libjpeg-dev \
	libpng12-dev \
	libpostproc-dev \
	libswscale-dev \
	libtbb-dev \
	libtiff5-dev \
	libv4l-dev \
	libxvidcore-dev \
	libx264-dev \
	qt5-default \
	zlib1g-dev \
	pkg-config



apt-get install -y \
	libgstreamer1.0-dev \
	libgstreamer-plugins-base1.0-dev


apt-get install -y \
	libx11-dev \
	libxext-dev \
	libgtk-3-dev \
	libglade2-0 \
	libglade2-dev \
	libpcap0.8 \
	libcap2 \
	ethtool \
	libpcap* \
	pkg-config



