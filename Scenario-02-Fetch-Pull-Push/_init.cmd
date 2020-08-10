call ../_operations.cmd cleanOldFolders

call ../_operations.cmd checkGitInPath

SET REMOTE_REPONAME=remote-repository.git

SET CLIENT1=client1
SET CLIENT2=client2-pull-merge
SET CLIENT3=client3-pull-rebase
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
call ../_operations.cmd gitCreateBranch %CLIENT1% featureA
call ../_operations.cmd gitCommitAndPush %CLIENT1% featureA "C1" C1.txt "C1"
call ../_operations.cmd gitCommitAndPush %CLIENT1% featureA "C2" C2.txt "C2"
REM ================================== CLIENT 1 ==================================

REM ================================== CLIENT 2 ==================================
call ../_operations.cmd gitClone %CLIENT2% %CLIENT_USER2%
call ../_operations.cmd gitCreateBranch %CLIENT2% featureA
rem call ../_operations.cmd gitSwitchBranch %CLIENT2% featureA
call ../_operations.cmd gitConfigPullMerge %CLIENT2%
call ../_operations.cmd gitCommit %CLIENT2% featureA "C3" C3.txt "C3"
call ../_operations.cmd gitCommit %CLIENT2% featureA "C4" C4.txt "C4"
REM ================================== CLIENT 2 ==================================

REM ================================== CLIENT 1 ==================================
REM ## featureA ##
call ../_operations.cmd showStartRepoInfo %CLIENT1%
call ../_operations.cmd showStartRepoInfo %CLIENT2%
call ../_operations.cmd wait 1
REM ================================== CLIENT 1 ==================================

REM ## featureA ##
call ../_operations.cmd gitCommitAndPush %CLIENT1% featureA "C5" C5.txt "C5"
call ../_operations.cmd gitCommitAndPush %CLIENT1% featureA "C6" C6.txt "C6"

mkdir %CLIENT3%
xcopy /h /e %CLIENT2% %CLIENT3%

call ../_operations.cmd gitConfigPullRebase %CLIENT3%

call ../_operations.cmd showStartRepoInfo %CLIENT1%

rem pause