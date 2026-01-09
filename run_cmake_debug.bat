@echo off
if not "%GITHUB_SHA%" == "" set GIT_COMMIT_HASH="%GITHUB_SHA%"
if not "%CIRRUS_CHANGE_IN_REPO%" == "" set GIT_COMMIT_HASH="%CIRRUS_CHANGE_IN_REPO%"

set QTVER=6.7.2
set FFMPEG_VERSION=7.0.1
set QTDIR=C:\Qt\%QTVER%\msvc2019_64
set TOOLSDIR=C:\Qt\Tools\QtCreator
set CMAKE_GENERATOR=NMake Makefiles

set VSPATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build
call "%VSPATH%\vcvarsall" amd64

set PATH=%QTDIR%\bin;%TOOLSDIR%\bin;C:\Users\markk\AppData\Roaming\Python\Python314\Scripts;%PATH%

set INSTALL_PREFIX=%CD%\webcamoid-data
set buildDir=build
if exist "%buildDir%" rmdir /s /q "%buildDir%"
mkdir "%buildDir%"

cmake ^
    -S . ^
    -B "%buildDir%" ^
    -G "%CMAKE_GENERATOR%" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_INSTALL_PREFIX="%INSTALL_PREFIX%" ^
    -DGIT_COMMIT_HASH="%GIT_COMMIT_HASH%" > cmake_output.txt 2>&1

echo Building...
cmake --build "%buildDir%" --target install >> cmake_output.txt 2>&1

echo Deploying...
windeployqt --verbose 2 --qmldir StandAlone\share\qml --multimedia --multimediawidgets "%INSTALL_PREFIX%\bin\webcamoid.exe" >> cmake_output.txt 2>&1
windeployqt --verbose 2 --qmldir libAvKys\Lib\share\qml --multimedia --multimediawidgets "%INSTALL_PREFIX%\bin\webcamoid.exe" >> cmake_output.txt 2>&1
windeployqt --verbose 2 --qmldir StandAlone\share\themes\WebcamoidTheme --multimedia --multimediawidgets "%INSTALL_PREFIX%\bin\webcamoid.exe" >> cmake_output.txt 2>&1

type cmake_output.txt
