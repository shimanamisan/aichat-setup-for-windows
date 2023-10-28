@echo off

:: 管理者権限で実行されているか確認する
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo 管理者権限で実行してください。
    pause
    exit
)

:: 現在のスクリプトのディレクトリを取得
set "scriptPath=%~dp0setup.ps1"

PowerShell.exe -ExecutionPolicy RemoteSigned -File "%scriptPath%"
pause
