#Remove any previous installations of x264</h3>
sudo apt remove x264 libx264-dev libopencv*

# We will Install dependencies now
sudo apt-get install -y build-essential checkinstall cmake gcc g++ yasm pkg-config 
sudo apt-get install -y git gfortran libjpeg8-dev libjasper-dev libpng12-dev libtiff5-dev
 
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev 
sudo apt-get install libxine2-dev libv4l-dev libgstreamer0.10-dev 
sudo apt-get install  libgstreamer-plugins-base0.10-dev qt5-default libgtk2.0-dev libtbb-dev 
sudo apt-get install libatlas-base-dev libfaac-dev libmp3lame-dev libtheora-dev 
sudo apt-get install libvorbis-dev libxvidcore-dev libopencore-amrnb-dev libopencore-amrwb-dev 
sudo apt-get install x264 v4l-utils libhdf5-serial-dev hdf5-tools pkg-config

sudo apt-get install -y git gfortran libjpeg8-dev libjasper-dev libpng12-dev pkg-config

# If you are using Ubuntu 16.04
sudo apt-get install -y libtiff5-dev pkg-config
sudo apt-get install libpcap-dev libpq-dev libpng-dev libjpeg-dev libopenexr-dev libtiff-dev libwebp-dev pkg-config

# Optional dependencies
sudo apt-get install libprotobuf-dev protobuf-compiler  pkg-config
sudo apt-get install libgoogle-glog-dev libgflags-dev  pkg-config
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen pkg-config

#Install Python libraries
sudo apt-get install python-dev python-pip python3-dev python3-pip python-setuptools pkg-config
sudo -H pip2 install -U pip "numpy < 1.17" 
sudo -H pip2 install -U pip scipy matplotlib 
#sudo -H pip2 install -U pip scikit-image scikit-learn 
#sudo -H pip2 install -U pip ipython pkg-config

sudo -H pip3 install -U pip "numpy < 1.17" 
sudo -H pip3 install -U pip scipy matplotlib 
#sudo -H pip3 install scikit-image scikit-learn 
#sudo -H pip3 install ipython pkg-config


# Install virtual environment
sudo pip2 install virtualenv virtualenvwrapper
sudo pip3 install virtualenv virtualenvwrapper
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

# Install virtual environment
pip2 install virtualenv virtualenvwrapper
pip3 install virtualenv virtualenvwrapper
echo "# Virtual Environment Wrapper"  >> ~/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
source ~/.bashrc

############ For Python 2 ############
# create virtual environment
mkvirtualenv facecourse-py2 -p python2
workon facecourse-py2
  
# now install python libraries within this virtual environment
pip install scipy matplotlib scikit-image scikit-learn
  
# quit virtual environment
deactivate
######################################
  
############ For Python 3 ############
# create virtual environment
mkvirtualenv facecourse-py3 -p python3
workon facecourse-py3
  
# now install python libraries within this virtual environment
pip install  scipy matplotlib scikit-image scikit-learn 
  
# quit virtual environment
deactivate
######################################

# FFMPEG
add-apt-repository ppa:mc3man/trusty-media
apt-get update
apt-get install -y ffmpeg
ffmpeg -version

#Download opencv from Github

git clone https://github.com/opencv/opencv.git
cd opencv 
git checkout 3.4.6 
cd ..
#Download opencv_contrib from Github
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout 3.4.6
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

















