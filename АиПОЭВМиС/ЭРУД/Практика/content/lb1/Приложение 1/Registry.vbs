'********************************************************************
' Имя: Registry.vbs                                                 
' Язык: VBScript                                                    
' Описание: Работа с системным реестром                            
'********************************************************************
Option Explicit

'Объявляем переменные
Dim WshShell,Root,Key,Res,SValue,ValueName,SRegValue

Root="HKEY_CURRENT_USER"   'Корневой ключ
Key="\ExampleKey\"         'Новый ключ
ValueName="ExampleValue"   'Имя нового параметра
SValue="Value from WSH"    'Значение нового параметра

'Создаем объект WshShell
Set WshShell=WScript.CreateObject("WScript.Shell")

'Запрос на создание нового ключа
Res=WshShell.Popup("Создать ключ" & vbCrLf & Root & Key & "?",0,_
  "Работа с реестром",vbQuestion+vbYesNo)
If Res=vbYes Then   'Нажата кнопка Да
  'Записываем новый ключ
  WshShell.RegWrite Root & Key, ""
  WshShell.Popup "Ключ" & vbCrLf & Root & Key & " создан!",0,_
    "Работа с реестром",vbInformation+vbOkOnly
End If

'Запрос на запись нового параметра
Res=WshShell.Popup("Записать параметр" & vbCrLf & Root & Key & _
  ValueName & "?",0,"Работа с реестром",vbQuestion+vbYesNo)
If Res=vbYes Then   'Нажата кнопка Да
  'Записываем новый строковый параметр
  WshShell.RegWrite Root & Key & ValueName,SValue,"REG_SZ"
  WshShell.Popup "Параметр" & vbCrLf & Root & Key & _
    ValueName & " записан!",0,"Работа с реестром",vbInformation+vbOkOnly
  'Считываем значение созданного параметра
  SRegValue=WshShell.RegRead(Root & Key & ValueName)
  'Выводим на экран полученное значение
  WshShell.Popup Root & Key & ValueName & "=" & SRegValue,0,_
    "Работа с реестром",vbInformation+vbOkOnly
End If

'Запрос на удаление параметра
Res=WshShell.Popup("Удалить параметр" & vbCrLf & Root & Key & _
  ValueName & "?",0,"Работа с реестром",vbQuestion+vbYesNo)
If Res=vbYes Then   'Нажата кнопка Да
  'Удаляем параметр
  WshShell.RegDelete Root & Key & ValueName
  WshShell.Popup "Параметр" & vbCrLf & Root & Key & _
    ValueName & " удален!",0,"Работа с реестром",vbInformation+vbOkOnly
End If

'Запрос на удаление раздела
Res=WshShell.Popup("Удалить раздел" & vbCrLf & Root & Key & _
  "?",0,"Работа с реестром",vbQuestion+vbYesNo)
If Res=vbYes Then   'Нажата кнопка Да
  'Удаляем раздел
  WshShell.RegDelete Root & Key
  WshShell.Popup "Раздел" & vbCrLf & Root & Key & " удален!",0,_
    "Работа с реестром",vbInformation+vbOkOnly
End If
'*************  Конец *********************************************
