'*******************************************************************
' Имя: Popup.vbs                                              
' Язык: VBcript        
' Описание: Пример использования метода WshShell.Popup
'*******************************************************************
Option Explicit

Dim WshShell,Res,Text,Title  ' Объявляем переменные
' Создаем объект WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
Text="Пример вывода строк в диалоговое" & vbCrLf & "окно WScript"
Title="Заголовок"
' Выводим диалоговое окно на экран
Res=WshShell.Popup(Text,0,Title,vbOkCancel)
' Определяем, какая из кнопок была нажата в диалоговом окне
If (Res=vbOk) Then
  WshShell.Popup "Нажата кнопка OK"
Else
  WshShell.Popup "Нажата кнопка Отмена"
End If
'*************  Конец *********************************************
