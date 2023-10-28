# ダウンロードURL
$url = "https://github.com/sigoden/aichat/releases/download/v0.8.0/aichat-v0.8.0-x86_64-pc-windows-msvc.zip"
# ダウンロードファイル保存先
$downloadPath = "$env:USERPROFILE\Downloads\aichat.zip"
# バイナリファイルの保存先フォルダ
$extractPath = "C:\aichat"
# ユーザー環境変数へ追加するパスを指定
$newEnvPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User) + ";C:\aichat"

try {
 
    Invoke-WebRequest -Uri $url -OutFile $downloadPath

    # ダウンロードしたZIPファイルを解凍
    Expand-Archive -LiteralPath $downloadPath -DestinationPath $extractPath -Force

    # 解凍したフォルダを指定の場所に移動し、名前を aichat.exe に変更
    Move-Item -LiteralPath "$extractPath\aichat.exe" -Destination $extractPath -Force

    # 環境変数に解凍したファイルのパスを追加
    [System.Environment]::SetEnvironmentVariable("Path", $newEnvPath, [System.EnvironmentVariableTarget]::User)

    Write-Output "AIChatが正常にインストールされ、環境変数に追加されました。"
} catch {
    # エラーが発生した場合、情報を表示
    Write-Error "エラーが発生しました: $_"
}
