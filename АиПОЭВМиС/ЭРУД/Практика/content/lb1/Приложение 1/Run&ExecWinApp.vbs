'*******************************************************************
' Имя: Run&ExecWinApp.vbs                             
' Язык: VBScript                                                   
' Описание: Запуск двух приложений и обмен данными между ними     
'*******************************************************************
Option Explicit

Dim WshShell, theCalculator  ' Объявляем переменные
' Создаем объект WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
WScript.Echo("Запускаем калькулятор и" & vbCrLf & "считаем 1+2")
' Создаем объект WshScript (запускаем Калькулятор)
Set theCalculator = WshShell.Exec("calc")
' Приостанавливаем выполнение сценария, для того, чтобы
' окно Калькулятора успело появиться на экране
WScript.Sleep 500
' Активизируем окно Калькулятора
WshShell.AppActivate theCalculator.ProcessID
' Посылаем нажатия клавиш в окно Калькулятора
WshShell.SendKeys "1{+}"
WshShell.SendKeys "2"
WshShell.SendKeys "~"    ' Клавиша <Enter>
WScript.Sleep 500
' Копируем результат вычисления в буфер Windows (<Ctrl>+C)
WshShell.SendKeys "^c"
' Выводим сообщение (активное окно меняется)
WScript.Echo "Закрываем калькулятор"
' Активизируем окно Калькулятора
WshShell.AppActivate theCalculator.ProcessID
' Закрываем окно Калькулятора (<Alt>+<F4>)
WshShell.SendKeys "%{F4}"
WScript.Echo "Запускаем Блокнот и копируем туда результат"
WshShell.Run "notepad"     ' Запускаем Блокнот
' Приостанавливаем выполнение сценария, для того, чтобы
' окно Блокнота успело появиться на экране
WScript.Sleep 1000
WshShell.AppActivate "notepad"    ' Активизируем окно Блокнота
' Посылаем нажатия клавиш в окно Блокнота
WshShell.SendKeys "1{+}2="
' Вставляем содержимое буфера Windows (<Ctrl>+V)
WshShell.SendKeys "^v"
' Выводим в окно Блокнота оставшуюся информацию
WshShell.SendKeys " {(}c{)} Calculator"
'*************  Конец *********************************************
