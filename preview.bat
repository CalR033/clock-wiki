@echo off
chcp 65001 > nul
set HUGO=C:\Users\nszwt\AppData\Local\Microsoft\WinGet\Packages\Hugo.Hugo.Extended_Microsoft.Winget.Source_8wekyb3d8bbwe\hugo.exe

echo ================================
echo  時計の事典 - ローカルプレビュー
echo ================================
echo.
echo ブラウザで以下を開いてください:
echo   http://localhost:1313
echo.
echo 終了するには Ctrl+C を押してください
echo.

%HUGO% server --buildDrafts --navigateToChanged
