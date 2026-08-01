@echo off
chcp 65001 >nul
cd /d D:\study\coding\github
echo ======================================
echo        一键同步站点到Github仓库
echo 目录：D:\study\coding\github
echo ======================================
echo.

:: 循环轮换重命名py文件 2.py ↔ 3.py ↔4.py ↔5.py ↔1.py
set "pyfile="
if exist "1.py" set pyfile=1.py
if exist "2.py" set pyfile=2.py
if exist "3.py" set pyfile=3.py
if exist "4.py" set pyfile=4.py
if exist "5.py" set pyfile=5.py

if defined pyfile (
    echo 🔄 轮换重命名文件【%pyfile%】制造文件变更标记
    if "%pyfile%"=="1.py" ren "1.py" "2.py"
    if "%pyfile%"=="2.py" ren "2.py" "3.py"
    if "%pyfile%"=="3.py" ren "3.py" "4.py"
    if "%pyfile%"=="4.py" ren "4.py" "5.py"
    if "%pyfile%"=="5.py" ren "5.py" "1.py"
) else (
    echo ⚠️ 未找到1~5.py，自动新建 1.py
    echo print("这个代码用于更新流程") > 1.py
)
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
    echo ⚠️ 推送出错
    echo 打开仓库网页进行手动操作
    start https://github.com/LuciferTzzz/LuciferTzzz.github.io
)

echo.
pause