'********************************************************************
' Имя: NetworkParam.vbs                                        
' Язык: VBScript                                                    
' Описание: Вывод сетевых параметров станции            
'********************************************************************
Option Explicit

Dim WshNetwork,s,NetwDrives,i,NetwPrinters  ' Объявляем переменные

' Создаем объект WshNetwork
Set WshNetwork = WScript.CreateObject("WScript.Network")

s="Сетевые параметры станции:" & vbCrLf & vbCrLf
' Выводим на экран свойства ComputerName, UserName и UserDomain
s=s & "Имя машины: " & WshNetwork.ComputerName & vbCrLf
s= s & "Имя пользователя: " & WshNetwork.UserName & vbCrLf
s= s & "Домен: " & WshNetwork.UserDomain
WScript.Echo s
'*************  Конец *********************************************
