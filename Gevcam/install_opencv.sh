
git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 3.4.1 
cd ..
#Download opencv_contrib from Github
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.4.1
cd ..

cd opencv
mkdir build
cd build

# Jetson TX2
ARCH_BIN=6.2
# Jetson TX1
#ARCH_BIN=5.3

cmake \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D WITH_CUDA=ON \
	-D WITH CUDNN=ON \
	-D CUDA_TOOLKIT_ROOT_DIR =/usr/local/cuda-9.0 \
	-D WITH_FFMPEG=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D BUILD_EXAMPLES=ON \

	-D CUDA_ARCH_BIN=${ARCH_BIN} \
	-D CUDA_ARCH_PTX="" \
	-D ENABLE_FAST_MATH=ON \
	-D CUDA_FAST_MATH=ON \
	-D WITH_CUBLAS=ON \
	-D WITH_LIBV4L=ON \
	-D WITH_GSTREAMER=ON \
	-D WITH_GSTREAMER_0_10=OFF \
	-D WITH_TBB=ON \
	-D WITH_V4L=ON \
	-D WITH_QT=ON \
	-D WITH_OPENGL=ON \
	-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules/ \
	../

if [ $? -eq 0 ] ; then
	echo "OpenCV CMake successful"
else
	echo "OpenCV CMake unsuccessful"
	exit 1
fi


# find out number of CPU cores in your machine
nproc
# substitute 4 by output of nproc


make -j4


if [ $? -eq 0 ] ; then
	echo "OpenCV make successful"
else
	echo "OpenCV make unsuccessful"
	exit 1
fi




make install
sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'

if [ $? -eq 0 ] ; then
	echo "OpenCV make install successful"
else
	echo "OpenCV make install unsuccessful"
	exit 1
fi

sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
ldconfig

cd ..
cd ..

echo C libs:
pkg-config --cflags opencv
pkg-config --modversion opencv

echo Python libs:
find /usr/local/lib/ -type f -name "cv2*.so"
python -c 'import cv2; print("python " + cv2.__version__)'
python3 -c 'import cv2; print("python3 " + cv2.__version__)'

cd ..
cd ..

















