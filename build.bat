set XMR_SDIR=c:\xmr-stak
set BUILDDIR=%XMR_SDIR%\build
set MSVS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community
set Path=C:\Program Files\CMake\bin;C:\Program Files\Git\cmd;C:\Windows\System32\WindowsPowerShell\v1.0;C:\Windows\System32\Wbem;C:\Windows\system32;C:\Windows
cd %BUILDDIR%
set INCLUDE=
set LIBPATH=
set LIB=
call "%MSVS_PATH%\Common7\Tools\VsMSBuildCmd.bat"
cd %BUILDDIR%
set CMAKE_PREFIX_PATH=C:\xmr-stak-dep\hwloc;C:\xmr-stak-dep\libmicrohttpd;C:\xmr-stak-dep\openssl
cmake -G "Visual Studio 15 2017 Win64" -T v141,host=x64 -DCMAKE_BUILD_TYPE=Release -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF %XMR_SDIR%
cmake --build "%BUILDDIR%" --config Release --target clean
cmake --build "%BUILDDIR%" --config Release --target install
cd bin\Release
copy C:\xmr-stak-dep\openssl\bin\* .
pause
