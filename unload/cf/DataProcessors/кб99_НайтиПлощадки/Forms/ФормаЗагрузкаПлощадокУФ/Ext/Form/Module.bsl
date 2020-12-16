﻿&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Объект.Организация = кб99_ВСД_Общий.ПолучитьОрганизациюПоУмолчанию();	
	ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );		
	кб99_ВСД.ЗагрузитьПараметрыВОбработку( Объект, ПараметрыОрганизации ); 			
	
	Попытка	ВыбХозСубъект = Параметры.ВыбХозСубъект; Исключение КонецПопытки;
	Попытка	
		ВыбРегион = Параметры.ВыбРегион;	
	Исключение 	
		ВыбРегион = объект.Регион;
	КонецПопытки;
	Попытка	
		НазваниеПлощадки = Параметры.ВыбНазвание;	
	Исключение 	
		НазваниеПлощадки = ВыбХозСубъект.Наименование;	
	КонецПопытки;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Объект.Площадки.Очистить();
		
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	
	СтандартнаяОбработка         = Ложь;
	Объект.Площадки.Очистить();
	
КонецПроцедуры
//*******************  Открытие/Закрыте формы окончание

&НаКлиенте
Процедура кнОтметитьВсеДокументы(Команда)
	
	Для Каждого стр Из объект.Площадки Цикл
		Если стр.Активная Тогда
			стр.Отметка = Истина;
		Иначе
			стр.Отметка = Ложь;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура кнСнятьОтметкиДокументов(Команда)
	
	Для Каждого стр Из объект.Площадки Цикл
		стр.Отметка = Ложь;
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура кнВыполнитьПоискСервер( СписокУсловий )
	
	ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );
	
	МассивПлощадок = кб99_ВСД_Запросы.Площадки_ЗагрузитьПоУсловиям( ПараметрыОрганизации, СписокУсловий );
	
	Объект.Площадки.Очистить();
	Для Каждого строкаПлощадка Из МассивПлощадок Цикл
		НоваяСтрока = Объект.Площадки.Добавить();
		ЗаполнитьЗначенияСвойств( НоваяСтрока, строкаПлощадка );
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура кнВыполнитьПоиск(Команда)
	
	СписокУсловий = Новый Соответствие;
	СписокУсловий.Вставить( "ХозСубъект", ВыбХозСубъект );
	СписокУсловий.Вставить( "Регион", ВыбРегион );
	СписокУсловий.Вставить( "Название", НазваниеПлощадки );	
	
	ПоказатьОповещениеПользователя("Выполняется загрузка Площадок",,"Ожидайте...",БиблиотекаКартинок.kb99_wrench);
	кнВыполнитьПоискСервер( СписокУсловий );
	ПоказатьОповещениеПользователя("Выполнено");
	
КонецПроцедуры

&НаСервере
Процедура кнСохранитьНаСервере()
	
	Для Каждого строкаПлощадка Из Объект.Площадки Цикл
		Если строкаПлощадка.Отметка Тогда 
			Спр = Новый("СправочникМенеджер.ВСД_Площадка");
			Если строкаПлощадка.Площадка = Справочники.ВСД_Площадка.ПустаяСсылка() Тогда 
				Объект_ВСД_Площадка = Справочники.ВСД_Площадка.СоздатьЭлемент();
			Иначе
				Объект_ВСД_Площадка = строкаПлощадка.Площадка.ПолучитьОбъект(); 
			КонецЕсли;
			Объект_ВСД_Площадка.Наименование = строкаПлощадка.Наименование;
			Объект_ВСД_Площадка.Адрес = строкаПлощадка.Адрес;
			Объект_ВСД_Площадка.GUID = строкаПлощадка.GUID;
			Объект_ВСД_Площадка.UUID = строкаПлощадка.uuid;	
			Объект_ВСД_Площадка.GUIDХозСубъекта = строкаПлощадка.ХозСубъект.GUID;
			Объект_ВСД_Площадка.ХозСубъект = строкаПлощадка.ХозСубъект;
			Объект_ВСД_Площадка.Записать();
			строкаПлощадка.Площадка = Объект_ВСД_Площадка.Ссылка;
			Сообщить("Записан ВСД_Площадка ["+Объект_ВСД_Площадка+"] GUID = "+ строкаПлощадка.Guid);				
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура кнСохранитьОтвет(Ответ,Парам) Экспорт
	
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ПоказатьОповещениеПользователя("Выполняется запись Площадок",,"Ожидайте...",БиблиотекаКартинок.kb99_wrench);
		кнСохранитьНаСервере();
		ПоказатьОповещениеПользователя("Выполнено");
	КонецЕсли;
	
КонецПроцедуры
 
&НаКлиенте
Процедура кнСохранить(Команда)
	
	Оповещение = Новый ОписаниеОповещения("кнСохранитьОтвет",ЭтаФорма);	
    ПоказатьВопрос(Оповещение, "Записать отмеченные?", РежимДиалогаВопрос.ДаНет,  0, КодВозвратаДиалога.Да, "");
	
КонецПроцедуры


