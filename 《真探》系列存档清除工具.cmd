@echo off
title ����̽��ϵ�д浵�������

:main
set user_input=
cls
echo.
echo ����̽��ϵ�д浵�������
echo.
echo 1����̽
echo 2����̽2
echo Q���˳�����
echo.
set /p user_input=��ѡ����Ϸ�汾��
if not defined user_input goto:main
if %user_input% equ 1 set games=CaseCracker
if %user_input% equ 2 set games=CaseCracker2
if %user_input% equ Q exit
if %user_input% equ q exit
if not defined games goto:main
if %games% equ CaseCracker set game_name=��̽
if %games% equ CaseCracker2 set game_name=��̽2

cd %localappdata%Low\BlackRobe\%games%\Save

title ��%game_name%���浵�������
set s_tip=���������ȡ��
set del_save_status=��
set del_note_status=��

:menu_save
set user_input=
cls
set /p user_input=�˲����������Ϸ�浵��ȷ�ϼ����𣿣�Y/[N]����
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
set s_tip=��ѡ������������
set del_save_status=��

:menu_note
set user_input=
cls
set /p user_input=������浵���Ƿ�ͬʱɾ���ʼǣ���Y/[N]����
if not defined user_input goto:finish
if %user_input% equ Y goto del_note
if %user_input% equ y goto del_note
goto finish

:del_note
del *.sav
set s_tip=ȫ�����������
set del_note_status=��

:finish
cls
echo %s_tip%
if %s_tip% equ ���������ȡ�� goto  skip_status
echo ���浵..........%del_save_status%
echo ���ʼ�..........%del_note_status%
:skip_status
pause
exit

