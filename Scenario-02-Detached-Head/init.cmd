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

call:checkGitInPath

SET REMOTE_REPONAME=remote-repository.git

SET CLIENT1=client1
SET CLIENT2=client2
SET CLIENT3=client3
SET CLIENT4=client4
SET CLIENT5=client5
SET CLIENT6=client6

SET CLIENT_USER1=client1
SET CLIENT_USER2=client2
SET CLIENT_USER3=client3
SET CLIENT_USER4=client4
SET CLIENT_USER5=client5
SET CLIENT_USER6=client6

call:gitInitBare %REMOTE_REPONAME%

REM ================================== CLIENT 1 ==================================
call:gitClone %CLIENT1% %CLIENT_USER1%
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 1 ==================================
REM ## master ##
call:showStartRepoInfo %CLIENT1%
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 1 ==================================
REM ## master ##
call:gitCommitAndPush %CLIENT1% master "C1" C1.txt "C1"
call:gitCommitAndPush %CLIENT1% master "C2" C2.txt "C2"
call:gitCommitAndPush %CLIENT1% master "C3" C3.txt "C3"
call:gitCommitAndPush %CLIENT1% master "C4" C4.txt "C4"
call:showStartRepoInfo %CLIENT1%
REM ## featureA ##
call:gitCreateBranch %CLIENT1% featureA
call:gitResetBack %CLIENT1% 1
call:showStartRepoInfo %CLIENT1%
REM ## master ##
call:gitSwitchBranch %CLIENT1% master REM switch to master
REM ================================== CLIENT 1 ==================================

rem pause

:: EXIT
goto:eof

rem =====================================================================================================================================
rem =====================================================================================================================================
rem ===================================================== FUNCTIONS =====================================================================
rem =====================================================================================================================================
rem =====================================================================================================================================

:gitCreateTag 
	::       -- %~1: repo
	::       -- %~2: tagname
	echo ---gitCreateTag---
	cd %~1
	git tag %~2
	cd..
goto:eof

:gitPull
	::       -- %~1: repo
	echo ---gitPull---
	cd %~1
	git pull origin
	cd ..
goto:eof


:gitFetch
	::       -- %~1: repo
	echo ---gitFetch---
	cd %~1
	git fetch origin
	cd ..
goto:eof


:gitResetBack 
	::       -- %~1: repo
	::       -- %~2: number back commits
	echo ---gitResetBack---
	call:gitResetToBranch %~1 "HEAD~%~2"
goto:eof

:gitResetBackBranch
	::       -- %~1: repo
	::       -- %~2: branch
	::       -- %~3: number back commits
	echo ---gitResetBackBranch---
	call:gitSwitchBranch %~1 %~2
	call:gitResetToBranch %~1 "HEAD~%~3"
goto:eof

:gitResetToBranch 
	::       -- %~1: repo
	::       -- %~2: branch
	echo ---gitResetToBranch---
	cd %~1
	git log
	git show HEAD
	git reset --hard %~2
	cd ..
goto:eof

:gitResetToTag 
	::       -- %~1: repo
	::       -- %~2: tagname
	call:gitResetToBranch %~1 tags/%~2
goto:eof


:gitSwitchBranch
	::       -- %~1: repo
	::       -- %~2: branch
	echo ---gitSwitchBranch---
	cd %~1
	git checkout %~2
	cd ..
goto:eof

:gitCreateBranch
	::       -- %~1: repo
	::       -- %~2: branch
	echo ---gitCreateBranch---
	cd %~1
	git checkout -B %~2
	cd ..
goto:eof


:gitCheckoutTag
	::       -- %~1: repo
	::       -- %~2: tagname
	echo ---gitCheckoutTag---
	cd %~1
	git checkout tags/%~2
	cd ..
goto:eof

:gitClone
	::       -- %~1: destination dir
	::       -- %~2: username
	echo ---gitClone---
	git clone %REMOTE_REPONAME% %~1
	call:gitConfigUser %~1 "%~2" "%~2@domain.com"
goto:eof

:gitCommitAndPush
	::       -- %~1: repo
	::       -- %~2: branch
	::       -- %~3: commit message
	::       -- %~4: file
	::       -- %~5: file content
	echo ---gitCommitAndPush---
	call:gitCommit %~1 %~2 %~3 %~4 "%~5"
	cd %~1
	git push origin %~2
	cd ..
goto:eof

:gitCommit
	::       -- %~1: repo
	::       -- %~2: branch
	::       -- %~3: commit message
	::       -- %~4: file
	::       -- %~5: file content
	echo ---gitCommit---
	call:gitSwitchBranch %~1 %~2
	cd %~1
	rem git reset --hard
	call:fileAppendText %~4 "%~5"
	git add %~4
	git commit -m "%~3"
	cd ..
goto:eof

:gitCommitOverwriteFile
	::       -- %~1: repo
	::       -- %~2: branch
	::       -- %~3: commit message
	::       -- %~4: file
	::       -- %~5: file content
	echo ---gitCommit---
	call:gitSwitchBranch %~1 %~2
	cd %~1
	rem git reset --hard
	call:fileSetText %~4 "%~5"
	git add %~4
	git commit -m "%~3"
	cd ..
goto:eof

:gitInitBare REM passing a variable by reference
	::       -- %~1: bare repository folder
	echo ---gitInitBare---
	git init --bare %~1
rem	cd %~1
rem	git checkout -B master
rem	cd ..
goto:eof

:gitConfigUser 
	::       -- %~1: repo
	::       -- %~2: username
	::       -- %~3: email
	echo ---gitConfigUser---
	cd %~1
	git config user.name "%~2"
	git config user.email "%~3"
	cd ..
goto:eof

:fileAppendText
	::       -- %~1: file
	::       -- %~2: content
	echo %~2 >> %~1
goto:eof

:fileSetText
	::       -- %~1: file
	::       -- %~2: content
	echo %~2 > %~1
goto:eof

:deleteFilesAndFolders
	::       -- %~1: folder
	del /S /F /Q %~1
	rmdir /S /Q %~1
goto:eof

:cleanOldFolders
	FOR /D %%p IN ("*.*") DO rmdir "%%p" /s /q
goto:eof

:showRepoInfo
	::       -- %~1: repo
	cd %~1
	echo.
	echo.
	echo ===== Repository =====
	echo %~1
	echo ===== Branches =====
	git branch
	echo ===== Remotes =====
	git remote
	echo ===== Remotes =====
	git log
	echo.
	echo.
	cd ..
goto:eof

:showStartRepoInfo
	echo.
	echo.
	echo ===== Start Repository =====
	echo %~1
	echo.
	echo.
goto:eof

:checkGitInPath
where git > NUL
if %errorlevel% neq 0 (
	echo.
	echo.
    echo ERROR: git not found in PATH
	echo.
	echo.
    pause
    exit /b %errorlevel%
)
goto:eof