'*******************************************************************
' Имя: PropScript.vbs                                              
' Язык: VBScript                                        
' Описание: Вывод свойств запущенного сценария 
'*******************************************************************
Option Explicit

' Проверка режима, в котором запущен сценарий
Function IsCScript() 
  IsCScript=("c"=Mid(LCase(WScript.FullName),Len(WScript.FullName)-10,1))
End Function

' Возвращает каталог, содержащий запущенный сценарий
Function GetScriptDir()
  Dim ScriptDir
  ScriptDir = WScript.ScriptFullName
  ScriptDir = Left(ScriptDir, InstrRev(ScriptDir,"\")-1)
  GetScriptDir=ScriptDir
End Function

'*******************  Начало  **********************************/
Dim WshShell,s   ' Объявляем переменные
' Создаем объект WshShell
Set WshShell=WScript.CreateObject("WScript.Shell")
s="                   Свойства запущенного сценария:" & vbCrLf & vbCrLf
' Проверяем, в каком режиме был запущен сценарий
If IsCScript() Then
  s=s & "Запущен в консольном режиме" & vbCrLf
Else
  s=s & "Запущен в графическом режиме" & vbCrLf
End If
' Определяем остальные параметры
s=s & "Путь к серверу: " & WScript.FullName & vbCrLf
s=s & "Каталог сервера: " & WScript.Path & vbCrLf
s=s & "Версия WSH: " & WScript.Version & vbCrLf & vbCrLf
s=s & "Текущий каталог: "+ WshShell.CurrentDirectory & vbCrLf
s=s & "Путь к сценарию: " & WScript.ScriptFullName & vbCrLf
s=s & "Каталог сценария: " & GetScriptDir()  & vbCrLf
s=s & "Имя сценария: " & WScript.ScriptName & vbCrLf

WScript.Echo s   ' Выводим сформированные строки
'*************  Конец *********************************************
