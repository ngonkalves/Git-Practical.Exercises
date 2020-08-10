call ../operations.cmd cleanOldFolders

call ../operations.cmd checkGitInPath

SET CLIENT1=client1
SET CLIENT_USER1=client1
SET REMOTE_REPONAME=remote-repository.git

call ../operations.cmd gitInitBare %REMOTE_REPONAME%

REM ================================== CLIENT 1 ==================================
call ../operations.cmd gitClone %CLIENT1% %CLIENT_USER1%
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 1 ==================================
call ../operations.cmd showStartRepoInfo %CLIENT1%
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 1 ==================================

REM ## master ##
call ../operations.cmd gitCreateBranch %CLIENT1% master
call ../operations.cmd gitCommitAndPush %CLIENT1% master "C1" C1.txt "C1"
call ../operations.cmd gitCommitAndPush %CLIENT1% master "C2" C2.txt "C2"

REM ## featureA ##
call ../operations.cmd gitCreateBranch %CLIENT1% featureA
call ../operations.cmd gitPush %CLIENT1% featureA
call ../operations.cmd gitCommit %CLIENT1% featureA "C3" C3.txt "C3"

REM ## master ##
call ../operations.cmd gitCommitAndPush %CLIENT1% master "C4" C4.txt "C4"
call ../operations.cmd gitCommitAndPush %CLIENT1% master "C5" C5.txt "C5"

REM ## featureB ##
call ../operations.cmd gitCreateBranch %CLIENT1% featureB
call ../operations.cmd gitResetBackBranch %CLIENT1% featureB 1
call ../operations.cmd gitCommitAndPush %CLIENT1% featureB "C6" C6.txt "C6"
call ../operations.cmd gitCommitAndPush %CLIENT1% featureB "C7" C7.txt "C7"

call ../operations.cmd gitSwitchBranch %CLIENT1% featureA

call ../operations.cmd showStartRepoInfo %CLIENT1%
REM ================================== CLIENT 1 ==================================

rem pause