@echo off

set current_dir=%~dp0%
set "file=_clean.cmd"
cd /D %current_dir%

for /f "delims=" %%d in ('dir /a:d /b') do (
  if EXIST "%%~fd\%file%" (
    echo Found %file% at: %%~fd\%file%
    cd /D %%~fd
    echo == Entering sub folder: %%~fd
    %file%
    echo == Exiting sub folder: %%~fd
    echo.
    cd ..
  )
)

rem pause