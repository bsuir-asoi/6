'*******************************************************************
' Имя: Quit.vbs
' Язык: VBScript
' Описание: Выход из сценария с заданным кодом завершения
'*******************************************************************
Option Explicit

Dim WshShell,Res,Text,Title  ' Объявляем переменные
' Создаем объект WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
Text="Выберите кнопку для завершения сценария"
Title="Диалоговое окно"
' Выводим диалоговое окно на экран
Res=WshShell.Popup(Text,0,Title,vbOkCancel)
If Res=1 Then
  WScript.Quit 1
Else
  WScript.Quit 0
End If
'*************  Конец *********************************************
