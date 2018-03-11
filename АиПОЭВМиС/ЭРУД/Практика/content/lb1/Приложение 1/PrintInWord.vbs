'*******************************************************************
' Имя: PrintInWord.vbs                                             
' Язык: VBScript                                                   
' Описание: Использование из сценария внешнего объекта           
'           автоматизации (Microsoft Word)                       
'*******************************************************************
Option Explicit

Dim WA,WD,Sel  ' Объявляем переменные
'Создаем объект--приложение Microsoft Word
Set WA=WScript.CreateObject("Word.Application")
' Можно было использовать конструкцию
' Set WA=CreateObject("Word.Application")

Set WD=WA.Documents.Add  'Создаем новый документ (объект Document)
WA.Visible=true  ' Делаем Word видимым
Set Sel=WA.Selection  'Создаем объект Selection
Sel.Font.Size=14 'Устанавливаем размер шрифта
Sel.ParagraphFormat.Alignment=1  'Выравнивание по центру
Sel.Font.Bold=true  'Устанавливаем полужирный шрифт
Sel.TypeText "Привет!" & vbCrLf  'Печатаем строку текста
Sel.Font.Bold=false  'Отменяем полужирный шрифт
Sel.ParagraphFormat.Alignment=0  'Выравнивание по левому краю
'Печатаем строку текста
Sel.TypeText "Эти строки напечатаны с помощью WSH."
WD.PrintOut   'Выводим документ на принтер
'*************  Конец *********************************************
