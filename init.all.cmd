@echo off

set current_dir=%~dp0%

cd /D %current_dir%

for /f "delims=" %%d in ('dir /a:d /b') do (
  cd /D %current_dir%
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

rem pause