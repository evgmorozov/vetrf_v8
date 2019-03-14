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
			ВызватьИсключение("ОШИБКА ПОЛУЧЕНИЯ МОДУЛЯ");//ПодставитьПараметрыВСтроку(НСтр("ru = 'Общий модуль ""%1"" не найден.'"), Имя);
		КонецЕсли;
	Исключение
		ВСД.СообщитьИнфо("Ошибка получения модуля Типовой конфигурации "+Имя+" "+ОписаниеОшибки());
		Возврат Неопределено;
	КонецПопытки;
	
	Возврат Модуль;
	
КонецФункции

Функция ПолучитьОрганизациюПоУмолчанию() Экспорт
	Попытка	
		_Организация = Справочники.Организации.ПустаяСсылка();
		
		Если Метаданные.ОбщиеМодули.Найти("БухгалтерскийУчетПереопределяемый") <> Неопределено Тогда
			//БП 3.0
			МодульТиповойКонфы = ОбщийМодуль("БухгалтерскийУчетПереопределяемый");
			_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
		ИначеЕсли Метаданные.ОбщиеМодули.Найти("УправлениеПользователями") <> Неопределено Тогда
			//УПП
			МодульТиповойКонфы = ОбщийМодуль("УправлениеПользователями");
			//МодульТиповойКонфы2 = ОбщийМодуль("ГлобальныйМодуль");
			ТекПользователь = ПараметрыСеанса.ТекущийПользователь;//МодульТиповойКонфы2.глЗначениеПеременной("глТекущийПользователь");// ИмяПользователя();
			_Организация = МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию(ТекПользователь,"ОсновнаяОрганизация");
		Иначе
			ВСД.СообщитьИнфо("Для данной конфигурации 1С не удалось получить значение Организации по умолчанию, обратитесь в тех.поддержку КБ99");
			//Возврат Справочники.Организации.ПустаяСсылка();
		КонецЕсли;
	Исключение
		ВСД.СообщитьИнфо("Для данной конфигурации 1С не удалось получить значение Организации по умолчанию, обратитесь в тех.поддержку КБ99");
		ВСД.СообщитьИнфо(ОписаниеОшибки());
		//_Организация = Справочники.Организации.ПустаяСсылка();
	КонецПопытки;
	//БП 3	Организация = БухгалтерскийУчетПереопределяемый.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
	//УПП         Организация   =  УправлениеПользователями.ПолучитьЗначениеПоУмолчанию(глЗначениеПеременной("глТекущийПользователь"),"ОсновнаяОрганизация");
	
	// В УТ 11 Засада, добавим регистр сведений
	Попытка
		Если  НЕ(ЗначениеЗаполнено(_Организация)) Тогда
			Запрос = Новый Запрос;
			Запрос.Текст = "Выбрать ВСД_ОрганизацияПоУмолчанию.Организация из РегистрСведений.ВСД_ОрганизацияПоУмолчанию как ВСД_ОрганизацияПоУмолчанию где ВСД_ОрганизацияПоУмолчанию.Пользователь = &ВыбПользователь";
			Запрос.УстановитьПараметр("ВыбПользователь", ПараметрыСеанса.АвторизованныйПользователь);	
			Выборка = Запрос.Выполнить().Выбрать();
			Если Выборка.Следующий() Тогда
				_Организация =  Выборка.Организация;
			КонецЕсли;
		КонецЕсли;
	Исключение КонецПопытки;	
	
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
	Параметры.Вставить("ПаузаСек", ФОбъект.ПаузаСек);		
	
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
	Если НЕ(ЗначениеЗаполнено(ВыбДок)) тогда
		Возврат "";	
	КонецЕсли;
	
	//Обработка = ФункцияПереопределена("ПолучитьНомерДокБезПрефикса");
	//Если обработка <> Неопределено Тогда
	//	Возврат Обработка.ПолучитьНомерДокБезПрефикса(ВыбДок);
	//КонецЕсли;	
	
	//БП 3.
	
	Если Метаданные.ОбщиеМодули.Найти("ПрефиксацияОбъектовКлиентСервер") <> Неопределено Тогда
		МодульРабота1 = ВСД_Общий.ОбщийМодуль("ПрефиксацияОбъектовКлиентСервер");
		Попытка
			Возврат МодульРабота1.НомерНаПечать(ВыбДок.Номер, Истина, Ложь);
		исключение
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

Функция ПолучитьНомерАвто(ДокОснование) Экспорт
	//Обработка = ФункцияПереопределена("ПолучитьНомерАвто");
	//Если обработка <> Неопределено Тогда
	//	Возврат Обработка.ПолучитьНомерАвто(ДокОснование);
	//КонецЕсли;
	
	МетаданныеОбъекта = ДокОснование.Метаданные();
	Если МетаданныеОбъекта.Реквизиты.Найти("Транспорт") <> Неопределено тогда
		//Это БП ПТФ 2.0
		НомерТС = ДокОснование.Транспорт.ГосНомерАвтомобиля;
		НомерТС = ?(ЗначениеЗаполнено(НомерТС),СокрЛП(НомерТС),"Не исп.");
	ИначеЕсли МетаданныеОбъекта.Реквизиты.Найти("РегистрационныйЗнакАвтомобиля") <> Неопределено тогда
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


Процедура ЗаполнитьСвязанныеДокументы(ДокВСД) экспорт
	//Обработка = ФункцияПереопределена("ЗаполнитьСвязанныеДокументы");
	//Если обработка <> Неопределено Тогда
	//	Обработка.ЗаполнитьСвязанныеДокументы(ДокВСД);
	//	Возврат;
	//КонецЕсли;	
КонецПроцедуры

// Работа с документами
Функция РассчитатьКоличествоДляВСД(ПараметрыОрганизации, СтрокаТЧДок, Продукция_Элемент = "") Экспорт
//// вызов переопределения
//	Обработка = ФункцияПереопределена("РассчитатьКоличествоДляВСД");
//	Если обработка <> Неопределено Тогда
//		Возврат Обработка.РассчитатьКоличествоДляВСД(ЭтотОбъект, СтрокаТЧДок, Продукция_Элемент);
//	КонецЕсли;
	
	Рез = 0;
	Попытка
		КПересчета = ПараметрыОрганизации["ПарамКоэффициентПересчетаКоличества"]; //СокрЛП(СписокКонстант.Получить("ПарамКоэффициентПересчетаКоличества"));
		Коэфф = 0;
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
		Если Коэфф = 0 Тогда
			ВСД.СообщитьИнфо("Коэфф пересчета "+КПересчета+" для "+СтрокаТЧДок.Номенклатура + " равен 0 - ставлю 1" );
			Коэфф = 1;
		КонецЕсли;
					
		Рез = СтрокаТЧДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличество"] ]*Коэфф;
		//СтрокаТЧДок[СписокКонстант.Получить("НазваниеРеквизитаКоличество")]*Коэфф;	
	Исключение
		ВСД.СообщитьИнфо("Указан неверный параметр НазваниеРеквизитаКоличество или ПарамКоэффициентПересчетаКоличества");
		ВСД.СообщитьИнфо(ОписаниеОшибки());
		Рез = 0;
	КонецПопытки;
	
	Возврат Рез;
КонецФункции

Функция ВыгрузитьТч(Док, ПараметрыОрганизации) Экспорт
//// вызов переопределения
//	Обработка = ФункцияПереопределена("ВыгрузитьТч");
//	Если обработка <> Неопределено Тогда
//		Возврат Обработка.ВыгрузитьТч(ЭтотОбъект, Док);
//	КонецЕсли;
	
	тзРез = Новый("ТаблицаЗначений");
	тзРез.Колонки.Добавить("Номенклатура");
	тзРез.Колонки.Добавить("Продукция_Элемент");
	тзРез.Колонки.Добавить("Количество");
	тзРез.Колонки.Добавить("Упаковки");
	
	для каждого стрДок из док.Товары Цикл
		ВСДПродукцияЭлемент = ВСД.Продукция_Элемент_ПолучитьПоНоменклатуре(стрДок.Номенклатура);
		Если (ВСДПродукцияЭлемент = Справочники.ВСД_Продукция_Элемент.ПустаяСсылка()) и НЕ( ПараметрыОрганизации["ПропускатьПустыеСвойства"] ) Тогда
			ВСД.СообщитьИнфо("["+стрДок.Номенклатура+"] -> не указан ВСД_Продукция_Элемент");
		ИначеЕсли (ВСДПродукцияЭлемент=Справочники.ВСД_Продукция_Элемент.ПустаяСсылка()) и ( ПараметрыОрганизации["ПропускатьПустыеСвойства"] ) Тогда
			Продолжить;
		КонецЕсли;
		СтрТЧ = тзРез.Добавить();
		СтрТЧ.Номенклатура = стрДок.Номенклатура;
		СтрТЧ.Продукция_Элемент = ВСДПродукцияЭлемент;
		СтрТЧ.Количество = РассчитатьКоличествоДляВСД(ПараметрыОрганизации, стрДок);
		Попытка
		Если ЗначениеЗаполнено(стрДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличествоМест"] ]) Тогда
			СтрТЧ.Упаковки = стрДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличествоМест"] ];
		КонецЕсли;
		Исключение КонецПопытки;
	КонецЦикла;
	Возврат тзРез;
КонецФункции

//Функция ЗаполнитьТабЧастьЭлементовДляСозданияВСД(ПараметрыОрганизации, тзПартии, ДокОсн = Неопределено ) Экспорт
Функция ЗаполнитьТабЧастьВсдПоПартиям(ПараметрыОрганизации, тзПартии, ДокОсн = Неопределено ) Экспорт
	//Обработка = ФункцияПереопределена("ЗаполнитьТабЧастьЭлементовДляСозданияВСД");
	//Если обработка <> Неопределено Тогда
	//	Возврат Обработка.ЗаполнитьТабЧастьЭлементовДляСозданияВСД(ЭтотОбъект, ДокОсн);		
	//КонецЕсли;	
 	// Данные из таблицы Партии по недостающим к реализации
	// либо из докОснования - ВыгрузитьТЧ выполняется
	РезТаб = Новый ТаблицаЗначений;
	РезТаб.Колонки.Добавить("Номенклатура",новый ОписаниеТипов("СправочникСсылка.Номенклатура"));
	РезТаб.Колонки.Добавить("Продукция_Элемент",новый ОписаниеТипов("СправочникСсылка.ВСД_Продукция_Элемент"));
	РезТаб.Колонки.Добавить("Количество",новый ОписаниеТипов("Число"));
	РезТаб.Колонки.Добавить("Упаковки"); // для совместимости с ВыгрузитьТЧ
	Если Докосн = Неопределено Тогда
		для каждого стрПартии из тзПартии Цикл
			Если НЕ(ЗначениеЗаполнено(стрПартии.ВСД_Продукция_Элемент)) тогда
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
		Для каждого строкаДок из Докосн.Товары  Цикл
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
	//Обработка = ФункцияПереопределена("ЗаполнитьТабЧастьЭлементовДляСозданияВСД");
	//Если обработка <> Неопределено Тогда
	//	Возврат Обработка.ЗаполнитьТабЧастьЭлементовДляСозданияВСД(ЭтотОбъект, ДокОсн);		
	//КонецЕсли;	
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
		Для каждого строкаДок из Докосн.Товары  Цикл
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

Функция ЗаполнитьРеквизитыСтрокиВСД(ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка)
	
//// вызов переопределения
//	Обработка = ФункцияПереопределена("ЗаполнитьРеквизитыСтрокиВСД");
//	Если обработка <> Неопределено Тогда
//		Возврат Обработка.ЗаполнитьРеквизитыСтрокиВСД(ЭтотОбъект, НоваяСтрока, СтрокаОснования, ДокСсылка);
//		//Возврат;
//	КонецЕсли;	
	
//	НоваяСтрока.Номенклатура 			= СтрокаОснования.Номенклатура;
//	НоваяСтрока.Продукция_Элемент 		= СтрокаОснования.Продукция_Элемент;
//	НоваяСтрока.ЕдиницаИзмерения 		= НоваяСтрока.Партия.ЕдиницаИзмерения;
	// 
	Попытка
		НоваяСтрока.Продукция 				= НоваяСтрока.Продукция_Элемент.Продукция;
		НоваяСтрока.ВидПродукции 			= НоваяСтрока.Продукция_Элемент.ВидПродукции;
		НоваяСтрока.НаименованиеПродукции 	= НоваяСтрока.Продукция_Элемент.Наименование;
	Исключение КонецПопытки;
	
	Попытка НоваяСтрока.GTIN 					= НоваяСтрока.Продукция_Элемент.GTIN; Исключение КонецПопытки;
	Попытка НоваяСтрока.Артикул	 				= НоваяСтрока.Продукция_Элемент.Артикул; Исключение КонецПопытки;
	
	Попытка
		НоваяСтрока.Цель 					= НоваяСтрока.Продукция_Элемент.ВидПродукции.Цель;
		Если НЕ ЗначениеЗаполнено(НоваяСтрока.Цель) Тогда 
			НоваяСтрока.Цель = ПараметрыОрганизации["ВСДЦель"];
		КонецЕсли;
	Исключение КонецПопытки;
	
	Если докСсылка.Метаданные().ТабличныеЧасти.Найти("УровниУпаковки") <> Неопределено тогда
		Если НЕ(ЗначениеЗаполнено( ПараметрыОрганизации["ПарамНомерУровняУпаковкиДляВСД"] )) или НЕ(ЗначениеЗаполнено( ПараметрыОрганизации["ПарамФормаУпаковкиДляВСД"])) Тогда
			//СообщитьИнфо("Не аполнены Параметры для упаковки на уровнях");
			Возврат "";	
		КонецЕсли;
	// Упаковка на уровнях
		Попытка
		
			Если ЗначениеЗаполнено(СтрокаОснования.Упаковки) Тогда
				Если Цел(СтрокаОснования.Упаковки/СтрокаОснования.Количество*НоваяСтрока.Количество) = 0 Тогда
					ВСД.СообщитьИнфо("Нулевое кол-во упаковки у "+СтрокаОснования.Продукция_Элемент+" в "+ДокСсылка);	
				иначе
			
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
Процедура ЗаполнитьТабЧастьВСД(ПараметрыОрганизации, ДанныеЗаполнения = Неопределено, докСсылка, тзАктуальныхПартий = Неопределено) Экспорт
// заполняет ТЧ документа ВСД по Входящим данным , вызывается из ЗаполнитьНаосновании ВСД2_Транзакция
// ДанныеЗаполнения = Документ основание, берем из него ТЧ для расчета Кол-ва и Продэлементы для фильтра партий,
// также данные для заполнения Маркировок

// Добавлен реквизит - тзЭлементыОснования = ТЧ докоснования, для подбора Партий без Документа Основания
// Оптимизировать в дальнейшем входящие Параметры !!! ЖД

// вызов переопределения
	//Обработка = ФункцияПереопределена("ЗаполнитьТЧВСД");
	//Если обработка <> Неопределено Тогда
	//	Обработка.ЗаполнитьТЧВСД(ЭтотОбъект, ДанныеЗаполнения, докСсылка, тзАктуальныхПартий, ПолеСортировки, ЗнакСортировки, тзЭлементыОснования);
	//	Возврат;
	//КонецЕсли;	

	//Если (тзЭлементыОснования = Неопределено) и НЕ(ДанныеЗаполнения = Неопределено) тогда
	Если ЗначениеЗаполнено( ДанныеЗаполнения ) тогда
		тзЭлементыОснования = ВыгрузитьТЧ(ДанныеЗаполнения.Ссылка, ПараметрыОрганизации ); 		
	КонецЕсли;
	
//	Если НЕ ЗначениеЗаполнено(тзАктуальныхПартий) Тогда
//		Попытка
//			тзАктуальныхПартий = ВСД.ПолучитьАктуальныеПартии(тзЭлементыОснования.ВыгрузитьКолонку("Продукция_Элемент"), докСсылка.Отправитель_Площадка, докСсылка.Отправитель_ХозСубъект,СписокКонстант, ПолеСортировки , ЗнакСортировки);
//		Исключение
//			СообщитьИнфо("Не переданы параметры для получения Актуальных партий - ДанныеЗаполнения или тзЭлементыОснования");
//			Возврат;
//		КонецПопытки;
//	КонецЕсли;
	
	//Если СписокКонстант = Неопределено Тогда
	//	СписокКонстант = ВСД.ЗагрузитьПараметры( ДокСсылка.Организация );
	//КонецЕсли;
	
	//Парам = Новый Структура("Организация, Отправитель_ХозСубъект, Отправитель_Площадка",докСсылка.Организация,докСсылка.Отправитель_ХозСубъект,докСсылка.Отправитель_Площадка);	
	ПартииКСписанию = ВСД.тзПартииСписанияПоТзПродукция_Элемент( ПараметрыОрганизации, тзЭлементыОснования, тзАктуальныхПартий, докСсылка.Получатель_ХозСубъект.ПарамКолонкаСортировкиПартииСписания, докСсылка.Получатель_ХозСубъект.ПарамЗнакСортировкиУбывание );
	
	Если (ПартииКСписанию.Количество() = 0) и НЕ(ПараметрыОрганизации["ПарамЗаполнятьТранзакциюПриОтсутствииПартий"]) Тогда
		ВСД.СообщитьИнфо("Нет актуальных партий для создания ВСД по "+ ?(ДанныеЗаполнения = Неопределено,"Переданным данным",ДанныеЗаполнения.Ссылка));
		Возврат;
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
КонецПроцедуры

#КонецОбласти