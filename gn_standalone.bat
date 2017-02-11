@ECHO OFF

set https_proxy=http://127.0.0.1:8118/
set http_proxy=http://127.0.0.1:8118/
set ftp_proxy=http://127.0.0.1:8118/
set PATH=C:\Program Files (x86)\Windows Kits\10\bin\x64;%PATH%

mkdir gn-standalone
cd gn-standalone
mkdir tools
cd tools
git clone https://github.com/yjqpro/gn.git

REM "Download libevent..."
cd ..
mkdir third_party\libevent
cd third_party\libevent
wget --no-check-certificate https://chromium.googlesource.com/chromium/chromium/+archive/master/third_party/libevent.tar.gz
tar -xvzf libevent.tar.gz

REM git clone deps from chromium
cd ..\..
git clone https://chromium.googlesource.com/chromium/src/base
git clone https://chromium.googlesource.com/chromium/src/build
git clone https://chromium.googlesource.com/chromium/src/build/config
mkdir testing
cd testing
git clone https://chromium.googlesource.com/chromium/testing/gtest
cd ..

REM Build
cd tools\gn

CALL "%VS140COMNTOOLS%vsvars32.bat"
set PATH=C:\Program Files (x86)\Windows Kits\10\bin\x64;%PATH%
set PATH=D:\GreenTool\depot_tools;%PATH%
python bootstrap\bootstrap.py -s
@ECHO ON
