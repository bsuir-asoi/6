'*****************************************************************
' Имя: Shortcut.vbs                                              
' Язык: JScript                                                 
' Описание: Создание ярлыков в специальных папках               
'*****************************************************************
Option Explicit

' Объявляем переменные
Dim WshShell,MyShortcut,PathTarg,PathIcon,Res,PathShortcut

' Создаем объект WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
' Выводим запрос для выбора папки, в которой будет создан ярлык
Res=WshShell.Popup("Где создать ярлык?" & vbCrLf & "Да  - на рабочем столе" & vbCrLf & _
  "Нет - в меню Программы",0,"Работа с ярлыками",vbQuestion+vbYesNo)
If Res=vbYes Then  ' Нажата кнопка Да
  ' Определяем путь к рабочему столу
  PathShortcut = WshShell.SpecialFolders("Desktop")
Else
  ' Определяем путь к меню Программы
  PathShortcut = WshShell.SpecialFolders("Programs")
End If

' Создаем объект-ярлык
Set MyShortcut = WshShell.CreateShortcut(PathShortcut+"\Мой ярлык.lnk")
' Устанавливаем путь к файлу
PathTarg=WshShell.ExpandEnvironmentStrings("%windir%\\notepad.exe")
MyShortcut.TargetPath = PathTarg
' Назначаем комбинацию горячих клавиш
MyShortcut.Hotkey = "CTRL+ALT+N"
' Выбираем иконку из файла SHELL32.dll
PathIcon = _
  WshShell.ExpandEnvironmentStrings("%windir%\system32\SHELL32.dll")
MyShortcut.IconLocation = PathIcon & ", 1"
MyShortcut.WindowStyle=3  ' Устанавливаем тип окна (максимизировано)
MyShortcut.Save   ' Сохраняем ярлык
WScript.Echo "Ярлык создан|"
'*************  Конец *********************************************
