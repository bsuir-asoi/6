@echo off
chcp 1251
if "%1" =="" (echo Не задан каталог & goto :eof)
if not exist %1 (echo Не сущесвует такого каталога & goto :eof)
del %1\* /s
pause