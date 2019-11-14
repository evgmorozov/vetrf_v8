﻿// Использование модулей конфигурации
//Пример
//Функция СведенияОбАдресе(Адрес, ДополнительныеПараметры = Неопределено) Экспорт
//	Если Метаданные.ОбщиеМодули.Найти("РаботаСАдресами") <> Неопределено Тогда
//		МодульРаботаСАдресами = ОбщегоНазначения.ОбщийМодуль("РаботаСАдресами");
//		Возврат МодульРаботаСАдресами.СведенияОбАдресе(Адрес, ДополнительныеПараметры);
//	КонецЕсли;
// БП 3.0
// 		СведенияОПлательщике      = БухгалтерскийУчетПереопределяемый.СведенияОЮрФизЛице(СведенияОДокументе.Плательщик,      СведенияОДокументе.ДатаДляПолученияСведений);
//		СписокПлательщик = "НаименованиеДляПечатныхФорм,ИНН,Свидетельство,ЮридическийАдрес,Телефоны,НомерСчета,Банк,БИК,КоррСчет";
//		ПараметрыЗаполнения = Новый Структура;
//		ПараметрыЗаполнения.Вставить("ПредставлениеПлательщика", ОбщегоНазначенияБПВызовСервера.ОписаниеОрганизации(СведенияОПлательщике, СписокПлательщик));


// Возвращает серверный модуль менеджера по имени объекта.
//из типовой БП3   - получение нужного модуля конфы
Функция СтрРазделить82(Имя,знакДелителя)
	Рез = Новый СписокЗначений;
	Рез.Вставить("имя",имя);
	Возврат Рез;	
КонецФункции

Функция СерверныйМодульМенеджера(Имя)
	ОбъектНайден = Ложь;
	
	ЧастиИмени = СтрРазделить82(Имя, ".");
	Если ЧастиИмени.Количество() = 2 Тогда
		
		ИмяВида = ВРег(ЧастиИмени[0]);
		ИмяОбъекта = ЧастиИмени[1];
		
		Если ИмяВида = ВРег("Константы") Тогда
			Если Метаданные.Константы.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыСведений") Тогда
			Если Метаданные.РегистрыСведений.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыНакопления") Тогда
			Если Метаданные.РегистрыНакопления.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыБухгалтерии") Тогда
			Если Метаданные.РегистрыБухгалтерии.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("РегистрыРасчета") Тогда
			Если Метаданные.РегистрыРасчета.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Справочники") Тогда
			Если Метаданные.Справочники.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Документы") Тогда
			Если Метаданные.Документы.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Отчеты") Тогда
			Если Метаданные.Отчеты.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Обработки") Тогда
			Если Метаданные.Обработки.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("БизнесПроцессы") Тогда
			Если Метаданные.БизнесПроцессы.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ЖурналыДокументов") Тогда
			Если Метаданные.ЖурналыДокументов.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("Задачи") Тогда
			Если Метаданные.Задачи.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыСчетов") Тогда
			Если Метаданные.ПланыСчетов.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыОбмена") Тогда
			Если Метаданные.ПланыОбмена.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыВидовХарактеристик") Тогда
			Если Метаданные.ПланыВидовХарактеристик.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		ИначеЕсли ИмяВида = ВРег("ПланыВидовРасчета") Тогда
			Если Метаданные.ПланыВидовРасчета.Найти(ИмяОбъекта) <> Неопределено Тогда
				ОбъектНайден = Истина;
			КонецЕсли;
		КонецЕсли;
		
	КонецЕсли;
	
	Если Не ОбъектНайден Тогда
		ВызватьИсключение("ОШИБКА ПОЛУЧЕНИЯ МОДУЛЯ");
//		ВызватьИсключение СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(
//			НСтр("ru = 'Объект метаданных ""%1"" не найден,
//			|либо для него не поддерживается получение модуля менеджера.'"), Имя);
	КонецЕсли;
	
	Модуль = Вычислить(Имя); // ВычислитьВБезопасномРежиме не требуется, т.к. проверка надежная.
	
	Возврат Модуль;
КонецФункции

Функция ОбщийМодуль(Имя) Экспорт
	Попытка	
		Если Метаданные.ОбщиеМодули.Найти(Имя) <> Неопределено Тогда
			Модуль = Вычислить(Имя); // ВычислитьВБезопасномРежиме не требуется, т.к. проверка надежная.
		ИначеЕсли СтрЧислоВхождений(Имя, ".") = 1 Тогда
			Возврат СерверныйМодульМенеджера(Имя);
		Иначе
			Модуль = Неопределено;
		КонецЕсли;
	
		Если ТипЗнч(Модуль) <> Тип("ОбщийМодуль") Тогда			
			//ВызватьИсключение("ОШИБКА ПОЛУЧЕНИЯ МОДУЛЯ");//ПодставитьПараметрыВСтроку(НСтр("ru = 'Общий модуль ""%1"" не найден.'"), Имя);
		КонецЕсли;
	Исключение
		ВСД.СообщитьИнфо("Ошибка получения модуля Типовой конфигурации "+Имя+" "+ОписаниеОшибки());
		Возврат Неопределено;
	КонецПопытки;
	
	Возврат Модуль;
	
КонецФункции

Функция ПолучитьОрганизациюПоУмолчанию() Экспорт
	НазваниеКонфигурации = Метаданные.Имя;
	Версия = Лев(Метаданные.Версия,2);
	
	_Организация = Справочники.Организации.ПустаяСсылка();

	//БП 3	Организация = БухгалтерскийУчетПереопределяемый.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
	//УПП         Организация   =  УправлениеПользователями.ПолучитьЗначениеПоУмолчанию(глЗначениеПеременной("глТекущийПользователь"),"ОсновнаяОрганизация");
	
	Если Метаданные.Имя = "УправлениеТорговлей" Тогда 
		Если Версия="11" Тогда 
			
			МодульТиповойКонфы = ОбщийМодуль("ЗначениеНастроекПовтИсп");
			_Организация = МодульТиповойКонфы.ПолучитьОрганизациюПоУмолчанию( _Организация );
			
			Если НЕ ЗначениеЗаполнено( _Организация ) Тогда 
				Попытка
					// В УТ 11 Засада, добавим регистр сведений для определения основной организации
					Запрос = Новый Запрос;
					Запрос.Текст = "ВЫБРАТЬ
					               |	ВСД_ОрганизацияПоУмолчанию.Организация
					               |ИЗ
					               |	РегистрСведений.ВСД_ОрганизацияПоУмолчанию КАК ВСД_ОрганизацияПоУмолчанию
					               |ГДЕ
					               |	ВСД_ОрганизацияПоУмолчанию.Пользователь = &ВыбПользователь";
					Запрос.УстановитьПараметр("ВыбПользователь", ПараметрыСеанса.АвторизованныйПользователь);	
					Выборка = Запрос.Выполнить().Выбрать();
					Если Выборка.Следующий() Тогда
						_Организация =  Выборка.Организация;
					КонецЕсли;
				Исключение 
					//Сообщить(ОписаниеОшибки());
				КонецПопытки;				
			КонецЕсли;
		Иначе //УТ 10			
			МодульТиповойКонфы = ОбщийМодуль("УправлениеПользователями");
			ТекПользователь = ПараметрыСеанса.ТекущийПользователь;
			//МодульТиповойКонфы2 = ОбщийМодуль("ГлобальныйМодуль");
			//ТекПользователь = МодульТиповойКонфы2.глЗначениеПеременной("глТекущийПользователь");// ИмяПользователя();
			_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию(ТекПользователь,"ОсновнаяОрганизация");
		КонецЕсли 
	ИначеЕсли Метаданные.Имя = "БухгалтерияПредприятия" Тогда 
		Если Версия = "3." Тогда 
			//БП 3.0
			МодульТиповойКонфы = ОбщийМодуль("БухгалтерскийУчетПереопределяемый");
			_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
		Иначе
			// Версия = 2
			МодульТиповойКонфы = ОбщийМодуль("ОбщегоНазначения");
			_Организация = МодульТиповойКонфы.ПолучитьЗначениеПеременной("ОсновнаяОрганизация");
			//_Организация = глЗначениеПеременной("ОсновнаяОрганизация");
			
		КонецЕсли;
		
	ИначеЕсли Метаданные.Имя = "УправлениеПроизводственнымПредприятием" Тогда 		
		//УПП
		МодульТиповойКонфы = ОбщийМодуль("УправлениеПользователями");
		ТекПользователь = ПараметрыСеанса.ТекущийПользователь;
		//МодульТиповойКонфы2 = ОбщийМодуль("ГлобальныйМодуль");
		//МодульТиповойКонфы2.глЗначениеПеременной("глТекущийПользователь");// ИмяПользователя();
		_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию(ТекПользователь,"ОсновнаяОрганизация");
		
	Иначе
		Попытка				
			Если Метаданные.ОбщиеМодули.Найти("БухгалтерскийУчетПереопределяемый") <> Неопределено Тогда
				//БП 3.0
				МодульТиповойКонфы = ОбщийМодуль("БухгалтерскийУчетПереопределяемый");
				_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
			ИначеЕсли Метаданные.ОбщиеМодули.Найти("УправлениеПользователями") <> Неопределено Тогда
				//УПП
				МодульТиповойКонфы = ОбщийМодуль("УправлениеПользователями");
				ТекПользователь = ПараметрыСеанса.ТекущийПользователь;
				//МодульТиповойКонфы2 = ОбщийМодуль("ГлобальныйМодуль");
				//МодульТиповойКонфы2.глЗначениеПеременной("глТекущийПользователь");// ИмяПользователя();							
				_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию(ТекПользователь,"ОсновнаяОрганизация");
			Иначе
				ВСД.СообщитьИнфо("Для данной конфигурации 1С не удалось получить значение Организации по умолчанию, обратитесь в тех.поддержку КБ99");
			КонецЕсли;
		Исключение
			ВСД.СообщитьИнфо("Для данной конфигурации 1С не удалось получить значение Организации по умолчанию, обратитесь в тех.поддержку КБ99");
			ВСД.СообщитьИнфо(ОписаниеОшибки());
		КонецПопытки;
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено( _Организация ) Тогда 
		Запрос = Новый Запрос;
		Запрос.Текст = "ВЫБРАТЬ РАЗРЕШЕННЫЕ ПЕРВЫЕ 2
		               |	Организации.Ссылка КАК Организация
		               |ИЗ
		               |	Справочник.Организации КАК Организации
		               |ГДЕ
		               |	Организации.ПометкаУдаления = ЛОЖЬ";
		Выборка = Запрос.Выполнить().Выбрать();
		Если Выборка.Следующий() Тогда
			_Организация =  Выборка.Организация;
		КонецЕсли;
	КонецЕсли;
	
	Возврат _Организация;
КонецФункции

Функция ПараметрыСервер( ФОбъект ) Экспорт
	
	//Параметры = Новый Соответствие(); // т.к. во всех запросах Параметры = Соответствие()
	Параметры = Новый("Структура");   // Соответсвие ? Структура
	
	Если НЕ ЗначениеЗаполнено(ФОбъект.КаталогИнтеграции) Тогда 
		ФОбъект.КаталогИнтеграции = КаталогПрограммы();
		ФОбъект.КаталогЛогов = ФОбъект.КаталогИнтеграции + "logs\";
	Иначе
		Если Прав(ФОбъект.КаталогИнтеграции,1)<>"\" Тогда 
			ФОбъект.КаталогИнтеграции = ФОбъект.КаталогИнтеграции+"\";
			ФОбъект.КаталогЛогов = ФОбъект.КаталогИнтеграции + "logs\";
		КонецЕсли;			
	КонецЕсли;
	//Если НЕ ЗначениеЗаполнено(Объект.ПолноеИмяФайлаОбработки) Тогда 
	//	Объект.ПолноеИмяФайлаОбработки = Объект.КаталогИнтеграции + "Интеграция_ГИС_Меркурий.epf";
	//КонецЕсли;
	
	Параметры.Вставить("Организация", ФОбъект.Организация );
	
	Параметры.Вставить("КаталогИнтеграции", ФОбъект.КаталогИнтеграции );
	Параметры.Вставить("КаталогЛогов", ФОбъект.КаталогЛогов );
	//Параметры.Вставить("ПолноеИмяФайлаОбработки", ФОбъект.КаталогИнтеграции );
		
	//Параметры.Вставить("ПолноеИмяФайлаОбработки", ФОбъект.ПолноеИмяФайлаОбработки);		
	//Параметры.Вставить("ПолноеИмяФайлаПереопределения", ФОбъект.ПолноеИмяФайлаПереопределения);		
		
	Параметры.Вставить("param_username", ФОбъект.param_username);
	Параметры.Вставить("param_password", ФОбъект.param_password);
	Параметры.Вставить("param_issuer_id", ФОбъект.param_issuer_id);
	Параметры.Вставить("param_service_id", ФОбъект.param_service_id);
	Параметры.Вставить("param_api_key", ФОбъект.param_api_key);
	Параметры.Вставить("param_intiator_login", ФОбъект.param_intiator_login);
	Параметры.Вставить("param_vetdoctor_login", ФОбъект.param_vetdoctor_login);
	Параметры.Вставить("param_vetdoctor_fio", ФОбъект.param_vetdoctor_fio);	
	Параметры.Вставить("param_vetdoctor_post", ФОбъект.param_vetdoctor_post);	
	
	Параметры.Вставить("Отправитель_Площадка", ФОбъект.Отправитель_Площадка);
	Параметры.Вставить("Отправитель_ХозСубъект", ФОбъект.Отправитель_ХозСубъект );
	
	Параметры.Вставить("Страна", ФОбъект.Страна);
	Параметры.Вставить("Регион", ФОбъект.Регион);
	Параметры.Вставить("Город", ФОбъект.Город);
	Параметры.Вставить("ВСД_Экспертиза", ФОбъект.ВСД_Экспертиза);
	Параметры.Вставить("ВСД_Местность", ФОбъект.ВСД_Местность );
	Параметры.Вставить("ВСД_ОсобыеОтметки", ФОбъект.ВСД_ОсобыеОтметки);
	
	Параметры.Вставить("ПаузаСек", ФОбъект.ПаузаСек);	
	Параметры.Вставить("РеквизитГрузополучатель", ФОбъект.РеквизитГрузополучатель);	
			
	Параметры.Вставить("ОтладкаЗапросовXML", ФОбъект.ОтладкаЗапросовXML);	
	Параметры.Вставить("Перевозчик_ХозСубъект", ФОбъект.Перевозчик_ХозСубъект);		
	Параметры.Вставить("ПропускатьПустыеСвойства", ФОбъект.ПропускатьПустыеСвойства);		
	//Параметры.Вставить(НазваниеВидаДокументаРеализация, "НазваниеВидаДокументаРеализация");		
	
	Параметры.Вставить("КаталогЛогов", ФОбъект.КаталогЛогов);
	
	Параметры.Вставить("ТестовыйРежим", ФОбъект.ТестовыйРежим);	
	Параметры.Вставить("ВыводитьПодробнуюИнформацию", ФОбъект.ВыводитьПодробнуюИнформацию);	
	
	Параметры.Вставить("Смещение", ФОбъект.Смещение);
	Параметры.Вставить("АвтоЗаписьВСДСоответствия", ФОбъект.АвтоЗаписьВСДСоответствия);
	Параметры.Вставить("НазваниеРеквизитаКоличество", ФОбъект.НазваниеРеквизитаКоличество);
	Параметры.Вставить("ПарамКоэффициентПересчетаКоличества", ФОбъект.ПарамКоэффициентПересчетаКоличества);
	Параметры.Вставить("ВСД_РезультатыИсследований", ФОбъект.ВСД_РезультатыИсследований);
    Параметры.Вставить("ТермическиеУсловияПеревозки", ФОбъект.ТермическиеУсловияПеревозки);
	Параметры.Вставить("ВСДЦель", ФОбъект.ВСДЦель);
	Параметры.Вставить("ПарамЗаполнятьТранзакциюПриОтсутствииПартий", ФОбъект.ПарамЗаполнятьТранзакциюПриОтсутствииПартий);
	Параметры.Вставить("ПарамНомерУровняУпаковкиДляВСД", ФОбъект.ПарамНомерУровняУпаковкиДляВСД);
	Параметры.Вставить("ПарамФормаУпаковкиДляВСД", ФОбъект.ПарамФормаУпаковкиДляВСД);
	Параметры.Вставить("НазваниеРеквизитаКоличествоМест", ФОбъект.НазваниеРеквизитаКоличествоМест);
	Параметры.Вставить("НазваниеРеквизитаКоличествоМест", ФОбъект.НазваниеРеквизитаКоличествоМест);
	//Параметры.Вставить("ОчищатьСправочникВСД_Партии", ФОбъект.ОчищатьСправочникВСД_Партии);
	Параметры.Вставить("ПарамКолонкаСортировкиПартииСписания", ФОбъект.ПарамКолонкаСортировкиПартииСписания);
	Параметры.Вставить("ПарамЗнакСортировкиУбывание", ФОбъект.ПарамЗнакСортировкиУбывание);
	Параметры.Вставить("ПарамФильтроватьРеализациюПоСкладуПлощадкиОтправителя",ФОбъект.ПарамФильтроватьРеализациюПоСкладуПлощадкиОтправителя);	
	
	Параметры.Вставить("ПарамПоставщикОрганизация",ФОбъект.ПарамПоставщикОрганизация);	
	Параметры.Вставить("ПарамПоставщикХозСубъект",ФОбъект.ПарамПоставщикХозСубъект);	
	Параметры.Вставить("ПарамПоставщикПлощадка",ФОбъект.ПарамПоставщикПлощадка);	
	Параметры.Вставить("ПарамРазрешитьВводНаОснованииБолееОдногоВСД",ФОбъект.ПарамРазрешитьВводНаОснованииБолееОдногоВСД);
	
	Параметры.Вставить("ИспользоватьВнешнююОбработку",ФОбъект.флИспользоватьВнешнююОбработку);
	
	Параметры.Вставить("ОтправлятьВФоне", ФОбъект.ОтправлятьВФоне);
	Параметры.Вставить("ПарамПроизводствоЗаполнятьПоСправочнику", ФОбъект.ПарамПроизводствоЗаполнятьПоСправочнику);
	Параметры.Вставить("ПарамПроизводствоЗаполнятьТчПоТчСерииПродукции", ФОбъект.ПарамПроизводствоЗаполнятьТчПоТчСерииПродукции);
	
	Параметры.Вставить("КодЛицензии", ФОбъект.КодЛицензии);
	
	Попытка 
		_НастройкиДляТекущегоПользователя = ФОбъект.флСохранятьНастройкиДляТекущегоПользователя; 
	Исключение 
		_НастройкиДляТекущегоПользователя = Ложь; 
	КонецПопытки;
	
	Возврат Параметры;

КонецФункции

// Получает сообщения пользователю, отфильтровывает служебные сообщения о состоянии длительной операции.
// 
// Параметры:
//  УдалятьПолученные - Булево - Признак необходимости удаления полученных сообщений.
//  ИдентификаторЗадания - УникальныйИдентификатор - идентификатор фонового задания.
// 
// Возвращаемое значение:
//  Массив - ФиксированныйМассив - Массив объектов СообщениеПользователю, которые были сформированы в
//  фоновом задании.
// в Бухгалерии 2.0 нет функции СообщенияПользователю в модуле ДлительныеОперации
Функция СообщенияПользователю(УдалятьПолученные = Ложь, ИдентификаторЗадания = Неопределено) Экспорт
	
	Если ЗначениеЗаполнено(ИдентификаторЗадания) Тогда
		ФоновоеЗадание = ФоновыеЗадания.НайтиПоУникальномуИдентификатору(ИдентификаторЗадания);
		Если ФоновоеЗадание <> Неопределено Тогда
			ВсеСообщения = ФоновоеЗадание.ПолучитьСообщенияПользователю(УдалятьПолученные);
		КонецЕсли;
	Иначе
		ВсеСообщения = ПолучитьСообщенияПользователю(УдалятьПолученные);
	КонецЕсли;
	
	Результат = Новый Массив;
	
	Для Каждого Сообщение Из ВсеСообщения Цикл
		//Если СтрНачинаетсяС(Сообщение.Текст, "{" + СообщениеПрогресса() + "}") Тогда
			Если УдалятьПолученные Тогда
				Сообщение.Сообщить();
			КонецЕсли;
		//Иначе
		//	Результат.Добавить(Сообщение);
		//КонецЕсли;
	КонецЦикла;
	
	Возврат Новый ФиксированныйМассив(Результат);
КонецФункции

#Область ЗаполнениеДокументов
Функция ПолучитьНомерДокБезПрефикса(ВыбДок) Экспорт
	Если НЕ(ЗначениеЗаполнено(ВыбДок)) Тогда
		Возврат "";	
	КонецЕсли;
	
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ПолучитьНомерДокБезПрефикса");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ПолучитьНомерДокБезПрефикса( ВыбДок );
	КонецЕсли;

	
	//БП 3.
	
	Если Метаданные.ОбщиеМодули.Найти("ПрефиксацияОбъектовКлиентСервер") <> Неопределено Тогда
		МодульРабота1 = ВСД_Общий.ОбщийМодуль("ПрефиксацияОбъектовКлиентСервер");
		Попытка
			Возврат МодульРабота1.НомерНаПечать(ВыбДок.Номер, Истина, Ложь);
		Исключение
			Возврат МодульРабота1.ПолучитьНомерНаПечать(ВыбДок.Номер, Истина, Ложь);
		КонецПопытки;
	ИначеЕсли Метаданные.ОбщиеМодули.Найти("ОбщегоНазначения") <> Неопределено Тогда
		МодульРабота1 = ВСД_Общий.ОбщийМодуль("ОбщегоНазначения");
		Возврат МодульРабота1.ПолучитьНомерНаПечать(ВыбДок);
	Иначе
		ВСД.СообщитьИнфо("Для данной конфигурации 1С не удалось ПолучитьНомерДокБезПрефикса");		
		Возврат "";
	КонецЕсли;

//	Возврат ПрефиксацияОбъектовКлиентСервер.НомерНаПечать(ВыбДок.Номер, Истина, Ложь);
	// УПП Воврат ОбщегоНазначения.ПолучитьНомерНаПечать(ВыбДок);
КонецФункции

Функция ПолучитьНомерАвто( ДокОснование ) Экспорт
	
	// Проверка переопределения функции в Общем модуле ВСД_Переопределения
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ПолучитьНомерАвто");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ПолучитьНомерАвто( ДокОснование );
	КонецЕсли;
	
	Попытка
		МетаданныеОбъекта = ДокОснование.Метаданные();
	Исключение 
	    Возврат "Не используется";
	КонецПопытки;
	Если МетаданныеОбъекта.Реквизиты.Найти("Транспорт") <> Неопределено Тогда
		//Это БП ПТФ 2.0
		НомерТС = ДокОснование.Транспорт.ГосНомерАвтомобиля;
		НомерТС = ?(ЗначениеЗаполнено(НомерТС),СокрЛП(НомерТС),"Не исп.");
	ИначеЕсли МетаданныеОбъекта.Реквизиты.Найти("РегистрационныйЗнакАвтомобиля") <> Неопределено Тогда
		//	БП 3
		НомерТС = ?(ЗначениеЗаполнено(ДокОснование.РегистрационныйЗнакАвтомобиля),СокрЛП(ДокОснование.РегистрационныйЗнакАвтомобиля),"Не исп.");
	Иначе	
		Попытка
		// Это УПП и УТ
			Запрос = Новый Запрос;
			Запрос.Текст = "ВЫБРАТЬ 
			| ПараметрыМаршрутаСрезПоследних.Водитель, 
			| ПараметрыМаршрутаСрезПоследних.ЗаказПокупателя, 
			| ПараметрыМаршрутаСрезПоследних.НомерТС 
			|ИЗ 
			| РегистрСведений.ПараметрыМаршрута.СрезПоследних(, ЗаказПокупателя = &ТекЗаказ) КАК ПараметрыМаршрутаСрезПоследних";
		
			Запрос.УстановитьПараметр("ТекЗаказ", ДокОснование.Сделка);
			РезультатЗапроса = Запрос.Выполнить();

			ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();

			Если ВыборкаДетальныеЗаписи.Следующий() Тогда
				//Водитель = ВыборкаДетальныеЗаписи.Водитель;
				НомерТС = ?(ЗначениеЗаполнено(ВыборкаДетальныеЗаписи.НомерТС),ВыборкаДетальныеЗаписи.НомерТС,"Не уст.(Б/Н)");
			Иначе
				//Водитель = Справочники.ФизическиеЛица.ПустаяСсылка();
				НомерТС = "Не исп.";
			КонецЕсли;
		Исключение //КРК - отстутствует регистр сведений ПараметрыМаршрута		
			НомерТС = "Не исп.";	
		КонецПопытки;
	КонецЕсли;
	Возврат НомерТС;
КонецФункции


Функция ЗаполнитьСвязанныеДокументы( ДокВСД ) Экспорт
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ЗаполнитьСвязанныеДокументы");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ЗаполнитьСвязанныеДокументы( ДокВСД );
	КонецЕсли;

КонецФункции

// Работа с документами
Функция РассчитатьКоличествоДляВСД( ПараметрыОрганизации, СтрокаТЧДок, Продукция_Элемент = "") Экспорт
	// вызов переопределения
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("РассчитатьКоличествоДляВСД");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.РассчитатьКоличествоДляВСД( ПараметрыОрганизации, СтрокаТЧДок, Продукция_Элемент );
	КонецЕсли;
	
	Рез = 0;
	Коэфф = 0;
	Попытка
		//Пересчет ШТ в КГ
		Версия = Лев(Метаданные.Версия,2);		
		Если Метаданные.Имя = "УправлениеТорговлей" И Версия="11" Тогда 				
			Если СтрокаТЧДок.Номенклатура.ВесИспользовать Тогда
				Если СтрокаТЧДок.Номенклатура.ВесЗнаменатель>0 Тогда 
					Коэфф=СтрокаТЧДок.Номенклатура.ВесЧислитель/СтрокаТЧДок.Номенклатура.ВесЗнаменатель;
				Иначе
					Коэфф=0;
				КонецЕсли;
			КонецЕсли;
		Иначе //остальные считаем с учетом параметра [ПарамКоэффициентПересчетаКоличества]		
			
			КПересчета = ПараметрыОрганизации["ПарамКоэффициентПересчетаКоличества"]; 
			Попытка
				Коэфф = Число(КПересчета);
			Исключение
				Коэфф = 0;
			КонецПопытки;
						
			Если НЕ(ЗначениеЗаполнено(КПересчета)) Тогда
				Коэфф = 1;
			ИначеЕсли Строка(Коэфф)	= КПересчета Тогда
				Коэфф = Число(КПересчета);
			Иначе //реквизитСтрокиДока.
				_Точка = Найти(КПересчета,".");
				ИмяРекв = Сред(КПересчета,1,_Точка-1);
				ИмяПодРекв = Сред(КПересчета,_Точка+1);
				Коэфф = СтрокаТЧДок[ИмяРекв];
				_Точка = Найти(ИмяПодРекв,".");
				Пока _Точка > 0 Цикл
					ИмяРекв = Сред(ИмяПодРекв,1,_Точка-1);
					ИмяПодРекв = Сред(ИмяПодРекв,_Точка+1);
					Коэфф = Коэфф[ИмяРекв];
					_Точка = Найти(ИмяПодРекв,".");
				КонецЦикла;
				Если НЕ ТипЗнч(Коэфф) = Тип("Число") Тогда
					Коэфф = Коэфф[ИмяПодРекв];
				КонецЕсли;
			КонецЕсли;
			
		КонецЕсли;
	Исключение
		ВСД.СообщитьИнфо("Указан неверный параметр [ПарамКоэффициентПересчетаКоличества]");
		ВСД.СообщитьИнфо(ОписаниеОшибки());
		Рез = 0;
	КонецПопытки;
		
	Если Коэфф = 0 Тогда
		ВСД.СообщитьИнфо("Коэфф пересчета "+КПересчета+" для "+СтрокаТЧДок.Номенклатура + " равен 0 - ставлю 1" );
		Коэфф = 1;
	КонецЕсли;
	
	Попытка
		Рез = СтрокаТЧДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличество"] ]*Коэфф;
	Исключение
		ВСД.СообщитьИнфо("Указан неверный параметр [НазваниеРеквизитаКоличество] ");
		ВСД.СообщитьИнфо(ОписаниеОшибки());
		Рез = 0;
	КонецПопытки;
	
	Возврат Рез;
КонецФункции

Функция ВыгрузитьТч( Док, ПараметрыОрганизации="" ) Экспорт
//// вызов переопределения
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ВыгрузитьТч");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ВыгрузитьТч( Док, ПараметрыОрганизации );
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(ПараметрыОрганизации) Тогда 
		ПараметрыОрганизации = ВСД.ЗагрузитьПараметры( Док.Организация );
	КонецЕсли;
	
	тзРез = Новый("ТаблицаЗначений");
	тзРез.Колонки.Добавить("Номенклатура");
	тзРез.Колонки.Добавить("Продукция_Элемент");
	тзРез.Колонки.Добавить("Количество");
	тзРез.Колонки.Добавить("Упаковки");
	
	Для Каждого стрДок Из док.Товары Цикл
		ВСДПродукцияЭлемент = ВСД.Продукция_Элемент_ПолучитьПоНоменклатуре(стрДок.Номенклатура);
		Если (ВСДПродукцияЭлемент = Справочники.ВСД_Продукция_Элемент.ПустаяСсылка()) и НЕ( ПараметрыОрганизации["ПропускатьПустыеСвойства"] ) Тогда
			ВСД.СообщитьИнфо("["+стрДок.Номенклатура+"] -> не указан ВСД_Продукция_Элемент");
		ИначеЕсли (ВСДПродукцияЭлемент=Справочники.ВСД_Продукция_Элемент.ПустаяСсылка()) и ( ПараметрыОрганизации["ПропускатьПустыеСвойства"] ) Тогда
			Продолжить;
		КонецЕсли;
		СтрТЧ = тзРез.Добавить();
		СтрТЧ.Номенклатура = стрДок.Номенклатура;
		СтрТЧ.Продукция_Элемент = ВСДПродукцияЭлемент;
		СтрТЧ.Количество = РассчитатьКоличествоДляВСД(ПараметрыОрганизации, стрДок, ВСДПродукцияЭлемент);
		Попытка
		Если ЗначениеЗаполнено(стрДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличествоМест"] ]) Тогда
			СтрТЧ.Упаковки = стрДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличествоМест"] ];
		КонецЕсли;
		Исключение КонецПопытки;
	КонецЦикла;
	Возврат тзРез;
КонецФункции

//Функция ЗаполнитьТабЧастьЭлементовДляСозданияВСД(ПараметрыОрганизации, тзПартии, ДокОсн = Неопределено ) Экспорт
Функция ЗаполнитьТабЧастьВсдПоПартиям( ПараметрыОрганизации, тзПартии, ДокОсн = Неопределено ) Экспорт
	
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ЗаполнитьТабЧастьВсдПоПартиям");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ЗаполнитьТабЧастьВсдПоПартиям( ПараметрыОрганизации, тзПартии, ДокОсн );
	КонецЕсли;
	
 	// Данные из таблицы Партии по недостающим к реализации
	// либо из докОснования - ВыгрузитьТЧ выполняется
	РезТаб = Новый ТаблицаЗначений;
	РезТаб.Колонки.Добавить("Номенклатура",новый ОписаниеТипов("СправочникСсылка.Номенклатура"));
	РезТаб.Колонки.Добавить("Продукция_Элемент",новый ОписаниеТипов("СправочникСсылка.ВСД_Продукция_Элемент"));
	РезТаб.Колонки.Добавить("Количество",новый ОписаниеТипов("Число"));
	РезТаб.Колонки.Добавить("Упаковки"); // для совместимости с ВыгрузитьТЧ
	Если Докосн = Неопределено Тогда
		Для Каждого стрПартии Из тзПартии Цикл
			Если НЕ(ЗначениеЗаполнено(стрПартии.ВСД_Продукция_Элемент)) Тогда
				Продолжить;	
			КонецЕсли;
			Если (стрПартии.КоличествоСписания - стрПартии.Количество) <= 0 Тогда 
				Продолжить; //пропустим то что есть в наличии				
			КонецЕсли;			
			стрТаб = Резтаб.Добавить();
			стрТаб.Продукция_Элемент = стрПартии.ВСД_Продукция_Элемент;
			стрТаб.Количество = стрПартии.КоличествоСписания - стрПартии.Количество;
		КонецЦикла;
	иначеЕсли ТипЗнч(ДокОсн) = Тип("ДокументСсылка.ВСД2_транзакция") Тогда		
		Для Каждого строкаДок Из Докосн.Товары  Цикл
			стрТаб = Резтаб.Добавить();
			стрТаб.Номенклатура = строкаДок.Номенклатура;
			Если ЗначениеЗаполнено(строкаДок.Продукция_Элемент) Тогда 
				стрТаб.Продукция_Элемент = строкаДок.Продукция_Элемент
			Иначе
				стрТаб.Продукция_Элемент = ВСД.Продукция_Элемент_ПолучитьПоНоменклатуре(строкаДок.Номенклатура);
			КонецЕсли;
			стрТаб.Количество = строкаДок.Количество;			
		КонецЦикла
	Иначе
		// возьмем реализацию тогда за Основу...
		Возврат ВыгрузитьТЧ(ДокОсн, ПараметрыОрганизации);
	КонецЕсли;
	
	Возврат резТаб;
КонецФункции

//Функция ЗаполнитьТабЧастьЭлементовДляСозданияВСД(ПараметрыОрганизации, тзПартии, ДокОсн = Неопределено ) Экспорт
Функция ЗаполнитьТабЧастьВсдПоОснованию(ПараметрыОрганизации, ДокОсн ) Экспорт
	
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ЗаполнитьТабЧастьВсдПоОснованию");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ЗаполнитьТабЧастьВсдПоОснованию( ПараметрыОрганизации, ДокОсн );
	КонецЕсли;
	
 	// Данные из таблицы Партии по недостающим к реализации
	// либо из докОснования - ВыгрузитьТЧ выполняется
	РезТаб = Новый ТаблицаЗначений;
	РезТаб.Колонки.Добавить("Номенклатура",новый ОписаниеТипов("СправочникСсылка.Номенклатура"));
	РезТаб.Колонки.Добавить("Продукция_Элемент",новый ОписаниеТипов("СправочникСсылка.ВСД_Продукция_Элемент"));
	РезТаб.Колонки.Добавить("Количество",новый ОписаниеТипов("Число"));
	РезТаб.Колонки.Добавить("Упаковки"); // для совместимости с ВыгрузитьТЧ
	//Если Докосн = Неопределено Тогда
	//	для каждого стрПартии из тзПартии Цикл
	//		Если НЕ(ЗначениеЗаполнено(стрПартии.ВСД_Продукция_Элемент)) тогда
	//			Продолжить;	
	//		КонецЕсли;
	//		Если (стрПартии.КоличествоСписания - стрПартии.Количество) <= 0 Тогда 
	//			Продолжить; //пропустим то что есть в наличии				
	//		КонецЕсли;			
	//		стрТаб = Резтаб.Добавить();
	//		стрТаб.Продукция_Элемент = стрПартии.ВСД_Продукция_Элемент;
	//		стрТаб.Количество = стрПартии.КоличествоСписания - стрПартии.Количество;
	//	КонецЦикла;
	Если ТипЗнч(ДокОсн) = Тип("ДокументСсылка.ВСД2_транзакция") Тогда		
		Для Каждого строкаДок Из Докосн.Товары  Цикл
			стрТаб = Резтаб.Добавить();
			стрТаб.Номенклатура = строкаДок.Номенклатура;
			Если ЗначениеЗаполнено(строкаДок.Продукция_Элемент) Тогда 
				стрТаб.Продукция_Элемент = строкаДок.Продукция_Элемент
			Иначе
				стрТаб.Продукция_Элемент = ВСД.Продукция_Элемент_ПолучитьПоНоменклатуре(строкаДок.Номенклатура);
			КонецЕсли;
			стрТаб.Количество = строкаДок.Количество;			
		КонецЦикла
	Иначе
		// возьмем реализацию тогда за Основу...
		Возврат ВыгрузитьТЧ(ДокОсн, ПараметрыОрганизации);
	КонецЕсли;
	
	Возврат резТаб;
КонецФункции

Функция ПолучитьДанныеДляСозданияВСДПеремещения(ПараметрыОраганизации, тзПартии, ДокОсн ) Экспорт
    Рез = Новый Структура;
	Рез.Вставить("Организация", ПараметрыОраганизации["ПарамПоставщикОрганизация"]);
	Рез.Вставить("Отправитель_Хозсубъект", ПараметрыОраганизации["ПарамПоставщикХозСубъект"]);
	Рез.Вставить("Отправитель_Площадка", ПараметрыОраганизации["ПарамПоставщикПлощадка"]);
	Рез.Вставить("Получатель_Хозсубъект", ПараметрыОраганизации["Отправитель_Хозсубъект"]);
	Рез.Вставить("Получатель_Площадка", ПараметрыОраганизации["Отправитель_Площадка"]);
	Рез.Вставить("ДокОснование", ПараметрыОраганизации["ДокОсн"]);
	//Рез.Вставить("СтрокиВСД", ЗаполнитьТабЧастьЭлементовДляСозданияВСД(тзПартии, тзПартии, ДокОсн));
	Рез.Вставить("СтрокиВСД", ЗаполнитьТабЧастьВсдПоПартиям(тзПартии, тзПартии, ДокОсн));
	
	Возврат Рез;
КонецФункции

Функция ПолучитьАртикулНоменклатуры( ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка)
	
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ПолучитьАртикулНоменклатуры");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ПолучитьАртикулНоменклатуры( ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка );
	КонецЕсли;
	
	Ответ = НоваяСтрока.Продукция_Элемент.Артикул;
	Возврат Ответ;
КонецФункции

Функция ЗаполнитьРеквизитыСтрокиВСД( ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка )
	
//// вызов переопределения	
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ЗаполнитьРеквизитыСтрокиВСД");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ЗаполнитьРеквизитыСтрокиВСД( ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка );
	КонецЕсли;
	
//	НоваяСтрока.Номенклатура 			= СтрокаОснования.Номенклатура;
//	НоваяСтрока.Продукция_Элемент 		= СтрокаОснования.Продукция_Элемент;
//	НоваяСтрока.ЕдиницаИзмерения 		= НоваяСтрока.Партия.ЕдиницаИзмерения;
	// 
	Попытка
		НоваяСтрока.Продукция 				= НоваяСтрока.Продукция_Элемент.Продукция;
		НоваяСтрока.ВидПродукции 			= НоваяСтрока.Продукция_Элемент.ВидПродукции;
		НоваяСтрока.НаименованиеПродукции 	= НоваяСтрока.Продукция_Элемент.Наименование;
	Исключение КонецПопытки;
	
	Попытка НоваяСтрока.GTIN = НоваяСтрока.Продукция_Элемент.GTIN; Исключение КонецПопытки;
	Попытка НоваяСтрока.Артикул	= ПолучитьАртикулНоменклатуры( ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка) Исключение КонецПопытки;
	
	Попытка
		НоваяСтрока.Цель 					= НоваяСтрока.Продукция_Элемент.ВидПродукции.Цель;
		Если НЕ ЗначениеЗаполнено(НоваяСтрока.Цель) Тогда 
			НоваяСтрока.Цель = ПараметрыОрганизации["ВСДЦель"];
		КонецЕсли;
	Исключение КонецПопытки;
	
	Если докСсылка.Метаданные().ТабличныеЧасти.Найти("УровниУпаковки") <> Неопределено Тогда
		Если НЕ(ЗначениеЗаполнено( ПараметрыОрганизации["ПарамНомерУровняУпаковкиДляВСД"] )) или НЕ(ЗначениеЗаполнено( ПараметрыОрганизации["ПарамФормаУпаковкиДляВСД"])) Тогда
			//СообщитьИнфо("Не аполнены Параметры для упаковки на уровнях");
			Возврат "";	
		КонецЕсли;
	// Упаковка на уровнях
		Попытка
		
			Если ЗначениеЗаполнено(СтрокаОснования.Упаковки) Тогда
				Если Цел(СтрокаОснования.Упаковки/СтрокаОснования.Количество*НоваяСтрока.Количество) = 0 Тогда
					ВСД.СообщитьИнфо("Нулевое кол-во упаковки у "+СтрокаОснования.Продукция_Элемент+" в "+ДокСсылка);	
				Иначе
			
					СтрокаУпак = докСсылка.УровниУпаковки.Добавить(); //Документы.ВСД2_транзакция.СоздатьДокумент().УровниУпаковки.Добавить();
					СтрокаУпак.СтрокаПродукции = НоваяСтрока.НомерСтроки;
					СтрокаУпак.Количество = Цел(СтрокаОснования.Упаковки/СтрокаОснования.Количество*НоваяСтрока.Количество); //Пропорционально Распределенному количеству
					СтрокаУпак.НомерУровня = ПараметрыОрганизации["ПарамНомерУровняУпаковкиДляВСД"];//СписокПараметров.Получить("ПарамНомерУровняУпаковкиДляВСД");
					СтрокаУпак.ФормаУпаковки = ПараметрыОрганизации["ПарамФормаУпаковкиДляВСД"];//СписокПараметров.Получить("ПарамФормаУпаковкиДляВСД");;
					//Маркировки
		//			СтрокаМарк = докСсылка.Маркировка.Добавить();
		//			СтрокаМарк.Строкапродукции = СтрокаУпак.СтрокаПродукции;
		//			СтрокаМарк.НомерУровня = СтрокаУпак.НомерУровня;
		//			СтрокаМарк.Класс = Перечисления.ВСД_Маркировка.BN;
		//			СтрокаМарк.Маркировка = "ТЕСТ";  //ПолучитьМаркировку( ТЗПартий.Номенклатура.ОсновнаяЕдиница, Контрагент);
				КонецЕсли;
			КонецЕсли;
			
		Исключение 
			ВСД.СообщитьИнфо(ОписаниеОшибки());	
		КонецПопытки;
	КонецЕсли;
	
КонецФункции

//Процедура ЗаполнитьТЧВСД(ПараметрыОрганизации, ДанныеЗаполнения = Неопределено, докСсылка, тзАктуальныхПартий = Неопределено) Экспорт
Функция ЗаполнитьТабЧастьВСД( ПараметрыОрганизации, ДанныеЗаполнения = Неопределено, докСсылка, тзАктуальныхПартий = Неопределено) Экспорт
// заполняет ТЧ документа ВСД по Входящим данным , вызывается из ЗаполнитьНаосновании ВСД2_Транзакция
// ДанныеЗаполнения = Документ основание, берем из него ТЧ для расчета Кол-ва и Продэлементы для фильтра партий,
// также данные для заполнения Маркировок

// Добавлен реквизит - тзЭлементыОснования = ТЧ докоснования, для подбора Партий без Документа Основания
// Оптимизировать в дальнейшем входящие Параметры !!! ЖД

// вызов переопределения
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ЗаполнитьТабЧастьВСД");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ЗаполнитьТабЧастьВСД( ПараметрыОрганизации, ДанныеЗаполнения, докСсылка, тзАктуальныхПартий );
	КонецЕсли;

	Если ЗначениеЗаполнено( ДанныеЗаполнения ) Тогда
		тзЭлементыОснования = ВыгрузитьТЧ(ДанныеЗаполнения.Ссылка, ПараметрыОрганизации ); 		
	КонецЕсли;
	
	Если докСсылка.Получатель_ХозСубъект.ПерсональныеПараметрыСписанияПартий Тогда 
		ПолеСортировкиПокупателя = докСсылка.Получатель_ХозСубъект.ПарамКолонкаСортировкиПартииСписания;
		ЗнакСортировкиПокупателя = докСсылка.Получатель_ХозСубъект.ПарамЗнакСортировкиУбывание;
	Иначе 
		ПолеСортировкиПокупателя = Неопределено;
		ЗнакСортировкиПокупателя = Неопределено;
	КонецЕсли;
	ПартииКСписанию = ВСД.тзПартииСписанияПоТзПродукция_Элемент( ПараметрыОрганизации, тзЭлементыОснования, тзАктуальныхПартий, ПолеСортировкиПокупателя, ЗнакСортировкиПокупателя  );
	
	Если (ПартииКСписанию.Количество() = 0) и НЕ(ПараметрыОрганизации["ПарамЗаполнятьТранзакциюПриОтсутствииПартий"]) Тогда
		ВСД.СообщитьИнфо("Нет актуальных партий для создания ВСД по "+ ?(ДанныеЗаполнения = Неопределено,"Переданным данным",ДанныеЗаполнения.Ссылка));
		Возврат Ложь;
	КонецЕсли;
	
	Для Каждого ТекСтрокаТовары Из ПартииКСписанию Цикл
		НоваяСтрока = докСсылка.Товары.Добавить();			
		ЗаполнитьЗначенияСвойств(НоваяСтрока,ТекСтрокаТовары);
		ЗаполнитьРеквизитыСтрокиВСД(ПараметрыОрганизации, НоваяСтрока, ТекСтрокаТовары, докСсылка);
		Если ЗначениеЗаполнено (ТекСтрокаТовары.Продукция_Элемент) Тогда
			//докСсылка.ТермическоеСостояние = МИН(ТекСтрокаТовары.Продукция_Элемент.ТермическиеУсловияПеревозки,докСсылка.ТермическоеСостояние) ;
			//ДокВСД.ТермическиеУсловияПеревозки = ПараметрыОрганизации["ТермическиеУсловияПеревозки")
		КонецЕсли;
	КонецЦикла;
	//докСсылка.ТермическоеСостояние = ?(докСсылка.ТермическоеСостояние=0,1,докСсылка.ТермическоеСостояние); //!!!!
КонецФункции

// тзЭлементыОснования = входящая ТаблицаЗначений :
//тзЭлементыОснования = Новый("ТаблицаЗначений");
//тзЭлементыОснования.Колонки.Добавить("Номенклатура");
//тзЭлементыОснования.Колонки.Добавить("Продукция_Элемент");
//тзЭлементыОснования.Колонки.Добавить("Количество");
//тзЭлементыОснования.Колонки.Добавить("Упаковки");
Функция ЗаполнитьТабЧастьВСДпоТЗ( ПараметрыОрганизации, тзЭлементыОснования, докСсылка, тзАктуальныхПартий = Неопределено) Экспорт
// заполняет ТЧ документа ВСД по Входящим данным , вызывается из ЗаполнитьНаосновании ВСД2_Транзакция
// ДанныеЗаполнения = Документ основание, берем из него ТЧ для расчета Кол-ва и Продэлементы для фильтра партий,
// также данные для заполнения Маркировок

	// вызов переопределения
	ПереопределенныйМодуль = ВСД_Общий.ФункцияПереопределена("ЗаполнитьТабЧастьВСДпоТЗ");
	Если ПереопределенныйМодуль <> Неопределено Тогда
		Возврат ПереопределенныйМодуль.ЗаполнитьТабЧастьВСДпоТЗ( ПараметрыОрганизации, тзЭлементыОснования, докСсылка, тзАктуальныхПартий );
	КонецЕсли;

	//Если ЗначениеЗаполнено( ДанныеЗаполнения ) тогда
	//	тзЭлементыОснования = ВыгрузитьТЧ(ДанныеЗаполнения.Ссылка, ПараметрыОрганизации ); 		
	//КонецЕсли;
	
	Если докСсылка.Получатель_ХозСубъект.ПерсональныеПараметрыСписанияПартий Тогда 
		ПолеСортировкиПокупателя = докСсылка.Получатель_ХозСубъект.ПарамКолонкаСортировкиПартииСписания;
		ЗнакСортировкиПокупателя = докСсылка.Получатель_ХозСубъект.ПарамЗнакСортировкиУбывание;
	Иначе 
		ПолеСортировкиПокупателя = Неопределено;
		ЗнакСортировкиПокупателя = Неопределено;
	КонецЕсли;
	ПартииКСписанию = ВСД.тзПартииСписанияПоТзПродукция_Элемент( ПараметрыОрганизации, тзЭлементыОснования, тзАктуальныхПартий, ПолеСортировкиПокупателя, ЗнакСортировкиПокупателя  );
	
	Если (ПартииКСписанию.Количество() = 0) и НЕ(ПараметрыОрганизации["ПарамЗаполнятьТранзакциюПриОтсутствииПартий"]) Тогда
		ВСД.СообщитьИнфо("Нет актуальных партий для создания ВСД ", тзЭлементыОснования );
		Возврат Ложь;
	КонецЕсли;
	
	Для Каждого ТекСтрокаТовары Из ПартииКСписанию Цикл
		НоваяСтрока = докСсылка.Товары.Добавить();			
		ЗаполнитьЗначенияСвойств(НоваяСтрока,ТекСтрокаТовары);
		ЗаполнитьРеквизитыСтрокиВСД(ПараметрыОрганизации, НоваяСтрока, ТекСтрокаТовары, докСсылка);
		Если ЗначениеЗаполнено (ТекСтрокаТовары.Продукция_Элемент) Тогда
			//докСсылка.ТермическоеСостояние = МИН(ТекСтрокаТовары.Продукция_Элемент.ТермическиеУсловияПеревозки,докСсылка.ТермическоеСостояние) ;
			//ДокВСД.ТермическиеУсловияПеревозки = ПараметрыОрганизации["ТермическиеУсловияПеревозки")
		КонецЕсли;
	КонецЦикла;
	//докСсылка.ТермическоеСостояние = ?(докСсылка.ТермическоеСостояние=0,1,докСсылка.ТермическоеСостояние); //!!!!
КонецФункции


#КонецОбласти

#Область ПереопределениеФункций

Функция ФункцияПереопределена( ИмяФункции ) Экспорт
 
 	// Проверка переопределения функции в Общем модуле ВСД_Переопределения
 	Модуль  = ОбщийМодуль("ВСД_Переопределения");
	Если Модуль = Неопределено Тогда
		Возврат Неопределено;
 	КонецЕсли;  
	
	Если Модуль.НайтиФункцию( ИмяФункции ) Тогда 
		Возврат Модуль;
	Иначе
		// переопределения нет
		Возврат Неопределено;
	КонецЕсли;
	
КонецФункции

#КонецОбласти 