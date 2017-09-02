clear
echo Checking Enviroment
git submodule update --init --recursive
sudo update-ca-certificates -f
sudo apt-get install ca-certificates ca-certificates-java
echo Cleaning Up 
rm -rf build
rm -r /DualBootPatcher/Android_GUI/build
echo Building App
mkdir build && cd build
clear
cmake .. -DMBP_BUILD_TARGET=android -DMBP_BUILD_TYPE=debug
clear
make -j4
clear
rm -rf assets && cpack -G TXZ
make apk
echo App built /Android_GUI/build/outputs/apk/
