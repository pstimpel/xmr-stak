rem "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
cd c:\xmr-stak

set CMAKE_PREFIX_PATH=C:\xmr-stak-dep\hwloc;C:\xmr-stak-dep\libmicrohttpd;C:\xmr-stak-dep\openssl
rem set(CMAKE_PREFIX_PATH C:\\xmr-stak-dep\\hwloc;C:\\xmr-stak-dep\\libmicrohttpd;C:\\xmr-stak-dep\\openssl)
mkdir build
cd build

rem use 141 with depv2, should be ok since there is no collision when not using the GPU stuff
cmake -G "Visual Studio 15 2017 Win64" -T v141,host=x64 -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF ..

rem use 140 with depv1
rem cmake -G "Visual Studio 15 2017 Win64" -T v140,host=x64 -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF ..

cmake --build . --config Release --target install
cd bin\Release
copy C:\xmr-stak-dep\openssl\bin\* .
pause
