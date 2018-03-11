'********************************************************************
' Имя: ListNetworkResources.vbs                                        
' Язык: JScript                                                    
' Описание: Вывод подключенных сетевых ресурсов (диски и принтеры)  
'********************************************************************
Option Explicit

Dim WshNetwork,s,NetwDrives,i,NetwPrinters  ' Объявляем переменные

' Создаем объект WshNetwork
Set WshNetwork = WScript.CreateObject("WScript.Network")

'********   Вывод списка всех подключенных сетевых дисков   *********
s="Подключенные сетевые диски:" & vbCrLf & vbCrLf
' Создаем коллекцию с данными о подключенных дисках
Set NetwDrives = WshNetwork.EnumNetworkDrives()
i=0
While i<=NetwDrives.Count()-2  ' Перебираем элементы коллекции
  ' В первом элементе коллекции содержится буква диска,
  ' во втором - сетевое имя ресурса и т.д.
  s=s & NetwDrives.Item(i) & "  " & NetwDrives.Item(i+1) & vbCrLf
  i=i+2
Wend
WScript.Echo s   ' Выводим сформированные строки на экран

'********    Вывод списка всех подключенных сетевых принтеров    *******
s="Подключенные сетевые принтеры:" & vbCrLf & vbCrLf
' Создаем коллекцию с данными о подключенных принтерах
Set NetwPrinters = WshNetwork.EnumPrinterConnections()
i=0
While i<=NetwPrinters.Count()-2   ' Перебираем элементы коллекции
  ' В первом элементе коллекции содержится названия локальных портов,
  ' во втором - сетевое имя принтера и т.д.
  s=s & NetwPrinters.Item(i) & "  " & NetwPrinters.Item(i+1) & vbCrLf
  i=i+2
Wend
WScript.Echo s  'Выводим сформированные строки на экран
'*************  Конец *********************************************
