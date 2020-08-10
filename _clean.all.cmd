@echo off

set current_dir=%~dp0%
set "file=_init.cmd"
cd /D %current_dir%

for /f "delims=" %%d in ('dir /a:d /b') do (
  cd /D %current_dir%
  if EXIST "%%~fd\.git" (
    echo Found git repo at: %%~fd
  )
  if EXIST "%%~fd\%file%" (
    echo Found %file% at: %%~fd\%file%
    cd /D %%~fd
    echo == Entering sub folder: %%~fd
    FOR /D %%p IN ("*.*") DO (
        echo removing directory: %%p 
        rmdir %%p /s /q
    )
    echo == Exiting sub folder: %%~fd
    echo.
    cd ..
  )
)

rem pause