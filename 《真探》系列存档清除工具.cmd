@echo off
title 《真探》系列存档清除工具

:main
set user_input=
cls
echo.
echo 《真探》系列存档清除工具
echo.
echo 1、真探
echo 2、真探2
echo Q、退出工具
echo.
set /p user_input=请选择游戏版本：
if not defined user_input goto:main
if %user_input% equ 1 set games=CaseCracker
if %user_input% equ 2 set games=CaseCracker2
if %user_input% equ Q exit
if %user_input% equ q exit
if not defined games goto:main
if %games% equ CaseCracker set game_name=真探
if %games% equ CaseCracker2 set game_name=真探2

cd %localappdata%Low\BlackRobe\%games%\Save

title 《%game_name%》存档清除工具
set s_tip=清除操作已取消
set del_save_status=×
set del_note_status=×

:menu_save
set user_input=
cls
set /p user_input=此操作将清除游戏存档，确认继续吗？（Y/[N]）：
if not defined user_input goto:finish
if %user_input% equ Y goto del_save
if %user_input% equ y goto del_save
goto finish

:del_save
ren Note.sav Note.bak
del *.sav
del PreHelpContent
del *.vdf
ren Note.bak Note.sav
set s_tip=您选择的内容已清除
set del_save_status=√

:menu_note
set user_input=
cls
set /p user_input=已清除存档，是否同时删除笔记？（Y/[N]）：
if not defined user_input goto:finish
if %user_input% equ Y goto del_note
if %user_input% equ y goto del_note
goto finish

:del_note
del *.sav
set s_tip=全部内容已清除
set del_note_status=√

:finish
cls
echo %s_tip%
if %s_tip% equ 清除操作已取消 goto  skip_status
echo 》存档..........%del_save_status%
echo 》笔记..........%del_note_status%
:skip_status
pause
exit
