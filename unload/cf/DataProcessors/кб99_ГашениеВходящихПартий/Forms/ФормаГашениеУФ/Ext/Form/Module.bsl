﻿// Форма Гашение для УП

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Попытка
		КопироватьДанныеФормы(ВладелецФормы.Объект, Объект);
	Исключение КонецПопытки;
	
	//Объект.флСоздаватьВсдВходящий = Истина; 
	
	ЗаполнитьВсдПоСправочнику();
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	СтандартнаяОбработка         = Ложь;
	Закрыть(Объект);
КонецПроцедуры
//*******************  Открытие/Закрыте формы окончание

&НаСервере
Процедура ОтправкаЗапросовНаГашение( ПараметрыОрганизации = Неопределено ) Экспорт
	
	Отправлено = 0;
	Для Каждого СтрокаТЗ Из Объект.ВСДВходящие Цикл 
		Если НЕ(СтрокаТЗ.Отметка) Тогда
		    Продолжить;
		КонецЕсли;
		
		//Если (СтрокаТЗ.КоличествоВозврат > 0) И НЕ ЗначениеЗаполнено(СтрокаТЗ.ДокВСД) Тогда 
		//	СтрокаТЗ.ДокВСД = ЗаполнитьВСДВходящийИзТЗ(СтрокаТЗ);
		//ИначеЕсли ЗначениеЗаполнено(СтрокаТЗ.ДокВСД) Тогда
		//	СтрокаТЗ.ДокВСД = ЗаполнитьВСДВходящийИзТЗ(СтрокаТЗ); // Перезаполнить данными из ТЗ - вдруг юзер поменял все в колонках
		//КонецЕсли;

		Если НЕ ЗначениеЗаполнено(ПараметрыОрганизации) Тогда 
			ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );		
			
			ПараметрыОрганизации.Отправитель_Площадка = Объект.Отправитель_Площадка;
		КонецЕсли; 
		
		ПараметрыОрганизации.Вставить("флАктНесоответствия", флАктНесоответствия);
		ПараметрыОрганизации.Вставить("тПричинаАкта", тПричинаАкта);
		ПараметрыОрганизации.Вставить("тОписаниеНесоответствия", тОписаниеНесоответствия);
		
		//Если Объект.флСоздаватьВсдВходящий Тогда
			//или (ЗначениеЗаполнено(СтрокаТЗ.ДокВСД)) Тогда   - изменить запрос на гашение по документу
			//Если НЕ(ЗначениеЗаполнено(СтрокаТЗ.ДокВСД)) Тогда
			//    Продолжить;
			//КонецЕсли;
			//Если СтрокаТЗ.ДокВСД.Проведен Тогда
			//    Продолжить;
			//КонецЕсли;
			СтрокаТЗ.СтатусЗапроса = кб99_ВСД_Запросы.ВСД2_Входящий_ОтправитьГашение( ПараметрыОрганизации, СтрокаТЗ.ДокВСД, СтрокаТЗ.ВСД_Партия );
			СтрокаТЗ.СтатусВСД = СтрокаТЗ.ДокВСД.СтатусВСД;
		//Иначе
		//	//Если СтрокаТЗ.СтатусЗапроса = "COMPLETED" Тогда
		//	//	кб99_ВСД.СообщитьИнфо("Партия уже оформлена. uuid "+СтрокаТЗ.uuid);
		//	//	Продолжить;
		//	//КонецЕсли;
		//	СтрокаТЗ.СтатусЗапроса = кб99_ВСД_Запросы.ВСД2_Входящий_ОтправитьГашение( ПараметрыОрганизации, СтрокаТЗ, СтрокаТЗ.ВСД_Партия ); // не создаем документ ВСД2_Входящий в 1с
		//КонецЕсли;
				
		Отправлено = Отправлено + 1;
		СтрокаТЗ.Отметка = 0;
	КонецЦикла;

КонецПроцедуры // Отправка()


&НаСервере
Процедура ОрганизацияПриИзмененииНаСервере()
	
	СписокКонстант = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );
	кб99_ВСД.ЗагрузитьПараметрыВОбработку( Объект, СписокКонстант ); 
	
	ЗаполнитьВсдПоСправочнику();
	
КонецПроцедуры

&НаКлиенте
Процедура ОрганизацияПриИзменении(Элемент)
	
	Объект.ВСДВходящие.Очистить();
	ОрганизацияПриИзмененииНаСервере();
	
КонецПроцедуры

&НаКлиенте
Процедура Отправитель_ПлощадкаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)

	ГУИДХСдляОтбора = кб99_ВСД.ПолучитьЗначениеРевизитаОбъекта_НаСервере(Объект.Отправитель_ХозСубъект,"GUID");
	ГУИДХСдляОтбора = ?(ЗначениеЗаполнено(ГУИДХСдляОтбора),ГУИДХСдляОтбора,"****");
	
	СтандартнаяОбработка = Ложь;
	ЗначениеОтбора = Новый Структура("GuidХозСубъекта", ГУИДХСдляОтбора);
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,ЗначениеОтбора);	
	ОткрытьФорму("Справочник.ВСД_Площадка.ФормаВыбора", ПараметрыПодбора, Элемент);
	
КонецПроцедуры

&НаКлиенте
Процедура Отправитель_ПлощадкаПриИзменении(Элемент)
	Объект.ВСДВходящие.Очистить();
	
	ЗаполнитьВсдПоСправочнику();
	
КонецПроцедуры

// Вкладка Гашение

&НаКлиенте
Процедура ВСДВходящиеПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Отказ = Истина;
КонецПроцедуры

&НаКлиенте
Процедура кнОтметитьВсеДокументы(Команда)
	Для Каждого стр Из объект.ВСДВходящие Цикл
		стр.Отметка = Ложь;
		Если стр.СтатусЗапроса = "COMPLETED" Тогда
			Продолжить;	
		КонецЕсли;
		Если НЕ(стр.Отметка) Тогда 
			стр.Отметка = Истина;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура СнятьОтметкиДокументов(Команда)
	Для Каждого стр Из Объект.ВСДВходящие Цикл
		Если (стр.Отметка) Тогда 
			стр.Отметка = Ложь;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

&НаСервере
Процедура УдалитьВсдВходящие()
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	кб99_ВСД2.Ссылка
	               |ИЗ
	               |	Справочник.кб99_ВСД2 КАК кб99_ВСД2
	               |ГДЕ
	               |	кб99_ВСД2.Получатель_ХозСубъект = &Получатель_ХозСубъект
	               |	И кб99_ВСД2.Получатель_Площадка = &Получатель_Площадка
	               |	И кб99_ВСД2.ПометкаУдаления = ЛОЖЬ
	               |	И НЕ кб99_ВСД2.СтатусВСД ЕСТЬ NULL";
	
	Запрос.УстановитьПараметр("Получатель_ХозСубъект", Объект.Отправитель_ХозСубъект);
	Запрос.УстановитьПараметр("Получатель_Площадка", Объект.Отправитель_Площадка);
	тзВыборка = Запрос.Выполнить().Выгрузить();
	
	Для Каждого строкаВыборки ИЗ тзВыборка Цикл
		
		МенеджерЗаписи = РегистрыСведений.кб99_Запросы.СоздатьМенеджерЗаписи();
		МенеджерЗаписи.Период = ТекущаяДата();
		МенеджерЗаписи.Объект = строкаВыборки.Ссылка;
		МенеджерЗаписи.ApplicationID = "НЕТ";
		МенеджерЗаписи.СтатусЗапроса = "НЕТ";
		МенеджерЗаписи.Пользователь = ПараметрыСеанса.ТекущийПользователь;		
		МенеджерЗаписи.Записать();

	КонецЦикла;

КонецПроцедуры
	

&НаСервере
Процедура кнПолучитьВСДНаСервере()
	
	УдалитьВсдВходящие();
	
	ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );
	
	ПараметрыЗапроса = Новый Структура;
	ПараметрыЗапроса.Вставить("ПолучательПлощадка", Объект.Отправитель_Площадка);	
	ПараметрыЗапроса.Вставить("vetDocumentType", "INCOMING");	
	ПараметрыЗапроса.Вставить("vetDocumentStatus", "CONFIRMED");	
	ПараметрыЗапроса.Вставить("Смещение", 0);	
	ПараметрыЗапроса.Вставить("ПоступилиС", ВыбначалоПериода);	
	ПараметрыЗапроса.Вставить("ПоступилиПо", ВыбОкончаниеПериода);	
	ПараметрыЗапроса.Вставить("ОтправительХозСубъект", ВыбрХозСубъект);	
	ПараметрыЗапроса.Вставить("ОтправительПлощадка", ВыбрПлощадка);	
	// ПараметрыЗапроса.Вставить("ЗаписыватьДокументы", Объект.флСоздаватьВсдВходящий);	
	ПараметрыЗапроса.Вставить("ПолучательПлощадка", Объект.Отправитель_Площадка);	
	
	Запросов = 20;
	ВсдМассив = Новый Массив;
	//Результат = кб99_ВСД_Запросы.ПолучитьСписокВСД( ПараметрыОрганизации, Объект.Отправитель_Площадка, "INCOMING", "CONFIRMED", 0, ВыбначалоПериода, ВыбОкончаниеПериода, ВыбрХозСубъект, ВыбрПлощадка, Ложь, ВсдМассив );
	Результат = кб99_ВСД_Запросы.ПолучитьСписокВСД( ПараметрыОрганизации, ПараметрыЗапроса, ВсдМассив );
	Пока Результат = "REJECTED" и (Запросов > 0) Цикл
		Запросов = Запросов - 1;
		кб99_ВСД.СообщитьИнфо("Попыток запроса ВСД осталось "+Запросов);
		Результат = кб99_ВСД_Запросы.ПолучитьСписокВСД( ПараметрыОрганизации, ПараметрыЗапроса, ВсдМассив );
	КонецЦикла;
	
	Объект.ВСДВходящие.Очистить();
	Для Каждого строкаВСД Из ВсдМассив Цикл
		СтрокаВСДВходящие = Объект.ВСДВходящие.Добавить();
		ЗаполнитьЗначенияСвойств( СтрокаВСДВходящие, строкаВСД );
		//СтрокаВСДВходящие.СтатусЗапроса = "";
		
		Гашение_ЗаполнитьСтрокуПоПоступлениеТоваров( СтрокаВСДВходящие );
		
	КонецЦикла;
	
	УстановитьФильтрНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура кнПолучитьВСД(Команда)
	ПоказатьОповещениеПользователя("Выполняем запрос Входящих ВСД по "+Объект.Отправитель_Площадка,,"Ожидайте...",БиблиотекаКартинок.Информация32);
	кнПолучитьВСДНаСервере();
	ПоказатьОповещениеПользователя("Выполнено");
КонецПроцедуры

&НаКлиенте
Процедура кнПогасить(Команда)
	
	ПоказатьОповещениеПользователя("Выполняем запрос Гашения Входящих ВСД",,"Ожидайте...",БиблиотекаКартинок.Информация32);
	
	ОтправкаЗапросовНаГашение();
	
	ПоказатьОповещениеПользователя("Выполнено");	
	
КонецПроцедуры


//// ТЕСТ Раработчик
//&НаСервере
//Процедура кнЗагрузитьИзФайлаНаСервере()
//	//Объект - ДанныеФормыСтруктура, Объект.ВСДВходящие = ДанныеФормыКоллекция
//	//ФОбъект - ОбработкаОбъект
//	Фобъект = РеквизитФормыВЗначение("Объект");
//	ФОбъект.ЗагрузитьXML_ВСД2(ФОбъект.СтрИмяФайла,ФОбъект.ВСДВходящие);
//	Для Каждого стрВход Из ФОбъект.ВСДВходящие Цикл
//		стрВход.ДокВСД = ФОбъект.НайтиВСД_ВходящийпоUUID(стрВход.uuid);
//		Если значениеЗаполнено(стрВход.ДокВСД) Тогда
//			стрВход.КоличествоПринять = стрВход.ДокВСД.КоличествоПринять;
//			стрВход.КоличествоВозврат = стрВход.ДокВСД.КоличествоВозврат;
//			
//			//стрВход.ДокВозврат = ВСД.НайтиВСД_ИсходящийНаВозврат(стрВход.ДокВСД);	
//		КонецЕсли;
//	КонецЦикла;
//	
//	ЗначениеВРеквизитФормы(Фобъект,"Объект");
//КонецПроцедуры

//&НаКлиенте
//Процедура кнЗагрузитьИзФайла(Команда)
//	Объект.ВСДВходящие.Очистить();
//	кнЗагрузитьИзФайлаНаСервере();
//КонецПроцедуры

//&НаСервере
//Процедура кнЗагрузитьПартииИзФайлаНаСервере()
//	Фобъект = РеквизитФормыВЗначение("Объект");
//	ФОбъект.ЗагрузитьXML_Партии2(Объект.СтрИмяФайла);
//	ЗначениеВРеквизитФормы(Фобъект,"Объект");
//КонецПроцедуры

//&НаКлиенте
//Процедура кнЗагрузитьПартииИзФайла(Команда)
//	кнЗагрузитьПартииИзФайлаНаСервере();
//КонецПроцедуры

// ***** Соответствия
&НаСервере
Функция ПолучитьНоменклатуруПоПродукцияЭлемент(ПродукцияЭлемент, Только1элемент = Ложь)
	
	Возврат кб99_ВСД.ПолучитьНоменклатуруПоПродукцияЭлемент( ПродукцияЭлемент, Только1элемент);
	
КонецФункции

&НаСервере
Функция НайтиНоменклатуруПоРеквизиту(ВыбРеквизит,ЗначениеРеквизита)
	Рез = "";
	Запрос = Новый Запрос;
	ТекстЗапроса = "
	|Выбрать Номенклатура.Ссылка из Справочник.Номенклатура как Номенклатура 
	|где Номенклатура.@ИмяРекв = &ЗначРеквизита";
	текстЗапроса = СтрЗаменить(ТекстЗапроса,"@ИмяРекв",ВыбРеквизит);
	Запрос.Текст = ТекстЗапроса;
	Запрос.УстановитьПараметр("ЗначРеквизита", ЗначениеРеквизита);
	Попытка
		Выборка = Запрос.Выполнить().Выбрать();
		Если Выборка.Следующий() Тогда
			Рез = Выборка.Ссылка;	
		КонецЕсли;
	Исключение
		кб99_ВСД.СообщитьИнфо("Что-то пошло не так");
		кб99_ВСД.СообщитьИнфо(ОписаниеОшибки());
	КонецПопытки;
	Возврат Рез;
	
КонецФункции

&НаСервере
Процедура ОчиститьСоответствие(ВыбНоменклатура,ВСДЭлемент)
	// Вынести в ГМ
	//Набор = РегистрыСведений.ВСД_Соответсвия.СоздатьНаборЗаписей();
	//Набор.Отбор.Номенклатура.Установить(ВыбНоменклатура);
	//Набор.Отбор.Номенклатура.Использование = Истина;
	//Набор.Прочитать();
	//Набор.Очистить();
	//Набор.Записать(true);
	
	кб99_ВСД.ОчиститьСоответствие_ВСД_Продукция_Элемент( ВыбНоменклатура, ВСДЭлемент );
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьТЗСоответствий(сзПродукцияЭлементы)
	//Вынести в модуль объекта
	// Заполнение Продукция_элементом  + сразу поиск установленных соответствий
	// сзПродукцияЭлементы - Список Значений
	Объект.Соответствия.Очистить();
	тз = Объект.Соответствия.Выгрузить(); //Взяли структуру
	Для Каждого стрТз Из сзПродукцияЭлементы Цикл
		стрСоотв = тз.Добавить();
		стрСоотв.Продукция_Элемент = стрТз.Значение;//Продукция_Элемент;
		стрСоотв.Производитель = стрСоотв.Продукция_Элемент.Площадка;
		стрСоотв.Артикул = стрСоотв.Продукция_Элемент.Артикул;
		стрСоотв.GTIN = стрСоотв.Продукция_Элемент.GTIN;
		стрСоотв.Номенклатура = ПолучитьНоменклатуруПоПродукцияЭлемент(стрСоотв.Продукция_Элемент, 1);
		Если ЗначениеЗаполнено(стрСоотв.Номенклатура) Тогда
			стрСоотв.Записано = true;	
		КонецЕсли;
	КонецЦикла;
	//Свернем, т.к. могут повторяться
	тз.Свернуть("Продукция_Элемент,Номенклатура,Артикул,GTIN,Производитель,Записано","");
	Объект.Соответствия.Загрузить(тз);
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьСПоискомПоРеквизиту(ВыбРеквизит,ИмяРекв = "Артикул")
	тз = Объект.Соответствия.Выгрузить();
	Для Каждого строкаТз Из тз Цикл
		Если (строкаТз.Записано) или (ЗначениеЗаполнено(строкаТз.Номенклатура)) Тогда
			Продолжить;
		КонецЕсли;
		Если ИмяРекв = "Артикул" Тогда
		    ВыбЗначение = СокрЛП(строкаТз.Артикул);
		Иначе
		    ВыбЗначение = СокрЛП(строкаТз.GTIN);
		КонецЕсли;
		Если НЕ(ЗначениеЗаполнено(ВыбЗначение)) Тогда
			Продолжить;	
		КонецЕсли;		
		строкаТз.Номенклатура = НайтиНоменклатуруПоРеквизиту(ВыбРеквизит,ВыбЗначение);
	КонецЦикла;
	Объект.Соответствия.Загрузить(Тз);
КонецПроцедуры

//**** кнопки

&НаСервере
Процедура кнЗаполнитьТзСоответствийСервер()
	Фобъект = РеквизитФормыВЗначение("Объект");
	сзЭлементы = Новый СписокЗначений;
	сзЭлементы.ЗагрузитьЗначения(Фобъект.ВсдВходящие.ВыгрузитьКолонку("Продукция_Элемент"));
	ЗаполнитьТЗСоответствий(сзЭлементы);
КонецПроцедуры

&НаКлиенте
Процедура кнЗаполнитьТзСоответствий(Команда)
	кнЗаполнитьТзСоответствийСервер();
КонецПроцедуры

&НаСервере
Процедура кнЗаполнитьИзСправочникаНаСервере()
	// Заполним из Справочника ВСД_Продукция_Элемент
	Запрос = Новый Запрос;
	ТекстЗапроса = "ВЫБРАТЬ
	               |	ВСД_Продукция_Элемент.Ссылка
	               |ИЗ
	               |	Справочник.ВСД_Продукция_Элемент КАК ВСД_Продукция_Элемент
	               |ГДЕ
	               |	ВСД_Продукция_Элемент.ПометкаУдаления = ЛОЖЬ
	               |
	               |УПОРЯДОЧИТЬ ПО
	               |	ВСД_Продукция_Элемент.Наименование";
	Запрос.Текст = ТекстЗапроса;
	ТзВрем = Запрос.Выполнить().Выгрузить();
	сзЭлементы = Новый СписокЗначений;
	сзЭлементы.ЗагрузитьЗначения(ТзВрем.ВыгрузитьКолонку("Ссылка"));
	ЗаполнитьТЗСоответствий(сзЭлементы);
КонецПроцедуры

&НаКлиенте
Процедура кнЗаполнитьИзСправочника(Команда)
	кнЗаполнитьИзСправочникаНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура кнНайтиПоАртикулу(Команда)
	ЗаполнитьСПоискомПоРеквизиту(ИмяРеквизитаАртикул,"Артикул");
КонецПроцедуры

&НаКлиенте
Процедура кнНайтиПоШК(Команда)
	ЗаполнитьСПоискомПоРеквизиту(ИмяРеквизитаШК,"ШК");
КонецПроцедуры

&НаСервере
Процедура кнЗаписатьСоответствияНаСервере()
	тз = Объект.Соответствия.Выгрузить();
	Для Каждого строкаТз Из тз Цикл
		Если (строкаТз.Записано) или НЕ(ЗначениеЗаполнено(строкаТз.Номенклатура)) Тогда
			Продолжить;
		КонецЕсли;
		кб99_ВСД.Установить_Соответствие_ВСД_Продукция_Элемент(СтрокаТЗ.Номенклатура,СтрокаТЗ.Продукция_Элемент);
		строкаТЗ.Записано = True;
	КонецЦикла;
	Объект.Соответствия.Загрузить(Тз);
КонецПроцедуры

&НаКлиенте
Процедура кнЗаписатьСоответствия(Команда)
	кнЗаписатьСоответствияНаСервере();
КонецПроцедуры

&НаСервере
Процедура кнУбратьЗаполненныеНаСервере()
	тз = Объект.Соответствия.Выгрузить();
	Найдено = тз.Найти(True,"Записано"); 
	Пока НЕ(Найдено = Неопределено) Цикл
		тз.Удалить(Найдено);
		Найдено = тз.Найти(True,"Записано");
	КонецЦикла;
	Объект.Соответствия.Загрузить(Тз);
КонецПроцедуры

&НаКлиенте
Процедура кнУбратьЗаполненные(Команда)
	кнУбратьЗаполненныеНаСервере();
КонецПроцедуры
// События Соответствия

&НаКлиенте
Процедура СоответствияНоменклатураНачалоВыбораОтвет(Ответ,Парам) Экспорт
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ОчиститьСоответствие(Парам.Номенклатура,Парам.Продукция_Элемент);
		Парам.Номенклатура = "";
		Парам.Записано = Ложь;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура СоответствияНоменклатураНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	Если Элемент.Родитель.ТекущиеДанные.Записано Тогда
		ТекстВопроса = "Установлена связь с 
		|"+Элемент.Родитель.ТекущиеДанные.Продукция_Элемент+"
		|Отвязываем ?";
		Парам = Новый Структура("Номенклатура,Продукция_Элемент,Записано",Элемент.Родитель.ТекущиеДанные.Номенклатура,Элемент.Родитель.ТекущиеДанные.Продукция_Элемент,Элемент.Родитель.ТекущиеДанные.Записано);
    	Оповещение = Новый ОписаниеОповещения("СоответствияНоменклатураНачалоВыбораОтвет",ЭтаФорма,Парам);	
    	ПоказатьВопрос(Оповещение, ТекстВопроса, РежимДиалогаВопрос.ДаНет,  0, КодВозвратаДиалога.Да, ""   );
	КонецЕсли;
КонецПроцедуры

&НаСервере
Функция Получить_ВСД_Продукция_ЭлементНаСервере(ВыбНоменклатура)
	Возврат  кб99_ВСД.Получить_ВСД_Продукция_Элемент(ВыбНоменклатура);	
КонецФункции

&НаКлиенте
Процедура СоответствияНоменклатураПриИзмененииОтвет(Ответ,Парам) Экспорт
	Если Ответ = КодВозвратаДиалога.Нет Тогда
   		Парам.Элемент.Родитель.ТекущиеДанные.Номенклатура = "";
	Иначе
		ОчиститьСоответствие(Парам.Элемент.Родитель.ТекущиеДанные.Номенклатура,Парам.ВремПЭлемент);		
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура СоответствияНоменклатураПриИзменении(Элемент)
	ВремПЭлемент = Получить_ВСД_Продукция_ЭлементНаСервере(Элемент.Родитель.ТекущиеДанные.Номенклатура);
	Если НЕ ЗначениеЗаполнено(ВремПЭлемент) Тогда
		Элемент.Родитель.ТекущиеДанные.Записано = False;
	ИначеЕсли НЕ(ВремПЭлемент = Элемент.Родитель.ТекущиеДанные.Продукция_Элемент) Тогда
		ТекстВопроса = "Уже установлена связь с 
		|"+ВремПЭлемент+"
		|Отвязываем ?";
		Парам = Новый Структура("Элемент,ВремПЭлемент",Элемент,ВремПЭлемент);
    	Оповещение = Новый ОписаниеОповещения("СоответствияНоменклатураПриИзмененииОтвет",ЭтаФорма,Парам);	
    	ПоказатьВопрос(Оповещение, ТекстВопроса, РежимДиалогаВопрос.ДаНет,  0, КодВозвратаДиалога.Да, ""   );
		Элемент.Родитель.ТекущиеДанные.Записано = False;
	Иначе
		Элемент.Родитель.ТекущиеДанные.Записано = True;
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура СоответствияНоменклатураОчисткаОтвет(Ответ, Парам) Экспорт
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ОчиститьСоответствие(Парам.Элемент.Родитель.ТекущиеДанные.Номенклатура,Парам.Элемент.Родитель.ТекущиеДанные.Продукция_Элемент);
		Парам.Элемент.Родитель.ТекущиеДанные.Номенклатура = "";
		Парам.Элемент.Родитель.ТекущиеДанные.Записано = Ложь;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура СоответствияНоменклатураОчистка(Элемент, СтандартнаяОбработка)
	Если Элемент.Родитель.ТекущиеДанные.Записано Тогда
		СтандартнаяОбработка = Ложь;
		ТекстВопроса = "Установлена связь с 
		|"+Элемент.Родитель.ТекущиеДанные.Продукция_Элемент+"
		|Отвязываем ?";
		Парам = Новый Структура("Элемент,СтандартнаяОбработка",Элемент);
    	Оповещение = Новый ОписаниеОповещения("СоответствияНоменклатураОчисткаОтвет",ЭтаФорма,Парам);	
    	ПоказатьВопрос(Оповещение, ТекстВопроса, РежимДиалогаВопрос.ДаНет,  0, КодВозвратаДиалога.Да, ""   );
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура СоответствияПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Отказ = Истина;
КонецПроцедуры


//*****


&НаКлиенте
Процедура ВыборПериодаВСД(Период, ДополнительныеПараметры) Экспорт
	Диалог = ДополнительныеПараметры.Диалог;
	Если ЗначениеЗаполнено(Период) Тогда 
		ВыбранныйПериод = Диалог.Период;
		ВыбНачалоПериода = ВыбранныйПериод.ДатаНачала;
		ВыбокончаниеПериода = ВыбранныйПериод.ДатаОкончания;
		
		УстановитьФильтрНаСервере();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура кнВыбратьПериодВСД(Команда)
	ВыбранныйПериод = Новый СтандартныйПериод;
	Если Команда.Имя = "кнВыбратьПериодВСД" Тогда
		// Устанавливаем начальные данные
		ВыбранныйПериод.ДатаНачала = ВыбНачалоПериода;
		ВыбранныйПериод.ДатаОкончания = ВыбокончаниеПериода;
		КудаРезультат = "ВыборПериодаВСД";
	КонецЕсли;
	Диалог = Новый ДиалогРедактированияСтандартногоПериода();
	Диалог.Период = ВыбранныйПериод;
	// Не модальный вызов диалога выбора периода
		
	Диалог.Показать(Новый ОписаниеОповещения(КудаРезультат, ЭтаФорма, Новый Структура("Диалог", Диалог)));
		
КонецПроцедуры


&НаСервере
Процедура кнОформитьВходящийВСДНаСервере()
	Фобъект = РеквизитФормыВЗначение("Объект");
	ФОбъект.СоздатьВСД_ВходящиеПоТЗВходящих();
	ЗначениеВРеквизитФормы(Фобъект,"Объект");

КонецПроцедуры

&НаКлиенте
Процедура кнОформитьВходящийВСДОтвет(Ответ,Парам) Экспорт
	Если Ответ = КодВозвратаДиалога.Да Тогда
   		кнОформитьВходящийВСДНаСервере();
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура кнОформитьВходящийВСД(Команда)
   	Оповещение = Новый ОписаниеОповещения("кнОформитьВходящийВСДОтвет",ЭтаФорма);	
   	ПоказатьВопрос(Оповещение, "Создать документы в 1С ?", РежимДиалогаВопрос.ДаНет,  0, КодВозвратаДиалога.Да, ""   );
КонецПроцедуры

&НаСервере
Процедура УстановитьФильтрНаСервере()
	НомерСтроки = Объект.ВСДВходящие.Количество()-1;
	пока НомерСтроки>=0 Цикл
		ТекСтрока = Объект.ВСДВходящие[НомерСтроки];
		Если ЗначениеЗаполнено(ВыбНачалоПериода) и ТекСтрока.ВСДДата < ВыбНачалоПериода Тогда 
			кб99_ВСД.СообщитьИнфо("Отфильтрована партия "+ТекСтрока.ВСДДата+" ["+ТекСтрока.НаименованиеПродукции+"] = "+ТекСтрока.Количество );
			Объект.ВСДВходящие.Удалить(Номерстроки);			
		КонецЕсли;
		Если ЗначениеЗаполнено(ВыбОкончаниеПериода) и ТекСтрока.ВСДДата > ВыбОкончаниеПериода Тогда 
			кб99_ВСД.СообщитьИнфо("Отфильтрована партия "+ТекСтрока.ВСДДата+" ["+ТекСтрока.НаименованиеПродукции+"] = "+ТекСтрока.Количество );
			Объект.ВСДВходящие.Удалить(Номерстроки);
		КонецЕсли;
		Если ЗначениеЗаполнено(ВыбрХозСубъект) и ТекСтрока.Отправитель_Хозсубъект <> ВыбрХозСубъект Тогда 
			кб99_ВСД.СообщитьИнфо("Отфильтрована партия "+ТекСтрока.Отправитель_Хозсубъект+" ["+ТекСтрока.НаименованиеПродукции+"] = "+ТекСтрока.Количество );
			Объект.ВСДВходящие.Удалить(Номерстроки);
		КонецЕсли;
		Если ЗначениеЗаполнено(ВыбрПлощадка) и ТекСтрока.Отправитель_Площадка <> ВыбрПлощадка Тогда 
			кб99_ВСД.СообщитьИнфо("Отфильтрована партия "+ТекСтрока.Отправитель_Площадка+" ["+ТекСтрока.НаименованиеПродукции+"] = "+ТекСтрока.Количество );
			Объект.ВСДВходящие.Удалить(Номерстроки);
		КонецЕсли;
		НомерСтроки=НомерСтроки-1;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ВыбНачалоПериодаПриИзменении(Элемент)
	УстановитьФильтрНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ВыбОкончаниеПериодаПриИзменении(Элемент)
	УстановитьФильтрНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ВыбрХозСубъектПриИзменении(Элемент)
	УстановитьФильтрНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ВыбрПлощадкаПриИзменении(Элемент)
	УстановитьФильтрНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//Если Параметры.Свойство("Организация") Тогда 
	//	Объект.Организация = Параметры.Организация;
	//	ПараметрыОрганизации = ВСД.ЗагрузитьПараметры( Объект.Организация );		
	//	ВСД.ЗагрузитьПараметрыВОбработку( Объект, ПараметрыОрганизации ); 					
	//КонецЕсли;	
	
	Если Параметры.Свойство("Отправитель_ХозСубъект") Тогда 
		Если НЕ ЗначениеЗаполнено( Параметры.Отправитель_ХозСубъект ) Тогда 
			кб99_ВСД.СообщитьИнфо("Не заполнен параметр [Отправитель_ХозСубъект] для загрузки параметров");
			Возврат;			
		КонецЕсли;
		Объект.Организация = кб99_ВСД.ПолучитьОрганизациюПоХС( Параметры.Отправитель_ХозСубъект );
		
		Если НЕ ЗначениеЗаполнено(Объект.Организация) Тогда 
			кб99_ВСД.СообщитьИнфо("Не найдена организация для загрузки параметров по "+Параметры.Отправитель_ХозСубъект);
			Возврат;
		КонецЕсли;
		
		//Объект.Организация = Параметры.Организация;
		ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );		
		кб99_ВСД.ЗагрузитьПараметрыВОбработку( Объект, ПараметрыОрганизации ); 					
	КонецЕсли;

	
	
	Если Параметры.Свойство("Отправитель_Площадка") Тогда 
		
		Если НЕ ЗначениеЗаполнено( Параметры.Отправитель_Площадка ) Тогда 
			кб99_ВСД.СообщитьИнфо("Не заполнен параметр [Отправитель_Площадка]");
			Возврат;			
		КонецЕсли;
		
		Объект.Отправитель_Площадка = Параметры.Отправитель_Площадка;		
		ПараметрыОрганизации.Отправитель_Площадка = Объект.Отправитель_Площадка;
		
	КонецЕсли;
	
	//Объект.флСоздаватьВсдВходящий = Ложь; // документы не создаем
	
	Если Параметры.Свойство("ТаблицаВсдДляГашения") Тогда 
		
		Объект.ВСДВходящие.Очистить();
		Для Каждого строкаВСД Из Параметры.ТаблицаВсдДляГашения Цикл

			СтрокаВСДВходящие = Объект.ВСДВходящие.Добавить();
			СтрокаВСДВходящие.Отметка = Истина;
			ЗаполнитьЗначенияСвойств( СтрокаВСДВходящие, строкаВСД );
		КонецЦикла;
		ОтправкаЗапросовНаГашение( ПараметрыОрганизации );

	КонецЕсли;
	
	Если Объект.Организация = Справочники.Организации.ПустаяСсылка() Тогда 
			
		// заполнения по умолчению
		Объект.Организация = кб99_ВСД_Общий.ПолучитьОрганизациюПоУмолчанию();	
		ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );
		кб99_ВСД.ЗагрузитьПараметрыВОбработку( Объект, ПараметрыОрганизации ); 
				
	КонецЕсли 
	
КонецПроцедуры

&НаКлиенте
Процедура ВСДВходящиеКоличествоВозвратПриИзменении(Элемент)
	ВыбЭлемент = ЭтаФорма.Элементы.ВСДВходящие.ТекущиеДанные;
	ВыбЭлемент.КоличествоПринять = ВыбЭлемент.Количество - ВыбЭлемент.КоличествоВозврат;
	ВыбЭлемент.Отметка = Истина;
	
	ВСДВходящиеКоличествоПриИзмененииНаСервере( ВыбЭлемент.ДокВСД, ВыбЭлемент.КоличествоПринять, ВыбЭлемент.КоличествоВозврат )
	
КонецПроцедуры

&НаКлиенте
Процедура кнПереместитьПартии(Команда)
	
	тзПартий = Новый Массив;
	
	Для Каждого стрВходящие Из объект.ВСДВходящие Цикл
		Если стрВходящие.Отметка И ЗначениеЗаполнено( стрВходящие.ВСД_Партия ) Тогда 
			СтрПартий = Новый Структура("Партия, Продукция_Элемент, Количество, ЕдиницаИзмерения, Цель");
			ЗаполнитьЗначенияСвойств( СтрПартий, стрВходящие );
			СтрПартий.Партия = стрВходящие.ВСД_Партия;
			СтрПартий.Количество = стрВходящие.КоличествоПринять;
			тзПартий.Добавить( стрПартий );
		КонецЕсли;
	КонецЦикла;

	Если тзПартий.Количество()>0 Тогда 
		
		ПараметрыДокумента = кб99_ВСД.ЗагрузитьПараметры( Объект.Организация );
		ЭлементыОтбора = Новый Структура("ПараметрыДокумента, Партии", ПараметрыДокумента, тзПартий);
		ПараметрыФормы = Новый Структура("ЗначенияЗаполнения", ЭлементыОтбора);

		ОткрытьФорму("Документ.ВСД2_транзакция.ФормаОбъекта", ПараметрыФормы );
				
	Иначе
		Сообщить("нечего перемещать, ВСД_Партии не выбраны");
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьВсдПоСправочнику()
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	кб99_ВСД2.Ссылка КАК ДокВСД,
	               |	кб99_ЗапросыСрезПоследних.СтатусЗапроса,
	               |	кб99_ЗапросыСрезПоследних.Пользователь,
	               |	кб99_ЗапросыСрезПоследних.ApplicationID,
	               |	кб99_ВСД2.Отправитель_ХозСубъект,
	               |	кб99_ВСД2.Отправитель_Площадка,
	               |	кб99_ВСД2.Получатель_ХозСубъект,
	               |	кб99_ВСД2.Получатель_Площадка,
	               |	кб99_ВСД2.Количество,
	               |	кб99_ВСД2.ТтнСерия,
	               |	кб99_ВСД2.ТтнНомер,
	               |	кб99_ВСД2.ТтнДата,
	               |	кб99_ВСД2.номерАвто,
	               |	кб99_ВСД2.UUID,
	               |	кб99_ВСД2.ФормаВСД,
	               |	кб99_ВСД2.ЕдиницаИзмерения,
	               |	кб99_ВСД2.ТермическоеСостояние,
	               |	кб99_ВСД2.ОсобыеОтметки,
	               |	кб99_ВСД2.cargoInspected,
	               |	кб99_ВСД2.ВсдСерия,
	               |	кб99_ВСД2.ВсдНомер,
	               |	кб99_ВСД2.ВсдДата,
	               |	кб99_ВСД2.Продукция,
	               |	кб99_ВСД2.ВидПродукции,
	               |	кб99_ВСД2.НаименованиеПродукции,
	               |	кб99_ВСД2.Продукция_Элемент,
	               |	кб99_ВСД2.ДокументОснование,
	               |	кб99_ВСД2.ВидВСД,
	               |	кб99_ВСД2.Скоропортящийся,
	               |	кб99_ВСД2.Некачественный,
	               |	кб99_ВСД2.ТипТС,
	               |	кб99_ВСД2.Организация,
	               |	кб99_ВСД2.ДатаИзготовления,
	               |	кб99_ВСД2.ДатаСрокГодности,
	               |	кб99_ВСД2.номерПолуприцепа,
	               |	кб99_ВСД2.номерКонтейнера,
	               |	кб99_ВСД2.ТипВСД,
	               |	кб99_ВСД2.GTIN,
	               |	кб99_ВСД2.Артикул,
	               |	кб99_ВСД2.ФасовкаФормаУпаковки,
	               |	кб99_ВСД2.ФасовкаНаименование,
	               |	кб99_ВСД2.ФасовкаКоличество,
	               |	кб99_ВСД2.ФасовкаЕдиницаИзм,
	               |	кб99_ВСД2.ФасовкаОбъем,
	               |	кб99_ВСД2.ВладелецХС,
	               |	кб99_ВСД2.ТтнТип,
	               |	кб99_ВСД2.КоличествоПринять,
	               |	кб99_ВСД2.КоличествоВозврат,
	               |	кб99_ВСД2.ТермическиеУсловияПеревозки,
	               |	кб99_ВСД2.ДатаИзготовления1,
	               |	кб99_ВСД2.ДатаИзготовления2,
	               |	кб99_ВСД2.ДатаСрокГодности1,
	               |	кб99_ВСД2.ДатаСрокГодности2,
	               |	кб99_ВСД2.Страна
	               |ИЗ
	               |	Справочник.кб99_ВСД2 КАК кб99_ВСД2
	               |		ЛЕВОЕ СОЕДИНЕНИЕ РегистрСведений.кб99_Запросы.СрезПоследних КАК кб99_ЗапросыСрезПоследних
	               |		ПО кб99_ВСД2.Ссылка = кб99_ЗапросыСрезПоследних.Объект
	               |ГДЕ
	               |	кб99_ВСД2.ПометкаУдаления = ЛОЖЬ
	               |	И НЕ кб99_ЗапросыСрезПоследних.СтатусЗапроса = ""НЕТ""
	               |	И кб99_ВСД2.СтатусВСД = &ВыбСтатус
	               |	И кб99_ВСД2.Получатель_Площадка = &Получатель_Площадка";
	
	Запрос.УстановитьПараметр("ВыбСтатус", Перечисления.кб99_СтатусВСД.CONFIRMED );
	Запрос.УстановитьПараметр("Получатель_Площадка", Объект.Отправитель_Площадка );
	
	Выборка = Запрос.Выполнить().Выгрузить();
	
	
	Объект.ВСДВходящие.Очистить();
	Для Каждого строкаВыборка Из Выборка Цикл
		СтрокаВСДВходящие = Объект.ВСДВходящие.Добавить();
		ЗаполнитьЗначенияСвойств( СтрокаВСДВходящие, строкаВыборка );
		//СтрокаВСДВходящие.СтатусЗапроса = "";
		
		ГашениеЗаполнитьСтрокуТаблицы(СтрокаВСДВходящие);
				
	КонецЦикла;

КонецПроцедуры

&НаСервере
Функция Гашение_НайтиДокументПоступлениеТоваров( ДатаВходящегоДокумента, НомерВходящегоДокумента)
	
	Попытка 
		Запрос = Новый Запрос;
		Запрос.Текст = "ВЫБРАТЬ
		               |	ДокПриход.Ссылка КАК Ссылка
		               |ИЗ
		               |	Документ.ПриобретениеТоваровУслуг КАК ДокПриход
		               |ГДЕ
		               |	ДокПриход.ДатаВходящегоДокумента = &ДатаВходящегоДокумента
		               |	И ДокПриход.НомерВходящегоДокумента = &НомерВходящегоДокумента";
		Запрос.УстановитьПараметр("ДатаВходящегоДокумента", ДатаВходящегоДокумента);
		Запрос.УстановитьПараметр("НомерВходящегоДокумента", НомерВходящегоДокумента);
		тзВыборка = Запрос.Выполнить().Выгрузить();
		Если тзВыборка.Количество()>0 Тогда 
			Возврат тзВыборка[0].Ссылка;
		Иначе
			Возврат Неопределено;
		КонецЕсли 
	Исключение 
		кб99_ВСД.СообщитьИнфо("Не удалось найти документ [ПоступлениеТоваровНаСклад], измените процедуру [Гашение_НайтиДокументПоступлениеТоваров] под вашу структуру конфигурации" );
	КонецПопытки
	
КонецФункции

&НаСервере
Процедура Гашение_ЗаполнитьСтрокуПоПоступлениеТоваров( СтрокаВСДВходящие )
	
	ПереопределенныйМодуль = кб99_ВСД_Общий.ФункцияПереопределена("Гашение_ЗаполнитьСтрокуПоПоступлениеТоваров");
	Если ПереопределенныйМодуль <> Неопределено Тогда		
		ПереопределенныйМодуль.Гашение_ЗаполнитьСтрокуПоПоступлениеТоваров( СтрокаВСДВходящие );
	КонецЕсли;	
	
	Попытка
		Если ЗначениеЗаполнено(СтрокаВСДВходящие.ДокументПрихода) Тогда 
			тзТовары = СтрокаВСДВходящие.ДокументПрихода.Товары.Выгрузить();
		
			СтрокаТовары =  тзТовары.Найти( СтрокаВСДВходящие.Номенклатура, "Номенклатура ");
			Если ЗначениеЗаполнено( СтрокаТовары ) Тогда 
				СтрокаВСДВходящие.КоличествоПринято1С = СтрокаТовары.Количество;
			Иначе
				кб99_ВСД.СообщитьИнфо("Не найдена номенклатура ["+СтрокаВСДВходящие.Номенклатура+"] в документе ["+СтрокаВСДВходящие.ДокументПрихода+"]", СтрокаВСДВходящие.ДокументПрихода);
			КонецЕсли;
		КонецЕсли;
	Исключение
		кб99_ВСД.СообщитьИнфо("Не удалось найти документ ПриходнаяНакладная, переопределите функцию [Гашение_ЗаполнитьСтрокуПоПоступлениеТоваров] для Вашей конфигурации "+символы.ПС+ОписаниеОшибки());		
	КонецПопытки;
	
КонецПроцедуры


&НаСервере
Процедура ГашениеЗаполнитьСтрокуТаблицы( СтрокаВСДВходящие )
	
	СтрокаВСДВходящие.Номенклатура = кб99_ВСД.ПолучитьНоменклатуруПоПродукцияЭлемент( СтрокаВСДВходящие.Продукция_Элемент, Истина );  
	СтрокаВСДВходящие.ДокументПрихода = Гашение_НайтиДокументПоступлениеТоваров( СтрокаВСДВходящие.ДокВСД.ТтнДата, СтрокаВСДВходящие.ДокВСД.ТтнНомер );
	Если ЗначениеЗаполнено( СтрокаВСДВходящие.ДокументПрихода ) Тогда 
		Гашение_ЗаполнитьСтрокуПоПоступлениеТоваров( СтрокаВСДВходящие );
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВСДВходящиеКоличествоПриИзмененииНаСервере( ДокСсылка, КоличествоПринять, КоличествоВозврат )
	
	ДокОбъект = ДокСсылка.ПолучитьОбъект();
	ДокОбъект.КоличествоПринять = КоличествоПринять;
	ДокОбъект.КоличествоВозврат = КоличествоВозврат;
	ДокОбъект.Записать();
	
КонецПроцедуры

&НаКлиенте
Процедура ВСДВходящиеКоличествоПринятьПриИзменении(Элемент)
	ВыбСтрока = ЭтаФорма.Элементы.ВСДВходящие.ТекущиеДанные;
	ВСДВходящиеКоличествоПриИзмененииНаСервере( ВыбСтрока.ДокВСД, ВыбСтрока.КоличествоПринять, ВыбСтрока.КоличествоВозврат );
КонецПроцедуры

