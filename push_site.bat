@echo off
chcp 65001 >nul
cd /d D:\study\coding\github
echo ======================================
echo        一键同步站点到Github仓库
echo 目录：D:\study\coding\github
echo ======================================
echo.

:: 判断是否是git仓库
if not exist ".git" (
    echo ❌ 当前目录不是Git仓库！
    echo 即将打开浏览器仓库页面
    start https://github.com/LuciferTzzz/LuciferTzzz.github.io
    pause
    exit
)

git add .
git commit -m "站点内容自动更新 %date% %time%"
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ✅ 推送成功！等待Github Pages部署生效
) else (
    echo.
    echo ⚠️ 没有文件变更 或者 推送出错
    echo 打开仓库网页进行手动操作
    start https://github.com/LuciferTzzz/LuciferTzzz.github.io
)

echo.
pause