@echo off
rem echo.
rem echo.
rem echo Will delete folders, do you want to continue?
rem echo.
rem echo.
rem echo.
rem echo.
rem echo ARE YOU SURE??
rem echo.
rem echo.
rem pause
call:cleanOldFolders




:cleanOldFolders
	FOR /D %%p IN ("*.*") DO (
        echo removing directory: %%p 
        rmdir %%p /s /q
    )
goto:eof