@echo off
set FFMPEG_VERSION=7.0.1
set GSTREAMER_VERSION=1.24.5

rem Install FFmpeg development headers and libraries
set FFMPEG_FILE=ffmpeg-%FFMPEG_VERSION%-full_build-shared.7z

if not exist %FFMPEG_FILE% curl --retry 10 -kLOC - "https://www.gyan.dev/ffmpeg/builds/packages/%FFMPEG_FILE%"

if exist %FFMPEG_FILE% "C:\Program Files\7-Zip\7z.exe" x %FFMPEG_FILE% -aoa -bb

rem Installing GStreamer development headers and libraries
set GSTREAMER_DEV_FILE=gstreamer-1.0-devel-x86_64-%GSTREAMER_VERSION%.msi

if not exist %GSTREAMER_DEV_FILE% curl --retry 10 -kLOC - "https://gstreamer.freedesktop.org/data/pkg/windows/%GSTREAMER_VERSION%/%GSTREAMER_DEV_FILE%"

if exist %GSTREAMER_DEV_FILE% (
    start /b /wait msiexec /i "%CD%\%GSTREAMER_DEV_FILE%" /quiet /qn /norestart
    set GSTREAMER_DEV_PATH=C:\gstreamer\1.0\x86_64
)

rem Copy necessary libraries to an alternative path to avoid conflicts with
rem Qt's MinGW system libraries
if exist %GSTREAMER_DEV_FILE% (
    xcopy %GSTREAMER_DEV_PATH%\lib\*gobject-2.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
    xcopy %GSTREAMER_DEV_PATH%\lib\*glib-2.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
    xcopy %GSTREAMER_DEV_PATH%\lib\*gstreamer-1.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
    xcopy %GSTREAMER_DEV_PATH%\lib\*gstapp-1.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
    xcopy %GSTREAMER_DEV_PATH%\lib\*gstpbutils-1.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
    xcopy %GSTREAMER_DEV_PATH%\lib\*gstaudio-1.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
    xcopy %GSTREAMER_DEV_PATH%\lib\*gstvideo-1.0.* %GSTREAMER_DEV_PATH%\lib2 /i /y
)

rem Installing GStreamer binaries

set GSTREAMER_BIN_FILE=gstreamer-1.0-x86_64-%GSTREAMER_VERSION%.msi

if not exist %GSTREAMER_BIN_FILE% curl --retry 10 -kLOC - "https://gstreamer.freedesktop.org/data/pkg/windows/%GSTREAMER_VERSION%/%GSTREAMER_BIN_FILE%"

if exist %GSTREAMER_BIN_FILE% (
    start /b /wait msiexec /i "%CD%\%GSTREAMER_BIN_FILE%" /quiet /qn /norestart
)
