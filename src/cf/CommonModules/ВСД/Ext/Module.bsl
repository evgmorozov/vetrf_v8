﻿//ТЕСТ Фоновое задание УП
Функция ВыполнитьВФоне(Парам,Парам2) Экспорт
//	к=1;
//	Сообщить(Парам);
//	Сообщить(Парам2);
//	АдресОбработки = Парам;
//	ОбъектОбработки 	= ПолучитьИзВременногоХранилища(АдресОбработки).ОбработкаВСД;
	ОбъектОбработки = ИнициализацияОбработки(Парам);
	ОбъектОбработки.ИнициализацияХС_ЗагрузитьЦелиТЕСТ();
КонецФункции


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
		Сообщить("Ошибка получения модуля Типовой конфигурации "+Имя);
		Сообщить(ОписаниеОшибки());
		Возврат Неопределено;
	КонецПопытки;
	
	Возврат Модуль;
	
КонецФункции

Функция ПолучитьОрганизациюПоУмолчанию() Экспорт
Попытка	
	Если Метаданные.ОбщиеМодули.Найти("БухгалтерскийУчетПереопределяемый") <> Неопределено Тогда
		//БП 3.0
		МодульТиповойКонфы = ОбщийМодуль("БухгалтерскийУчетПереопределяемый");
		Возврат МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
	ИначеЕсли Метаданные.ОбщиеМодули.Найти("УправлениеПользователями") <> Неопределено Тогда
		//УПП
		МодульТиповойКонфы = ОбщийМодуль("УправлениеПользователями");
		//МодульТиповойКонфы2 = ОбщийМодуль("ГлобальныйМодуль");
		ТекПользователь = ПараметрыСеанса.ТекущийПользователь;//МодульТиповойКонфы2.глЗначениеПеременной("глТекущийПользователь");// ИмяПользователя();
		Возврат МодульТиповойКонфы.ПолучитьЗначениеПоУмолчанию(ТекПользователь,"ОсновнаяОрганизация");
	Иначе
		Сообщить("Для данной конфигурации 1С не удалось получить значение Организации по умолчанию");
		Сообщить("Обратитесь в ТП КБ99");
		Возврат Справочники.Организации.ПустаяСсылка();
	КонецЕсли;
Исключение
	Сообщить("Для данной конфигурации 1С не удалось получить значение Организации по умолчанию");
	Сообщить("Обратитесь в ТП КБ99");
	Сообщить(ОписаниеОшибки());
	Возврат Справочники.Организации.ПустаяСсылка();
КонецПопытки
//БП 3	Организация = БухгалтерскийУчетПереопределяемый.ПолучитьЗначениеПоУмолчанию("ОсновнаяОрганизация");
//УПП         Организация   =  УправлениеПользователями.ПолучитьЗначениеПоУмолчанию(глЗначениеПеременной("глТекущийПользователь"),"ОсновнаяОрганизация");
КонецФункции
// ************* окончание ф-ции универсализации вызова методов типовых конфигураций

Функция ЕстьРеквизитОбъекта(ИмяРеквизита, знач ОбъектСсылка) Экспорт
	Попытка
		ОбОбъект = ОбъектСсылка.ПолучитьОбъект();
		МетаданныеОбъекта = ОбОбъект.Метаданные();
		Если МетаданныеОбъекта.Реквизиты.Найти(ИмяРеквизита) = Неопределено Тогда
			Возврат Ложь;
		Иначе
			Возврат Истина;
		КонецЕсли;
	Исключение
		Сообщить("Указана не ссылка на объект? Модуль ВСД, ЕстьРеквизитОбъекта("+ОбъектСсылка+")?");
		Сообщить(ОписаниеОшибки());
	    Возврат Ложь;
	КонецПопытки;
КонецФункции 

Функция ПолучитьЗначениеРевизитаОбъекта_НаСервере(ВыбОбъект,Реквизит) экспорт
	// это раньше делалось просто через точку прямо в модуле формы
	Попытка
		Возврат ВыбОбъект[Реквизит];
	Исключение
		Сообщить("Указан неверный реквизит "+Реквизит+" для объекта "+ВыбОбъект);
		Сообщить(ОписаниеОшибки());
		Возврат "";
	КонецПопытки
КонецФункции

Функция ПутьКфайлуИзПолного(ПутьИИмяВход) Экспорт
	ПутьИИмя = ПутьИИмяВход;
	Путь = "";
	Имя  = "";
	ПозСлэш = Найти(ПутьИИмя,"\");
	Пока ПозСлэш > 0 Цикл
    	Путь = Путь+Сред(ПутьИИмя,1,ПозСлэш);
	    ПутьИИмя = Сред(ПутьИИмя,ПозСлэш+1);
    	ПозСлэш = Найти(ПутьИИмя,"\");
	КонецЦикла;
	Имя = ПутьИИмя;
	Возврат Путь;
//	КаталогОбработок = Путь;
//	ИмяОбработкиИнтеграции = Имя;
	//Сообщить(Путь);
	//Сообщить(Имя);	
КонецФункции

//**********
Функция ПолучитьОрганизациюПоХС(ВыбХозСубъект) Экспорт
	Рез = "";
	Запрос = Новый Запрос;
    Запрос.Текст = 
        "ВЫБРАТЬ
        |   Организация.ссылка
        |ИЗ
        |   Справочник.Организации КАК Организация";
 
    РезультатЗапроса = Запрос.Выполнить();
 
    ВыборкаОрг = РезультатЗапроса.Выбрать();
 
    Пока ВыборкаОрг.Следующий() Цикл
		СпПарам = ЗагрузитьПараметры(ВыборкаОрг.Ссылка);
		Если СпПарам.Получить("Отправитель_ХозСубъект") = ВыбХозСубъект Тогда
			Возврат ВыборкаОрг.Ссылка;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	Возврат Рез;
КонецФункции

Функция НайтиХозСубъект(Контрагент) Экспорт

     Если НЕ(ЗначениеЗаполнено(Контрагент)) Тогда
         Возврат "";
     КонецЕсли;

     //стандартное поведение функции
     ВыбКонтрагент = Контрагент.ГоловнойКонтрагент;

     Запрос = Новый Запрос("ВЫБРАТЬ
                           |    ВСД_ХозСубъект.Ссылка
                           |ИЗ
                           |    Справочник.ВСД_ХозСубъект КАК ВСД_ХозСубъект
                           |ГДЕ
                           |    ВСД_ХозСубъект.Контрагент = &ВыбКонтрагент");
     Запрос.УстановитьПараметр("ВыбКонтрагент", ВыбКонтрагент );

     Результат = Запрос.Выполнить().Выбрать();

     Если Результат.Следующий() Тогда
         Ответ = Результат.Ссылка;
     Иначе
         СпрХС = Справочники.ВСД_ХозСубъект.СоздатьЭлемент();
         СпрХС.Наименование = ВыбКонтрагент.Наименование;
         СпрХС.Контрагент = ВыбКонтрагент;
         СпрХС.Записать();
         Сообщить("Создан новый элемент справочника ВСД_ХозСубъект:"+ВыбКонтрагент);

         Ответ = спрХС.Ссылка;
     КонецЕсли;

     Возврат Ответ;
КонецФункции

Функция НайтиПлощадкуПоКонтрагенту(ВыбКонтрагент) Экспорт
     Если НЕ(ЗначениеЗаполнено(ВыбКонтрагент)) Тогда
         Возврат "";
     КонецЕсли;

     Запрос = Новый Запрос("ВЫБРАТЬ
                           |    ВСД_Площадка.Ссылка
                           |ИЗ
                           |    Справочник.ВСД_Площадка КАК ВСД_Площадка
                           |ГДЕ
                           |    ВСД_Площадка.Контрагент = &ВыбКонтрагент");
     Запрос.УстановитьПараметр("ВыбКонтрагент", ВыбКонтрагент );

     Результат = Запрос.Выполнить().Выбрать();

     Если Результат.Следующий() Тогда
         Ответ = Результат.Ссылка;
     Иначе
         Ответ = "";
     КонецЕсли;

     Возврат Ответ;
КонецФункции

Функция НайтиПлощадкуПоСкладу(ВыбСклад, ВыбХозСубъект) Экспорт
     Если НЕ(ЗначениеЗаполнено(ВыбСклад)) Тогда
         Возврат "";
     КонецЕсли;
	 Если НЕ(ЗначениеЗаполнено(ВыбХозСубъект)) Тогда
		 Сообщить("Не указан параметр ВыбХозСубъект для ВСД.НайтиПлощадкуПоСкладу ");
         Возврат "";
	 КонецЕсли;
	 Запрос = Новый Запрос("ВЫБРАТЬ
                           |	ВСД_Площадка.Ссылка
                           |ИЗ
                           |	Справочник.ВСД_Площадка КАК ВСД_Площадка
                           |ГДЕ
                           |	ВСД_Площадка.Склад = &ВыбСклад
                           |	И ВСД_Площадка.GuidХозСубъекта = &GuidХозСубъекта");
     Запрос.УстановитьПараметр("ВыбСклад", ВыбСклад );
	 Запрос.УстановитьПараметр("GuidХозСубъекта", ВыбХозСубъект.GUID );

     Результат = Запрос.Выполнить().Выбрать();

     Если Результат.Следующий() Тогда
         Ответ = Результат.Ссылка;
     Иначе
         Ответ = "";
     КонецЕсли;

     Возврат Ответ;
КонецФункции

Функция ПолучитьГуидХозСубъекта(ХС) Экспорт
	Организация = ПолучитьОрганизациюПоУмолчанию();

	Если Организация.Пустая() Тогда
         Сообщить("Не определена Основная Организация пользователя", СтатусСообщения.ОченьВажное);
     КонецЕсли;

     Обработка = ИнициализацияОбработки( Организация );

     Обработка.ХС_ПолучитьGuid(ХС);

КонецФункции

Функция ЗагрузитьПлощадки(ХС) Экспорт
	Организация = ПолучитьОрганизациюПоУмолчанию();
	 Если Организация.Пустая() Тогда
         Сообщить("Не определена Основная Организация пользователя",СтатусСообщения.ОченьВажное);
     КонецЕсли;
     Обработка = ИнициализацияОбработки(Организация );
     Обработка.ЗагрузитьПлощадки(ХС);
КонецФункции

Функция УдалитьНайтиКонтрагентаОрганизации(ВыбОрганизация) Экспорт
// Изменить или избавиться
     Запрос = Новый Запрос;
     Запрос.УстановитьПараметр("ВидСвязи"  , Перечисления.ВидыСобственныхКонтрагентов.Организация);
     Запрос.УстановитьПараметр("Основание" , ВыбОрганизация);

     Запрос.Текст = "
     |ВЫБРАТЬ
     |   Контрагент
     |ИЗ
     |   РегистрСведений.СобственныеКонтрагенты
     |ГДЕ Объект     = &Основание
     |    И ВидСвязи = &ВидСвязи";

     Выборка = Запрос.Выполнить().Выбрать();

     Если Выборка.Следующий() Тогда
         Возврат Выборка.Контрагент;
     Иначе
         Возврат "";
     КонецЕсли;


КонецФункции

//выбираем партию, которая подходит под условия отбора: количество, свойство, площадка
Функция ВыбратьПартию(Продукция_Элемент, Отправитель_Площадка,Отпр_ХозСубъект) Экспорт
     Если НЕ ЗначениеЗаполнено(Отправитель_Площадка) Тогда
         Сообщить("Не указана площадка Отправителя!");
         Возврат "";
     КонецЕсли;
     Если НЕ ЗначениеЗаполнено(Отпр_ХозСубъект) Тогда
         Сообщить("Не указан ХС Отправителя!");
         Возврат "";
     КонецЕсли;


     Запрос = Новый Запрос;
     Запрос.Текст = "ВЫБРАТЬ
                    |	ВСД_Партия.Ссылка
                    |ИЗ
                    |	Справочник.ВСД_Партия КАК ВСД_Партия
                    |ГДЕ
                    |	ВСД_Партия.Получатель_Площадка = &Отправитель_Площадка
					|   И ВСД_Партия.Получатель_ХозСубъект.GUID = &ВыбХС
                    |	И ВСД_Партия.Продукция_Элемент = &Продукция_Элемент
                    |	И ВСД_Партия.Количество > 0
                    |	И ВСД_Партия.ПометкаУдаления = ЛОЖЬ";

     Запрос.УстановитьПараметр("Отправитель_Площадка"  ,Отправитель_Площадка);
	 Запрос.УстановитьПараметр("ВыбХС", Отпр_ХозСубъект.GUID);
     Запрос.УстановитьПараметр("Продукция_Элемент" , Продукция_Элемент);

     Выборка = Запрос.Выполнить().Выбрать();

     Если Выборка.Следующий() Тогда
         Возврат Выборка.Ссылка;
     Иначе
         Возврат Справочники.ВСД_Партия.ПустаяСсылка();
     КонецЕсли;

КонецФункции

//Удалить Процедура находит первый ВСД_Транзакцию на основании ДокОснование
Функция НайтиВСД2(ДокументОснование) Экспорт
     // ЖД Нужно ли нам удаленные???
     Запрос = Новый Запрос;
     Запрос.УстановитьПараметр("ДокументОснование" , ДокументОснование);

     Запрос.Текст = "ВЫБРАТЬ
                    |    ВСД2_транзакция.Ссылка
                    |ИЗ
                    |    Документ.ВСД2_транзакция КАК ВСД2_транзакция
                    |ГДЕ
                    |    (ВСД2_транзакция.ДокументОснование = &ДокументОснование)
					|    И (ВСД2_транзакция.ПометкаУдаления = ЛОЖЬ)
					|ОБЪЕДИНИТЬ
					|ВЫБРАТЬ
                    |    ВСД_транзакция.Ссылка
                    |ИЗ
                    |    Документ.ВСД_транзакция КАК ВСД_транзакция
                    |ГДЕ
                    |    (ВСД_транзакция.ДокументОснование = &ДокументОснование)
					|    И (ВСД_транзакция.ПометкаУдаления = ЛОЖЬ)";

     Выборка = Запрос.Выполнить().Выбрать();

     Если Выборка.Следующий() Тогда
         Возврат Выборка.Ссылка;
     Иначе
         Возврат "";
     КонецЕсли;

КонецФункции

//Процедура находит первый ВСД_Транзакцию на основании ДокОснование
Функция НайтиВСД(ДокументОснование, ЭтоПеремещениеотПоставщика = ЛОЖЬ) Экспорт
     // ЖД Нужно ли нам удаленные???
     Запрос = Новый Запрос;
     Запрос.УстановитьПараметр("ДокументОснование" , ДокументОснование);
	 Запрос.УстановитьПараметр("ЭтоПеремещение" , ЭтоПеремещениеотПоставщика);
     Запрос.Текст = "ВЫБРАТЬ
                    |	ВСД2_транзакция.Ссылка КАК Ссылка
                    |ИЗ
                    |	Документ.ВСД2_транзакция КАК ВСД2_транзакция
                    |ГДЕ
                    |	ВСД2_транзакция.ДокументОснование = &ДокументОснование
                    |	И ВСД2_транзакция.ПометкаУдаления = ЛОЖЬ
                    |	И ВСД2_транзакция.ЭтоПеремещениеОтПоставщика = &ЭтоПеремещение
                    |
                    |ОБЪЕДИНИТЬ
                    |
                    |ВЫБРАТЬ
                    |	ВСД_транзакция.Ссылка
                    |ИЗ
                    |	Документ.ВСД_транзакция КАК ВСД_транзакция
                    |ГДЕ
                    |	ВСД_транзакция.ДокументОснование = &ДокументОснование
                    |	И ВСД_транзакция.ПометкаУдаления = ЛОЖЬ";

     Выборка = Запрос.Выполнить().Выбрать();

     Если Выборка.Следующий() Тогда
         Возврат Выборка.Ссылка;
     Иначе
         Возврат "";
     КонецЕсли;

КонецФункции

//Процедура находит первый ВСД2_Производство на основании ДокОснование
Функция НайтиВСД_Производство(ДокументОснование) Экспорт
     // ЖД Нужно ли нам удаленные???
     Запрос = Новый Запрос;
     Запрос.УстановитьПараметр("ДокументОснование" , ДокументОснование);

     Запрос.Текст = "ВЫБРАТЬ
                    |    ВСД2_Производство.Ссылка
                    |ИЗ
                    |    Документ.ВСД2_Производство КАК ВСД2_Производство
                    |ГДЕ
                    |    (ВСД2_Производство.ДокументОснование = &ДокументОснование)
					|    И (ВСД2_Производство.ПометкаУдаления = ЛОЖЬ)";

     Выборка = Запрос.Выполнить().Выбрать();

     Если Выборка.Следующий() Тогда
         Возврат Выборка.Ссылка;
     Иначе
         Возврат "";
     КонецЕсли;

КонецФункции

//Процедура находит список ВСД и ВСД2 на основании ДокОснование
Функция НайтиВСД_Исходящий(ДокументОснование) Экспорт

     Запрос = Новый Запрос;
     Запрос.УстановитьПараметр("ДокументОснование" , ДокументОснование);

     Запрос.Текст = "ВЫБРАТЬ
                    |    ВСД2.Ссылка,
                    |    ВСД2.UUID
                    |ИЗ
                    |    Документ.ВСД2 КАК ВСД2
                    |ГДЕ
                    |    ВСД2.ДокументОснование = &ДокументОснование
					|ОБЪЕДИНИТЬ
					|ВЫБРАТЬ
                    |    ВСД.Ссылка,
                    |    ВСД.UUID
                    |ИЗ
                    |    Документ.ВСД КАК ВСД
					|ГДЕ
                    |    ВСД.ДокументОснование = &ДокументОснование";

     Выборка = Запрос.Выполнить().Выгрузить();

     Возврат Выборка;
     //Если Выборка.Следующий() Тогда
     //    Возврат Выборка.Ссылка;
     //Иначе
     //    Возврат "";
     //КонецЕсли;

КонецФункции

//Отправка любого ВСД
Процедура ОтправитьВСДвГИС(Знач ДокСсылка) Экспорт
	Обработка = ИнициализацияОбработки(ДокСсылка.Организация,Ложь);
	Если типЗнч(Обработка) = Тип("Строка") тогда
		Сообщить("Не удалось инициализировать обработку Интеграция");
		Возврат;
	КонецЕсли;
	
	Попытка
		Если типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД2_транзакция") Тогда
			Обработка.Отправить_ВСД2_транзакция(ДокСсылка);
		ИначеЕсли типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД_транзакция") тогда
			Обработка.Отправить_ВСД_транзакция(ДокСсылка);
		ИначеЕсли типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД2_Инвентаризация") тогда
			Обработка.Отправить_ВСД2_Инвентаризация(ДокСсылка);
		ИначеЕсли типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД2_ОбъединениеПартий") тогда
			Обработка.Отправить_ВСД2_ОбъединениеПартий(ДокСсылка);
		ИначеЕсли типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД2_Производство") тогда
			Обработка.Отправить_ВСД2_Производство(ДокСсылка);
		ИначеЕсли типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД2_ЛабораторныеИсследования") тогда
			Обработка.Отправить_ВСД2_ЛабораторныеИсследования(ДокСсылка);
		иначе
			ДокВСД = НайтиВСД(ДокСсылка);
			Если Не ЗначениеЗаполнено(ДокВСД) Тогда
				Сообщить("Не найдены ВСД для Отправки");
				Возврат;
			КонецЕсли;			
			Если (ТипЗнч(ДокВСД) = Тип("ДокументСсылка.ВСД_транзакция")) тогда
				Обработка.Отправить_ВСД_транзакция(ДокВСД);		
			ИначеЕсли (ТипЗнч(ДокВСД) = Тип("ДокументСсылка.ВСД2_транзакция")) тогда	
				Обработка.Отправить_ВСД2_транзакция(ДокВСД);
			Иначе
				Сообщить("Данный вид документа не отправляется" + ДокВСД);
			КонецЕсли;
		КонецЕсли;
	Исключение
		Сообщить("Ошибка в Процедуре ВСД ОтправитьВСДвГИС");
		Сообщить(ОписаниеОшибки());
	КонецПопытки;
КонецПроцедуры

Функция ОтправитьВГис(ДокОснование) Экспорт
	ОтправитьВСДвГИС(ДокОснование);
	Возврат "";
	
	// ************** Удалить ниже
	Если (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД_транзакция")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2_транзакция")) тогда	
		ДокВСД = ДокОснование;
	Иначе
		ДокВСД = НайтиВСД(ДокОснование);   //Отправка Транзакции, ДокОснование = основание Транзакции
	КонецЕсли;
	Если Не ЗначениеЗаполнено(ДокВСД) Тогда
		Сообщить("Не найдены ВСД для Отправки");
		Возврат "";
	КонецЕсли;
	
	Обработка = ИнициализацияОбработки( ДокОснование.Организация );
	Если типЗнч(Обработка) = Тип("Строка") тогда
		Сообщить("Не удалось инициализировать обработку Интеграция");
		Возврат "";
	КонецЕсли;
	
	Если (ТипЗнч(ДокВСД) = Тип("ДокументСсылка.ВСД_транзакция")) тогда
		Обработка.Отправить_ВСД_транзакция(ДокВСД);		
	ИначеЕсли (ТипЗнч(ДокВСД) = Тип("ДокументСсылка.ВСД2_транзакция")) тогда	
		Обработка.Отправить_ВСД2_транзакция(ДокВСД);
	Иначе
		Сообщить("Данный вид документа не отправляется" + ДокВСД);
	КонецЕсли;

КонецФункции

//Гашение ВСД Поставщика
Функция ПогаситьВСДПоставщика(Знач ДокСсылка) Экспорт
	Обработка = ИнициализацияОбработки(ДокСсылка.Организация, ложь);
	Если типЗнч(Обработка) = Тип("Строка") тогда
		Сообщить("Не удалось инициализировать обработку Интеграция");
		Возврат "";
	КонецЕсли;
	
	Попытка
		Если (типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД2_транзакция")) или (типЗнч(ДокСсылка) = Тип("ДокументСсылка.ВСД_транзакция")) Тогда
			Возврат Обработка.ПогаситьВСДПоставщика(ДокСсылка);
		иначе
			Сообщить("Данный вид документа не гасится" + ДокСсылка);
			Возврат "";
		КонецЕсли;
	Исключение
		Сообщить("Ошибка в Процедуре ВСД ПогаситьВСДПоставщика");
		Сообщить(ОписаниеОшибки());
		Возврат "";
	КонецПопытки;
КонецФункции

Функция АннулироватьВСД(ДокОснование) Экспорт
	ЭтоДокРезультат = ложь;
	Если (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД_транзакция")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2_транзакция")) тогда	
		ДокВСД = ДокОснование;
	ИначеЕсли (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2")) тогда
		 ЭтоДокРезультат = Истина;
		 ДокВСД = ДокОснование;
	 Иначе
		ДокВСД = НайтиВСД(ДокОснование);
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ДокВСД) Тогда
		Сообщить("Не найдены ВСД для Аннулирования");
		Возврат "";
	КонецЕсли;

	Если ((НЕ ЭтоДокРезультат) и НЕ(СокрЛП(ДокВСД.Статус) = "COMPLETED")) и (ЭтоДокРезультат и НЕ(СокрЛП(ДокВСД.Статус) = "COFIRMED")) Тогда
		Сообщить("Не найдены ВСД для Аннулирования");
		Возврат "";		
	КонецЕсли;
	
	Обработка = ИнициализацияОбработки( ДокОснование.Организация, Ложь );
	Если типЗнч(Обработка) = Тип("Строка") тогда
		Сообщить("Не удалось инициализировать обработку Интеграция");
		Возврат "";
	КонецЕсли;
	Если этоДокРезультат Тогда
		Обработка.Отправить_ВСД2_Аннулирование(ДокВСД);
	Иначе
		Обработка.Аннулировать_ВСД2_транзакция(ДокВСД);
	КонецЕсли;
	
КонецФункции

Функция УдалитьОткрытьВСДВБраузере(ТестовыйРежим, _UUID, РежимПечать = ложь)
	Если Режимпечать Тогда
         Если ТестовыйРежим Тогда
  			ЗапуститьПриложение("https://t2-mercury.vetrf.ru/pub/operatorui?_action=printVetDocumentByUuid&uuid="+_UUID);
         Иначе
  			ЗапуститьПриложение("https://mercury.vetrf.ru/pub/operatorui?_action=printVetDocumentByUuid&uuid="+_UUID);
         КонецЕсли;
	Иначе
		Если ТестовыйРежим Тогда
			ЗапуститьПриложение("https://t2-mercury.vetrf.ru/pub/operatorui?_action=findVetDocumentFormByUuid&uuid="+_UUID);
		Иначе
			ЗапуститьПриложение("https://mercury.vetrf.ru/pub/operatorui?_action=findVetDocumentFormByUuid&uuid="+_UUID);
		КонецЕсли;
	КонецЕсли;
КонецФункции

Функция ПутьВСДВБраузере(ТестовыйРежим, _UUID, РежимПечать = ложь)
	Если Режимпечать Тогда
         Если ТестовыйРежим Тогда
  			Возврат ("https://t2-mercury.vetrf.ru/pub/operatorui?_action=printVetDocumentByUuid&uuid="+_UUID);
         Иначе
  			Возврат ("https://mercury.vetrf.ru/pub/operatorui?_action=printVetDocumentByUuid&uuid="+_UUID);
         КонецЕсли;
	Иначе
		Если ТестовыйРежим Тогда
			Возврат ("https://t2-mercury.vetrf.ru/pub/operatorui?_action=findVetDocumentFormByUuid&uuid="+_UUID);
		Иначе
			Возврат ("https://mercury.vetrf.ru/pub/operatorui?_action=findVetDocumentFormByUuid&uuid="+_UUID);
		КонецЕсли;
	КонецЕсли;
КонецФункции

Функция ОткрытьВСДвГИС(ДокОснование) Экспорт
     СписокПараметров = ЗагрузитьПараметры( ДокОснование.Организация );
     ТестовыйРежим = СписокПараметров.Получить("ТестовыйРежим");
	 СзПутиВСД = Новый СписокЗначений;
	Если (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД_транзакция")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2_транзакция")) тогда		 
		ДокВСД = ДокОснование;
	ИначеЕсли (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2")) тогда		 
		 СзПутиВСД.Добавить(ПутьВСДВБраузере(ТестовыйРежим, ДокОснование.UUID));
		Возврат СзПутиВСД;
	Иначе
		ДокВСД = НайтиВСД(ДокОснование);	 
	КонецЕсли;
     
    СписокВСД_Исх = НайтиВСД_Исходящий(ДокВСД);
    Для Каждого стр Из СписокВСД_Исх Цикл
		//ОткрытьВСДВБраузере(ТестовыйРежим, стр.UUID);
		СзПутиВСД.Добавить(ПутьВСДВБраузере(ТестовыйРежим, стр.UUID)); //Для открытия на клиенте Сревер Реальный
    КонецЦикла;
	Возврат  СзПутиВСД;
КонецФункции

Функция ПечатьПолнойФормыВСД(ДокОснование) Экспорт
	СзПутиВСД = Новый СписокЗначений;
     СписокПараметров = ЗагрузитьПараметры( ДокОснование.Организация );
     ТестовыйРежим = СписокПараметров.Получить("ТестовыйРежим");
	Если (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД_транзакция")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2_транзакция")) тогда		 
		ДокВСД = ДокОснование;
	ИначеЕсли (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД")) или
		 (ТипЗнч(ДокОснование) = Тип("ДокументСсылка.ВСД2")) тогда
		 //ОткрытьВСДВБраузере(ТестовыйРежим, ДокОснование.UUID,истина);
		 СзПутиВСД.Добавить(ПутьВСДВБраузере(ТестовыйРежим, ДокОснование.UUID,истина));
		Возврат СзПутиВСД;
	Иначе
		ДокВСД = НайтиВСД(ДокОснование);	 
	КонецЕсли;
	 
	СписокВСД_Исх = НайтиВСД_Исходящий(ДокВСД);
	Для Каждого стр Из СписокВСД_Исх Цикл
 		//ОткрытьВСДВБраузере(ТестовыйРежим, стр.UUID,истина);
		СзПутиВСД.Добавить(ПутьВСДВБраузере(ТестовыйРежим, стр.UUID,Истина));
    КонецЦикла;
		 
	Возврат СзПутиВСД;
КонецФункции

Функция ПечатьВнешнейФормыВСД(знач ДокОснование, ФайлВнешнейОбработки = "") Экспорт
	Если Не ЗначениеЗаполнено(ФайлВнешнейОбработки) Тогда
    	СписокПараметров = ЗагрузитьПараметры( ДокОснование.Организация );	 
		//Адресобработки = ПутьКфайлуИзПолного(СписокПараметров.Получить("ПолноеИмяФайлаОбработки"))+"Внешняя_Форма_ВСД.epf";
		Адресобработки = СписокПараметров.Получить("КаталогИнтеграции")+"Внешняя_Форма_ВСД.epf";
	Иначе
		Адресобработки = ФайлВнешнейОбработки;
	КонецЕсли;
	
	ФайлНаДиске = Новый Файл(Адресобработки);
    Если Не ФайлНаДиске.Существует() Тогда
        Сообщить("Не существует обработка печати "+Адресобработки);
		Возврат Неопределено;
    КонецЕсли;	 
	ОбработкаПечати = ВнешниеОбработки.Создать(Адресобработки,Ложь);
	Возврат ОбработкаПечати.ПечатьВнешнейПечатнойФормы(ДокОснование, "", "");
КонецФункции

//===================================================================================
//Подключение и Инициализация внешней Обработки Интеграция
Функция ИнициализацияОбработки( Организация="", Инициализировать = Истина) Экспорт

	Если Организация = "" Тогда
		Организация = ПолучитьОрганизациюПоУмолчанию();
         Если Организация.Пустая() Тогда
             Сообщить("Не определена Основная Организация пользователя",СтатусСообщения.ОченьВажное);
         КонецЕсли;
     КонецЕсли;

     СписокПараметров = ЗагрузитьПараметры( Организация );

     //АдресФайла= СписокПараметров.Получить("ПолноеИмяФайлаОбработки");
	 АдресФайла = СписокПараметров.Получить("КаталогИнтеграции")+"Интеграция_ГИС_Меркурий.epf";
     Если НЕ ЗначениеЗаполнено(АдресФайла) Тогда
         Сообщить("Параметры не заполнены!");
         Возврат "";
     Иначе
		 Обработка = ВнешниеОбработки.Создать(АдресФайла,ложь);
         Обработка.Организация = Организация;
		 Если Инициализировать Тогда
         	Обработка.Инициализация();
		 КонецЕсли;
         Возврат Обработка;
     КонецЕсли;

КонецФункции

Функция ЗагрузитьПараметры( _Организация  ) Экспорт

     КлючОбъекта  = "ВСД";
     //КлючНастроек = "НастройкиВСД";
     ВладелецНастроек = ИмяПользователя();
     // Для восстановления настроек необходимо воспользоваться функцией Загрузить
     СтруктураНастроек = Неопределено;
     Попытка
         //СписокПараметров = ХранилищеОбщихНастроек.Загрузить(КлючОбъекта,Строка(КлючНастроек),,ВладелецНастроек); // на пользователя
		 СписокПараметров = ХранилищеОбщихНастроек.Загрузить(КлючОбъекта,Строка(_Организация),,_Организация);
         // если настроек нет, то будет возвращено значение "Неопределено"
     Исключение
         Сообщить("Нет прав на восстановление настроек.");
     КонецПопытки;

     Если СписокПараметров = Неопределено Тогда
         Сообщить("Не удалось загрузить настройки "+_Организация+" - "+КлючОбъекта+" - "+ВладелецНастроек);
         СписокПараметров = Новый("Соответствие");
     КонецЕсли;

     Возврат СписокПараметров;

КонецФункции
//===================================================================================

Функция Получить_ВСД_Продукция_Элемент(Номенклатура) Экспорт
     Запрос = Новый Запрос;
     Запрос.Текст = "ВЫБРАТЬ
                    |    ВСД_Соответсвия.ПродукцияЭлемент КАК ПродукцияЭлемент
                    |ИЗ
                    |    РегистрСведений.ВСД_Соответсвия КАК ВСД_Соответсвия
                    |ГДЕ
                    |    ВСД_Соответсвия.Номенклатура = &ВыбНоменклатура";
     Запрос.УстановитьПараметр("ВыбНоменклатура", Номенклатура);

     Выборка = Запрос.Выполнить().Выбрать();
     Если Выборка.Следующий() Тогда
         ПродукцияЭлемент = Выборка.ПродукцияЭлемент;
     Иначе
         ПродукцияЭлемент = Справочники.ВСД_Продукция_Элемент.ПустаяСсылка();
     КонецЕсли;

     Возврат ПродукцияЭлемент;

КонецФункции

Процедура Установить_Соответствие_ВСД_Продукция_Элемент(Номенклатура,ВСД_Продукция_Элемент) Экспорт
     Набор = РегистрыСведений.ВСД_Соответсвия.СоздатьНаборЗаписей();
     Набор.Отбор.Номенклатура.Установить(Номенклатура);
     Набор.Отбор.Номенклатура.Использование = Истина;
     Набор.Прочитать();
     Набор.Очистить(); // если что и было - подчистим
     НовЗапись = Набор.Добавить();
     НовЗапись.Номенклатура = Номенклатура;
     НовЗапись.ПродукцияЭлемент = ВСД_Продукция_Элемент;
     Набор.Записать(true);
	 Сообщить(""+Номенклатура+" --> "+ВСД_Продукция_Элемент+ " : установлено соответствие");
КонецПроцедуры

// Формирует список Партий по Фильтру
Функция СписокАктуальныхПартийПоФильтру_Запрос(ВСД_Продукция_Элемент="",ВСД_Площадка="", ВСД_ХозСубъект="") Экспорт
// ЖД ТЕСТ Выбор не Удаленных, не Пустых, по ВСД_Продукция_Элемент ,по Площадке
     Запрос = Новый Запрос;
	 ТекстЗапроса =         
         "ВЫБРАТЬ
         |    ВСДПартия.Ссылка
         |ИЗ
         |    Справочник.ВСД_Партия КАК ВСДПартия
         |ГДЕ
         |    ВСДПартия.ПометкаУдаления = ЛОЖЬ
		 |    И ВСДПартия.Количество > 0";
	 Если ЗначениеЗаполнено(ВСД_Продукция_Элемент) Тогда
		 ТекстЗапроса = ТекстЗапроса + "		 
         |    И ВСДПартия.Продукция_Элемент = &ВыбПродукция_Элемент";
	 КонецЕсли;
	 Если ЗначениеЗаполнено(ВСД_Площадка) Тогда
		 ТекстЗапроса = ТекстЗапроса + "		 
         |    И ВСДПартия.Получатель_Площадка = &ВыбПлощадка";
	 КонецЕсли;
	 Если ЗначениеЗаполнено(ВСД_ХозСубъект) Тогда
		 ТекстЗапроса = ТекстЗапроса + "		 
         |    И ВСДПартия.Получатель_ХозСубъект.GUID = &ВыбХС";
	 КонецЕсли;
	 	 Запрос.Текст = ТекстЗапроса;
         Запрос.УстановитьПараметр("ВыбПлощадка", ВСД_Площадка);
         Запрос.УстановитьПараметр("ВыбПродукция_Элемент",ВСД_Продукция_Элемент);
	Если ЗначениеЗаполнено(ВСД_ХозСубъект) Тогда
		Запрос.УстановитьПараметр("ВыбХС", ВСД_ХозСубъект.GUID);
	КонецЕсли;
		 
    Возврат Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("Ссылка");
	
КонецФункции

Процедура ВыборПартийФильтр(Элемент, ВСД_Продукция_Элемент="",ВСД_Площадка="", ВСД_ХозСубъект="") Экспорт
         СписокЭлементов = СписокАктуальныхПартийПоФильтру_Запрос(ВСД_Продукция_Элемент,ВСД_Площадка, ВСД_ХозСубъект);
		 
         СЗЭлементов = Новый СписокЗначений;
         СЗЭлементов.ЗагрузитьЗначения(СписокЭлементов);

         //СтандартнаяОбработка = Ложь;

         ФормаВыбора = Справочники.ВСД_Партия.ПолучитьФормуВыбора(,Элемент,Элемент);
         ЭлементОтбора = ФормаВыбора.СправочникСписок.Отбор.Ссылка;
         ЭлементОтбора.ВидСравнения = ВидСравнения.ВСписке;
         ЭлементОтбора.Значение = СЗЭлементов;
         ЭлементОтбора.Использование = Истина;
		 ФормаВыбора.ЭлементыФормы.СправочникСписок.НастройкаОтбора.Ссылка.Доступность = Истина;
         ФормаВыбора.Открыть();

// Phsin
//    СтандартнаяОбработка = Ложь;
//     ФормаВыбора =  Справочники.ВСД_Партия.ПолучитьФормуВыбора(, Элемент);
//    ФормаВыбора.РежимВыбора = Истина;
// ФормаВыбора.Отбор.Продукция_Элемент.Установить(ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.ВСД_Продукция_Элемент,Истина);
//    ФормаВыбора.Открыть();
КонецПроцедуры
