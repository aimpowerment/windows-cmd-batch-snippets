@echo off
setlocal
chcp 65001 >NUL
REM set local foldername
for %%a in ("%cd%") do set "CurDir=%%~nxa"
REM asking to execute
set cnt=0
:PROMPT
color b
SET /P QUESTION="Create a .m3u playlist %CurDir%.m3u with all audio files in this local directory (Y)es/(N)o ?"
IF /I "%QUESTION%" NEQ "Y" GOTO END
REM empty .m3u file
copy NUL %CurDir%.m3u
REM lookout the directory content for all files with the following audio filetypes
set list=*.wav *.mp3 *.ogg *.wma *.m4a *.flac *.ac3 *.dts *.aac *.amr
REM set .m3u header and generate file content.
REM %~dpfx0 for full path with d=disk, p=path, f=filename, x=file extension
echo #EXTM3U >> %CurDir%.m3u
@(for %%a in (%list%) do ((echo #EXTINF: %%a & echo %~dp0%%a & set /a cnt+=1) >> %CurDir%.m3u))
color a
echo ☺ WELL DONE ♫♪
echo %cnt% title(s) contain the file: %CurDir%.m3u
pause