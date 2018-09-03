﻿&НаСервере
Процедура ЗаписатьВСДНаСервере(Знач ДокСсылка)
	Докобъект = ДокСсылка.ПолучитьОбъект();
	Докобъект.УсловияПеревозки.Очистить();
	ДокОбъект.Записать();
	Возврат;
КонецПроцедуры


&НаСервере
Процедура кнРегионализацияНаСервере(Знач ДокСсылка)
	Обработка = ВСД.ИнициализацияОбработки();
	Если типЗнч(Обработка) = Тип("Строка") тогда
		Сообщить("Не удалось инициализировать обработку Интеграция - не получили условия для "+ДокСсылка);
		Возврат;
	КонецЕсли;
	Обработка.ПроверитьВозможностьПеремещения(ДокСсылка);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	ТВопроса = "Запросить условия перевозки в Меркурий ?";
	Ответ = Вопрос(ТВопроса,РежимДиалогаВопрос.ДаНет,0);
	Если НЕ (Ответ = КодВозвратаДиалога.Да) Тогда
		Возврат;
	КонецЕсли;
	
	Если ВСД.ЕстьреквизитОбъекта("Статус",ПараметрКоманды) Тогда
		Если СокрЛП(ВСД.ПолучитьЗначениеРевизитаОбъекта_НаСервере(ПараметрКоманды,"Статус")) = "COMPLETED" Тогда
			Предупреждение("Документ уже отправлен");
			Возврат;
		КонецЕсли;
		ЭтоОбъектВСД = Истина;
		ДокСсылка = ПараметрКоманды;
		// Транзакция
	Иначе
		ЭтоОбъектВСД = Ложь;
		// Докоснование транзакции
		ДокСсылка = ВСД.НайтиВСД(ПараметрКоманды);
		Если НЕ ЗначениеЗаполнено(ДокСсылка) Тогда
			Сообщить("Ней найден ВСД по "+ПараметрКоманды);
			Возврат;
		КонецЕсли;
	КонецЕсли;
	
	ПоказатьОповещениеПользователя("Выполняем запрос Регионализации",,"Ожидайте...",БиблиотекаКартинок.Информация32);
	// Если из журнала отправляем - закрывать его форму не нужно
	// ПараметрыВыполненияКоманды.Источник.ИмяФормы    есть ФормаСписка
	Если ЭтоОбъектВСД Тогда
		//Запишем, закроем форму, если это не форма списка
		Если Найти(ПараметрыВыполненияКоманды.Источник.ИмяФормы,"Списка") = 0 Тогда
			ПараметрыВыполненияКоманды.Источник.этаФорма.Закрыть();
		КонецЕсли; 		
	КонецЕсли;
	
	ЗаписатьВСДНаСервере(ДокСсылка);
	кнРегионализацияНаСервере(ДокСсылка);
	ПоказатьОповещениеПользователя("Выполнено");
	//ЭтаФорма.Закрыть();
	
КонецПроцедуры
