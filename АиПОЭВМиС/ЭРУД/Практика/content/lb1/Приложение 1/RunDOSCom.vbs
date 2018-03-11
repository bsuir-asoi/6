'*******************************************************************
' Имя: RunDOSCom.vbs                                               
' Язык: VBScript                                                   
' Описание: Выполнение внутренних команд DOS                      
'*******************************************************************
Option Explicit

Dim WshShell, Code   ' Объявляем переменные
' Создаем объект WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
' Запускаем внутреннюю команду COPY
WshShell.Run "%COMSPEC% /k copy /?",1
' Запускаем внутреннюю команду DIR
WshShell.Run "%COMSPEC% /c dir %WINDIR% > windir.txt",1
'*************  Конец *********************************************/
