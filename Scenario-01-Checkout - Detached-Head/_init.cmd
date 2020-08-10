call ../_operations.cmd cleanOldFolders

call ../_operations.cmd checkGitInPath

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

call ../_operations.cmd gitInitBare %REMOTE_REPONAME%

REM ================================== CLIENT 1 ==================================
call ../_operations.cmd gitClone %CLIENT1% %CLIENT_USER1%
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 1 ==================================
REM ## master ##
call ../_operations.cmd showStartRepoInfo %CLIENT1%
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 1 ==================================
REM ## master ##
call ../_operations.cmd gitCommitAndPush %CLIENT1% master "C1" C1.txt "C1"
call ../_operations.cmd gitCommitAndPush %CLIENT1% master "C2" C2.txt "C2"
call ../_operations.cmd gitCommitAndPush %CLIENT1% master "C3" C3.txt "C3"
call ../_operations.cmd gitCommitAndPush %CLIENT1% master "C4" C4.txt "C4"
call ../_operations.cmd showStartRepoInfo %CLIENT1%
REM ## featureA ##
call ../_operations.cmd gitCreateBranch %CLIENT1% featureA
call ../_operations.cmd gitResetBack %CLIENT1% 1
call ../_operations.cmd showStartRepoInfo %CLIENT1%
REM ## master ##
call ../_operations.cmd gitSwitchBranch %CLIENT1% master REM switch to master
REM ================================== CLIENT 1 ==================================

rem pause