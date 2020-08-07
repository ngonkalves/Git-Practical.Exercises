@echo off


if "%1"=="" (
    set default_dir=%~dp0%
) else (
    set default_dir=%1
)

cd /D %default_dir%

for /f "delims=" %%d in ('dir /a:d /b') do (
  cd /D %default_dir%
  if EXIST "%%~fd\.git" (
    echo Found git repo at: %%~fd
  )
  if EXIST "%%~fd\init.cmd" (
    echo Found init.cmd at: %%~fd\init.cmd
    cd /D %%~fd
    echo == Entering sub folder: %%~fd
    init.cmd
    echo == Exiting sub folder: %%~fd
    echo.
    cd ..
  )
)

pause