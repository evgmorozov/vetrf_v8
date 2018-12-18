﻿
&НаКлиенте
Процедура ПриОткрытии(Отказ)
 	ЭлементОтбора = ЭтаФорма.дсСоответствия.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("ПродукцияЭлемент");
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно; 
	ЭлементОтбора.РежимОтображения = РежимОтображенияЭлементаНастройкиКомпоновкиДанных.БыстрыйДоступ; // Опционально
	ЭлементОтбора.ПравоеЗначение = Объект.Ссылка;
КонецПроцедуры

&НаКлиенте
Процедура дсСоответствияПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
    Отказ = Истина;
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора", Истина, Истина);	
	ОткрытьФорму("Справочник.Номенклатура.ФормаВыбора", ПараметрыПодбора, Элементы.дсСоответствия);
КонецПроцедуры

&НаКлиенте
Процедура дсСоответствияОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	ВСД.Установить_Соответствие_ВСД_Продукция_Элемент(ВыбранноеЗначение,Объект.Ссылка);
	Элементы.дсСоответствия.Обновить();
КонецПроцедуры
