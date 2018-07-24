﻿Перем Выбор_ВСД_Площадка;
Перем СзПарамГрузополучатель;
Перем СзПарамТермУсловияПеревозки;

Процедура кнПолучитьПартииНажатие(Элемент)
	ПолучитьПартии( );
КонецПроцедуры

Процедура кнПолучитьПартии2Нажатие(Элемент)
	ПолучитьПартии2( Отправитель_Площадка,ПартииСмещение,1,ПартииНач,ПартииКон,флПартииНенулевые )
КонецПроцедуры

Процедура ПриОткрытии(Отказ)
	Если Организация.Пустая() Тогда
		Организация   = УправлениеПользователями.ПолучитьЗначениеПоУмолчанию(глЗначениеПеременной("глТекущийПользователь"), "ОсновнаяОрганизация");
	КонецЕсли;	
	
	Инициализация();	
	Попытка
		Версия = Компонента.Версия;	
	Исключение
		Версия = "Не зарегистрирована";
	КонецПопытки;
	//ЖД РеквизитГрузополучатель
	СзПарамГрузополучатель = Новый СписокЗначений;
    СзПарамГрузополучатель.Добавить(0,"Контрагент");
    СзПарамГрузополучатель.Добавить(1,"Адрес Доставки");
	СзПарамГрузополучатель.Добавить(2,"Другое...");
	ТекПарам = СзПарамГрузополучатель.НайтиПоЗначению(РеквизитГрузополучатель);
	Если ТекПарам = Неопределено Тогда
		ЭлементыФОрмы.НадпГрузополучатель.Заголовок = "Установите!!!";
	Иначе
		ЭлементыФОрмы.НадпГрузополучатель.Заголовок = ТекПарам.Представление;
	КонецЕсли;
	
	//ЖД ТермУсловияПеревозки
	СзПарамТермУсловияПеревозки = Новый СписокЗначений;
    СзПарамТермУсловияПеревозки.Добавить(1,"Замороженный");
	СзПарамТермУсловияПеревозки.Добавить(2,"Охлажденный");
	СзПарамТермУсловияПеревозки.Добавить(3,"Охлаждаемый");
	СзПарамТермУсловияПеревозки.Добавить(4,"Вентилируемый");
	
	ТекПарам = СзПарамТермУсловияПеревозки.НайтиПоЗначению(ТермУсловияПеревозки);
	Если ТекПарам = Неопределено Тогда
		ЭлементыФОрмы.НадпТермУсловияПеревозки.Заголовок = "Установите!!!";
	Иначе
		ЭлементыФОрмы.НадпТермУсловияПеревозки.Заголовок = ТекПарам.Представление;
	КонецЕсли;
	ЭтаФорма.ЭлементыФормы.Партии.Колонки.ПолеСортировки.ТекстШапки = СокрЛП(ПарамКолонкаСортировкиПартииСписания);
	// Контроль заполненности параметров
	ПараметрыНеЗаполнены = Ложь;
	Если НЕ ЗначениеЗаполнено(НазваниеРеквизитаКоличество) или НЕ ЗначениеЗаполнено(ПарамКоэффициентПересчетаКоличества) или
		НЕ ЗначениеЗаполнено(НазваниеРеквизитаКоличествоМест) или НЕ ЗначениеЗаполнено(ВСДЦель)или НЕ ЗначениеЗаполнено(ВСД_РезультатыИсследований)
		или НЕ ЗначениеЗаполнено(ПарамКолонкаСортировкиПартииСписания) Тогда
		ПараметрыНеЗаполнены = Истина;
	КонецЕсли;
	//Если Не ОтбиратьСобытияПоДокументу Тогда
		
	//ДатаНачалаОтбора	= НачалоМесяца(ОбщегоНазначенияЗК.ПолучитьРабочуюДату());
	//ДатаОкончанияОтбора	= КонецМесяца(ОбщегоНазначенияЗК.ПолучитьРабочуюДату());
	ДатаНачалаОтбора = НачалоДня(ТекущаяДата());
	ДатаОкончанияОтбора = КонецДня(ТекущаяДата());
	Если ПараметрыНеЗаполнены Тогда
		ЭтаФорма.Панель.ТекущаяСтраница = ЭтаФорма.Панель.Страницы.Страница2;
		Возврат;
	КонецЕсли;
	//КонецЕсли;
	//
	//Если Не ЗначениеЗаполнено(ПериодРегистрации) Тогда
	//	ПериодРегистрации = НачалоМесяца(ОбщегоНазначенияЗК.ПолучитьРабочуюДату())
	//КонецЕсли;
			
	Автозаполнение(ЭтаФорма.ФПеремещения);

	//Если ЗначениеЗаполнено(ВСД_транзакция) Тогда
	//	Отправить_ВСД_транзакция( ВСД_транзакция );
	//	ЭтаФорма.Закрыть();
	//КонецЕсли;
	
КонецПроцедуры

Процедура ОбновлениеОтображения()
	ТекПарам = СзПарамГрузополучатель.НайтиПоЗначению(РеквизитГрузополучатель);
	Если ТекПарам = Неопределено Тогда
		ЭлементыФОрмы.НадпГрузополучатель.Заголовок = "Установите!!!";
	Иначе
		ЭлементыФОрмы.НадпГрузополучатель.Заголовок = ТекПарам.Представление;
	КонецЕсли;
КонецПроцедуры


Процедура СохранитьПараметры( КлючНастроек )
	
	СписокКонстант=Новый("Соответствие");
	СписокКонстант.Вставить("param_username", param_username);
	СписокКонстант.Вставить("param_password", param_password);
	СписокКонстант.Вставить("param_issuer_id", param_issuer_id);
	СписокКонстант.Вставить("param_service_id", param_service_id);
	СписокКонстант.Вставить("param_api_key", param_api_key);
	СписокКонстант.Вставить("param_intiator_login", param_intiator_login);
	СписокКонстант.Вставить("param_vetdoctor_login", param_vetdoctor_login);
	СписокКонстант.Вставить("param_vetdoctor_fio", param_vetdoctor_fio);	
	СписокКонстант.Вставить("param_vetdoctor_post", param_vetdoctor_post);	
	
	СписокКонстант.Вставить("Отправитель_Площадка", Отправитель_Площадка);
	СписокКонстант.Вставить("Отправитель_ХозСубъект", Отправитель_ХозСубъект );
	
	СписокКонстант.Вставить("Страна", Страна);
	СписокКонстант.Вставить("Регион", Регион);
	СписокКонстант.Вставить("Город", Город);
	СписокКонстант.Вставить("ВСД_Экспертиза", ВСД_Экспертиза);
	СписокКонстант.Вставить("ВСД_Местность", ВСД_Местность );
	СписокКонстант.Вставить("ВСД_ОсобыеОтметки", ВСД_ОсобыеОтметки);
	
	СписокКонстант.Вставить("ПаузаСек", ПаузаСек);	
	СписокКонстант.Вставить("РеквизитГрузополучатель", РеквизитГрузополучатель);	
			
	СписокКонстант.Вставить("ОтладкаЗапросовXML", ОтладкаЗапросовXML);	
	
	//СписокКонстант.Вставить(ВСД_Продукция_Свойство, "ВСД_Продукция_Свойство");
	СписокКонстант.Вставить("Перевозчик_ХозСубъект", Перевозчик_ХозСубъект);		
	//СписокКонстант.Вставить(НазваниеРеквизитаКоличествоМест, "НазваниеРеквизитаКоличествоМест");
	СписокКонстант.Вставить("ПропускатьПустыеСвойства", ПропускатьПустыеСвойства);		
	//СписокКонстант.Вставить(НазваниеВидаДокументаРеализация, "НазваниеВидаДокументаРеализация");		
	//СписокКонстант.Вставить(НазваниеРеквизитаКоличество, "НазваниеРеквизитаКоличество");
	
	СписокКонстант.Вставить("КаталогЛогов", КаталогЛогов);
	СписокКонстант.Вставить("ПаузаСек", ПаузаСек);		
	
	СписокКонстант.Вставить("ПолноеИмяФайлаОбработки", ПолноеИмяФайлаОбработки);		
	СписокКонстант.Вставить("ТестовыйРежим", ТестовыйРежим);	
	СписокКонстант.Вставить("ВыводитьПодробнуюИнформацию", ВыводитьПодробнуюИнформацию);	
	
	СписокКонстант.Вставить("Смещение", Смещение);
	СписокКонстант.Вставить("АвтоЗаписьВСДСоответствия", АвтоЗаписьВСДСоответствия);
	СписокКонстант.Вставить("НазваниеРеквизитаКоличество", НазваниеРеквизитаКоличество);
	СписокКонстант.Вставить("ПарамКоэффициентПересчетаКоличества", ПарамКоэффициентПересчетаКоличества);
	СписокКонстант.Вставить("ВСД_РезультатыИсследований", ВСД_РезультатыИсследований);
    СписокКонстант.Вставить("ТермУсловияПеревозки", ТермУсловияПеревозки);
	СписокКонстант.Вставить("ВСДЦель", ВСДЦель);
	СписокКонстант.Вставить("ПарамЗаполнятьТранзакциюПриОтсутствииПартий", ПарамЗаполнятьТранзакциюПриОтсутствииПартий);
	СписокКонстант.Вставить("ПарамНомерУровняУпаковкиДляВСД", ПарамНомерУровняУпаковкиДляВСД);
	СписокКонстант.Вставить("ПарамФормаУпаковкиДляВСД", ПарамФормаУпаковкиДляВСД);
	СписокКонстант.Вставить("НазваниеРеквизитаКоличествоМест", НазваниеРеквизитаКоличествоМест);
	СписокКонстант.Вставить("ПарамКолонкаСортировкиПартииСписания", ПарамКолонкаСортировкиПартииСписания);
	СписокКонстант.Вставить("ПарамЗнакСортировкиУбывание", ПарамЗнакСортировкиУбывание);
	
	//ИмяФайла = ИмяФайлаНастроек();
	//ЗначениеВФайл(ИмяФайла,СписокКонстант);
	////Предупреждение("Настройки сохранены!",3);
	//Сообщить("Настройки сохранены в "+ИмяФайла);
	
   // ключи могут быть произвольными строками
    КлючОбъекта  = "ВСД";
    //КлючНастроек = "НастройкиВСД";
    // настройки могут быть произвольного типа
	//Настройки    = Новый Структура;
	//Настройки.Вставить("Настройки", "123");

    // имя пользователя - пользователь владелец настроек, если параметр не указать,
    // то настройки будут сохранены для ТЕКУЩЕГО пользователя
    ИмяПользователя = ИмяПользователя();
    ХранилищеОбщихНастроек.Сохранить(КлючОбъекта,  Строка(КлючНастроек), СписокКонстант, , ИмяПользователя);		
	
	Сообщить("Настройки сохранены для "+ИмяПользователя+" - "+КлючНастроек);
КонецПроцедуры

Процедура кнСохранитьПараметрыНажатие(Элемент)
	СохранитьПараметры( Организация );
КонецПроцедуры

Процедура кнХС_ПолучитьGuidНажатие(Элемент)
	ХС_ПолучитьGuid(ВыбХС);
КонецПроцедуры

Функция ПроверитьDll() 
	Попытка
		Инициализация();
		//ВыборВерсии();
		
		//Предупреждение("Библиотека SoapDLL_test.dll зарегистрирована ");
		Попытка 
			Предупреждение("Библиотека "+ИмяDLL+".dll зарегистрирована, версия = "  + Компонента.Версия);
			Возврат 1;
		Исключение 
			Предупреждение("Библиотека "+ИмяDLL+" не зарегистрированна!");
			Возврат 0;
		Конецпопытки;	
	Исключение 
		Предупреждение("Библиотека "+ИмяDLL+" не зарегистрированна!");
		Возврат 0
	Конецпопытки;
КонецФункции

Процедура кнПроверитьDllНажатие(Элемент)
	ПроверитьDll();
КонецПроцедуры

Процедура кнЗагрузитьПлощадкиНажатие(Элемент)
	ЗагрузитьПлощадки(ВыбХС);
КонецПроцедуры

Процедура кнЗагрузитьСтраныНажатие(Элемент)
	ИнициализацияХС_ЗагрузитьСтраны();
КонецПроцедуры

Процедура кнЗагрузитьРегионыНажатие(Элемент)
	ИнициализацияХС_ЗагрузитьРегионы(Страна);
КонецПроцедуры

Процедура кнЗагрузитьГородаНажатие(Элемент)
	ИнициализацияХС_ЗагрузитьГорода(Регион);
КонецПроцедуры

Процедура кнЗагрузитьПродукциюНажатие(Элемент)
	ИнициализацияХС_ЗагрузитьПродукцию(1);
КонецПроцедуры

Процедура кнЗагрузитьЕдИзмНажатие(Элемент)
	ИнициализацияХС_ЗагрузитьЕдиницыИзмерения();
КонецПроцедуры

Процедура кнИнициализацияНажатие(Элемент)
	ИнициализацияХС();
КонецПроцедуры

Процедура кнСоздатьПлощадкуНажатие(Элемент)
	СоздатьПлощадку(ВыбПлощадка)
КонецПроцедуры

Процедура кнПривязатьПлощадкуНажатие(Элемент)
	СоздатьСвязьХозсубъектПлощадка(ВыбПлощадка)
КонецПроцедуры

Процедура кнОтправить_ВСД_ИсходящийНажатие(Элемент)
	Отправить_ВСД_Исходящий( ВСД_исходящий )
КонецПроцедуры

Процедура кнОтправить_ВСД_транзакцияНажатие(Элемент)  Экспорт
	Отправить_ВСД_транзакция( ВСД_транзакция );
КонецПроцедуры

Процедура кнОтправить_ВСД_ПроизводствоНажатие(Элемент)  Экспорт
	Отправить_ВСД2_Производство( ВСД_производство );
КонецПроцедуры


Процедура кнЗагрузитьПартииНажатие(Элемент)
	//ПолучитьПартии();
	Ответ = Вопрос("загрузить Все партии с площадки "+Отправитель_Площадка+" ?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ПолучитьПартии2( Отправитель_Площадка );
	КонецЕсли;
КонецПроцедуры

Процедура кнЗаполнитьНажатие(Элемент)
	Автозаполнение(ЭтаФорма.ФПеремещения);
КонецПроцедуры

Процедура кнЗагрузитьПлощадкиТЧНажатие(Элемент)
	//mitmond
	Тстр=элементыформы.ТабличноеПоле1.ТекущаяСтрока;
	Если Тстр=неопределено тогда
		НомСтр=0;
	иначе
		НомСтр=Тстр.номерстроки-1 ;
	конецесли;
	//end
	ЗагрузитьПлощадкиСписком();	
	Автозаполнение(ЭтаФорма.ФПеремещения);
	//mitmond
	элементыформы.ТабличноеПоле1.ТекущаяСтрока = элементыформы.ТабличноеПоле1.Значение[НомСтр] ;
	//end

КонецПроцедуры

// Обработка выбора формы
Процедура ПлощадкаНачалоВыбора(Элемент, СтандартнаяОбработка) Экспорт
	
	СтандартнаяОбработка = Ложь;
	Выбор_ВСД_Площадка = Элемент.Значение; // для последующего удаления привязки
   	ФормаВыбора =  Справочники.ВСД_Площадка.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
	Если ЗначениеЗаполнено(ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.ХозСубъект.GUID) Тогда
    	ФормаВыбора.Отбор.GuidХозСубъекта.Установить(ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.ХозСубъект.GUID, Истина);
	Иначе
    	ФормаВыбора.Отбор.GuidХозСубъекта.Установить("****", Истина);
	КонецЕсли;
    ФормаВыбора.Открыть();	
КонецПроцедуры

Процедура ТабличноеПоле1ПлощадкаПриИзменении(Элемент)
	
	//Очистим старое значение
	Попытка
		Если НЕ(Выбор_ВСД_Площадка = Справочники.ВСД_Площадка.ПустаяСсылка()) Тогда 
			СпрОб = Выбор_ВСД_Площадка.ПОлучитьОбъект();
			СпрОб.Контрагент = "";
			СпрОб.Записать();
		КонецЕсли;		
	Исключение
	КонецПопытки;
	Если НЕ (Элемент.Значение = Справочники.ВСД_Площадка.ПустаяСсылка()) Тогда 
		СпрОб = Элемент.Значение.ПОлучитьОбъект();
		СпрОб.Контрагент = ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.Грузополучатель;
		СпрОб.Записать();
	КонецЕсли;
КонецПроцедуры


Процедура кнСоздатьВСДНажатие(Элемент)
	СоздатьВСД2();
//		СоздатьВСД();
КонецПроцедуры


Процедура кнЗаполнитьТаблицуПартийНажатие(Элемент)
	ЗаполнитьТаблицуПартий();
	ЭтаФорма.Панель.ТекущаяСтраница = ЭтаФорма.Панель.Страницы.Страница5;
	ЭтаФорма.ЭлементыФормы.НадпИтогСписания.Заголовок = Партии.Итог("КоличествоСписания");
	ЭтаФорма.ЭлементыФормы.Партии.Колонки.ПолеСортировки.ТекстШапки = СокрЛП(ПарамКолонкаСортировкиПартииСписания);
КонецПроцедуры


Процедура ПартииПартияПриИзменении(Элемент)
	ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.Количество = Элемент.Значение.Количество;
КонецПроцедуры


Процедура ПартииПартияНачалоВыбора(Элемент, СтандартнаяОбработка)
// ЖД ТЕСТ Выбор партий по фильтру
	СтандартнаяОбработка = Ложь;
	ВСД.ВыборПартийФильтр(Элемент, ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.ВСД_Продукция_Элемент,Отправитель_Площадка,Отправитель_ХозСубъект);

// Phsin		
//	СтандартнаяОбработка = Ложь;
// 	ФормаВыбора =  Справочники.ВСД_Партия.ПолучитьФормуВыбора(, Элемент);
//    ФормаВыбора.РежимВыбора = Истина;
//    ФормаВыбора.Отбор.Продукция_Элемент.Установить(ЭтаФорма.ТекущийЭлемент.ТекущиеДанные.ВСД_Продукция_Элемент, Истина);
//    ФормаВыбора.Открыть();	
КонецПроцедуры


Процедура кнОтправитьВСДНажатие(Элемент)
	ОтправитьСписокВСД();
КонецПроцедуры


Процедура ТабличноеПоле1ПриВыводеСтроки(Элемент, ОформлениеСтроки, ДанныеСтроки)
	Если ПустаяСтрока(ДанныеСтроки.ХозСубъект.GUID)Тогда
		ОформлениеСтроки.ЦветФона = Новый Цвет(255,120,90);   //красный
	ИначеЕсли ДанныеСтроки.Площадка = Справочники.ВСД_Площадка.ПустаяСсылка() Тогда
		ОформлениеСтроки.ЦветФона = Новый Цвет(255,255,127);   //желтый
	ИначеЕсли ДанныеСтроки.ВСД = Неопределено Тогда
		//ОформлениеСтроки.ЦветФона = Новый Цвет(0, 150, 26);   //
	ИначеЕсли ДанныеСтроки.ВСД.Статус = "COMPLETED" Тогда
		ОформлениеСтроки.ЦветФона = Новый Цвет(0, 150, 26);   //
	КонецЕсли;
	
КонецПроцедуры


Процедура ПартииПриВыводеСтроки(Элемент, ОформлениеСтроки, ДанныеСтроки)
	Если НЕ ЗначениеЗаполнено(ДанныеСтроки.ВСД_Продукция_Элемент) Тогда
		 ОформлениеСтроки.ЦветФона = Новый Цвет(255,0,0);   //красный
	ИначеЕсли ДанныеСтроки.Партия = Справочники.ВСД_Партия.ПустаяСсылка() Тогда
		ОформлениеСтроки.ЦветФона = Новый Цвет(255,255,127);   //желтый
	ИначеЕсли ДанныеСтроки.Количество < ДанныеСтроки.КоличествоСписания Тогда
		ОформлениеСтроки.ЦветФона = Новый Цвет(255,0,0);   //красный
	ИначеЕсли ДанныеСтроки.Количество >= ДанныеСтроки.КоличествоСписания Тогда
		ОформлениеСтроки.ЦветФона = Новый Цвет(0, 150, 26);  //зеленый
	КонецЕсли;
	Если ЗначениеЗаполнено(ДанныеСтроки.ВСД_Производство) Тогда
		Если ЗначениеЗаполнено(ДанныеСтроки.ВСД_Производство.ApplicationID) и НЕ(СокрЛП(ДанныеСтроки.ВСД_Производство.Статус = "COMPLETED")) Тогда
			ОформлениеСтроки.ЦветФона = Новый Цвет(255,0,0);   //красный
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры


Процедура Организация1ПриИзменении(Элемент)
	//ЗагрузитьПараметры(Организация);
	Инициализация( );
	Автозаполнение(ЭтаФорма.ФПеремещения);
КонецПроцедуры


Процедура кнЗагрузитьПлощадкиПоНаименованиюНажатие(Элемент)
	НайтиПлощадкиПоНазванию(ВыбХС, Регион, 1);
КонецПроцедуры


Процедура кнЗагрузитьПлощадкиСпискомПоНаименованиюНажатие(Элемент)
	ЗагрузитьПлощадкиСписком(1);
	СнятьПометки();
КонецПроцедуры


Процедура КнопкаВыбораПериодаНажатие(Элемент)	
	
	Если НП.Редактировать() Тогда
		
		ДатаНачалаОтбора = НП.ПолучитьДатуНачала();
		ДатаОкончанияОтбора = НП.ПолучитьДатуОкончания();
				
		Автозаполнение(ЭтаФорма.ФПеремещения);
	КонецЕсли;
	
КонецПроцедуры


Процедура кнХС_СоздатьНажатие(Элемент)
	Ответ = Вопрос("Создать Хозсубъект "+ВыбХС+" в системе Меркурий ?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ХС_Создать(ВыбХС);
	КонецЕсли;
КонецПроцедуры


Процедура кнОтвет_ВСД_транзакцияНажатие(Элемент)
	appID = ВСД_транзакция.applicationID;
	ПолучитьРезультат_ВСД(appID, ВСД_транзакция, Ложь ); 
КонецПроцедуры


Процедура УстановитьПометки()
	//ЖД ТермУсловияПеревозки
	спМеню = Новый СписокЗначений;
    спМеню.Добавить("ВыделитьВсе", "Все");
	спМеню.Добавить("ВыделитьСоздать", "К Созданию ВСД");
	спМеню.Добавить("ВыделитьНеОтправленные", "НЕ ОТПРАВЛЕННЫЕ");
	спМеню.Добавить("ВыделитьКрасные", "Красные");	
	//спМеню.Добавить(4,"Вентилируемый");

    ВыбранныйЭлемент = ВыбратьИзСписка(спМеню, ЭлементыФОрмы.КнВыбратьВсе);	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	ВыбЗн = ВыбранныйЭлемент.Значение;	
	Для Каждого стр Из Отгрузки Цикл
		стр.Отметка = Ложь;
	    Если ВыбЗн = "ВыделитьСоздать" Тогда
			Если ЗначениеЗаполнено(стр.ВСД) или НЕ(ЗначениеЗаполнено(стр.Площадка)) Тогда
				Продолжить;
			КонецЕсли;	
		ИначеЕсли ВыбЗн = "ВыделитьНеОтправленные" Тогда
			Если ЗначениеЗаполнено(стр.ВСД) и НЕ(СокрЛП(стр.ВСД.Статус) = "COMPLETED") Тогда
				стр.Отметка = Истина;
				Продолжить;
			Иначе
				Продолжить;
			КонецЕсли;
		ИначеЕсли (ВыбЗн = "ВыделитьКрасные") и (ЗначениеЗаполнено(стр.ХозСубъект.GUID)) Тогда
			Продолжить;
		КонецЕсли;
		стр.Отметка = Истина;
	КонецЦикла;
КонецПроцедуры

Процедура СнятьПометки()
	Для Каждого стр Из Отгрузки Цикл
		Если (стр.Отметка) Тогда 
			стр.Отметка = Ложь;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры



Процедура кнПолучитьСписокПродукцииНажатие(Элемент)
	Получить_Список_Продукции( Отправитель_Площадка )
КонецПроцедуры


Процедура кнСоздатьПродукциюНажатие(Элемент)
	Ответ = Вопрос("Создать продукцию "+ВыбПродукция+" на площадке "+Отправитель_Площадка+"?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
    	Изменить_Продукцию(ВыбПродукция,"CREATE");
	КонецЕсли;
КонецПроцедуры

Процедура кнИзменитьПродукциюНажатие(Элемент)
	Ответ = Вопрос("Изменить продукцию "+ВыбПродукция+" на площадке "+Отправитель_Площадка+"?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
    	Изменить_Продукцию(ВыбПродукция,"UPDATE");
	КонецЕсли;
КонецПроцедуры

Процедура кнУдалитьПродукциюНажатие(Элемент)
	Ответ = Вопрос("Удалить продукцию "+ВыбПродукция+" на площадке "+Отправитель_Площадка+"?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
		Ответ = Вопрос("Удаление может привести к невозможности работы с партиями из данной продукции. Удаляем ?",РежимДиалогаВопрос.ДаНет,0);
		Если Ответ = КодВозвратаДиалога.Да Тогда
    		Изменить_Продукцию(ВыбПродукция,"DELETE");
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры


Процедура кнПолучитьИнфоПродукцияНажатие(Элемент)
	Получить_Инфо_Продукции( ВыбПродукция );
КонецПроцедуры

Процедура кнСоответствияНажатие(Элемент)
	Форма = ПолучитьФорму("Форма_Соответствия");
	ОткрытьФорму(Форма);
КонецПроцедуры

//*******Аннулирование
Процедура кнАннулироватьВСДНажатие(Элемент)
	Отправить_ВСД2_Аннулирование(ВСД_Аннулируемый);
КонецПроцедуры

Процедура кнАннулироватьТранзакциюНажатие(Элемент)
	Аннулировать_ВСД2_транзакция( Транзакция_Аннулируемый )
КонецПроцедуры

Процедура кнАннулироватьТранзакцию2Нажатие(Элемент)
	Аннулировать_ВСД2_транзакция( Транзакция_Аннулируемый2 )
КонецПроцедуры

Процедура кнАннулироватьВСД2Нажатие(Элемент)
	Отправить_ВСД2_Аннулирование(ВСД_Аннулируемый2);
КонецПроцедуры


Процедура кнАннулироватьВыбранныеВСДНажатие(Элемент)
	Ответ = Вопрос("Аннулировать выбранные транзакции ?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
    	Отправить_ВСД2_АннулированиеВыбранные();
	КонецЕсли;
КонецПроцедуры

Процедура кнПечатьНажатие(Элемент)
	СЗ = Новый СписокЗначений;
    СЗ.Добавить(1,"ВСД");
    СЗ.Добавить(2,"Реестр");
	//Стремная менюшка чет
    ВыбранныйЭлемент = ВыбратьИзСписка(СЗ, ЭлементыФОрмы.кнПечать);	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	ВыбЗн = ВыбранныйЭлемент.Значение;
	Если ВыбЗн = 1 Тогда
		ПечатьСокрВСД(ФлНаПринтер);	
	ИначеЕсли ВыбЗн = 2 Тогда
		ПечатьРеестра(ФлНаПринтер);	
	КонецЕсли;
КонецПроцедуры


Процедура кнГрузополучательНажатие(Элемент)
    ВыбранныйЭлемент = ВыбратьИзСписка(СзПарамГрузополучатель, ЭлементыФОрмы.НадпГрузополучатель);	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	РеквизитГрузополучатель = ВыбранныйЭлемент.Значение;	
	ЭлементыФОрмы.НадпГрузополучатель.Заголовок = ВыбранныйЭлемент.Представление;
КонецПроцедуры

//ЖД ************ Фильтры документов по ХС - чтобы не отправляли с другой фирмы

Процедура ВСД_транзакцияНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД_транзакция.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура ВСД_производствоНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД2_Производство.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Производитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура ВСД_ИсходящийНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура Транзакция_АннулируемыйНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД_транзакция.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();	
КонецПроцедуры

Процедура Транзакция_Аннулируемый2НачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД2_транзакция.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура ВСД_АннулируемыйНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура ВСД_Аннулируемый2НачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД2.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

//ЖД ************ Фильтры Площадок по ХС - выбор на форме
Процедура Отправитель_ПлощадкаНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
   	ФормаВыбора =  Справочники.ВСД_Площадка.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.GuidХозСубъекта.Установить(Отправитель_ХозСубъект.GUID, Истина);
    ФормаВыбора.Открыть();	
КонецПроцедуры

Процедура Отправитель_ПлощадкаПриИзменении(Элемент)
	СписокКонстант.Вставить("Отправитель_Площадка", Отправитель_Площадка);
КонецПроцедуры


Процедура ВыбПлощадкаНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
   	ФормаВыбора =  Справочники.ВСД_Площадка.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.GuidХозСубъекта.Установить(ЭтаФорма.ВыбХС.GUID, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура Отправить_ВСД2_Производство_ИзСпискаПартий()
	СЗДок = Новый СписокЗначений;
	Для Каждого стр из Партии Цикл				
		Если НЕ(ЗначениеЗаполнено(стр.ВСД_Производство)) Тогда
			Продолжить;
		КонецЕсли;
		Если стр.ВСД_Производство.Проведен Тогда
			Продолжить	
		КонецЕсли;
		СЗДок.Добавить(стр.ВСД_Производство);
	КонецЦикла;
	Если СзДок.Количество() = 0 Тогда
		Сообщить("Нет производственных ВСД для отправки");
		Возврат;
	КонецЕсли;
	ОтправитьВсе_ВСД2_Производство(СзДок,ДатаНачалаОтбора,ДатаОкончанияОтбора);	
КонецПроцедуры

//ЖД Создание Производства по Реализации, Отправка
Процедура кнПроизводствоНажатие(Элемент)
	Если Партии.Количество() = 0 Тогда
		Сообщить("Нет данных в таблице ");
		Возврат;
	КонецЕсли;
	СЗМеню = Новый СписокЗначений;
    СЗМеню.Добавить("Создать_ВСД_Производство","Создать ВСД Производство");
    СЗМеню.Добавить("Отправить_ВСД_Производство","Отправить ВСД Производство");
	
	ВыбранныйЭлемент = ВыбратьИзСписка(СЗМеню, ЭлементыФОрмы.кнПроизводство);	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	ВыбЗн = ВыбранныйЭлемент.Значение;
	Если ВыбЗн = "Создать_ВСД_Производство" Тогда
		Ответ = Вопрос("Создать производственные ВСД на недостающую продукцию ?",РежимДиалогаВопрос.ДаНет,0);
		Если Ответ = КодВозвратаДиалога.Да Тогда
    		Создать_ВСД2_Производство();
		КонецЕсли;		
	ИначеЕсли ВыбЗн = "Отправить_ВСД_Производство" Тогда
		Отправить_ВСД2_Производство_ИзСпискаПартий();
		//Обновим партии на форме, проверим, все ли хорошо оправилось
		ОтправкаОК = true;
		Для Каждого стр из Партии Цикл				
			Если НЕ(ЗначениеЗаполнено(стр.ВСД_Производство)) Тогда
				Продолжить;
			КонецЕсли;
			Если (СокрЛП(стр.ВСД_Производство.Статус) = "COMPLETED") Тогда
				стр.Количество = стр.КоличествоСписания; //ЖД чтобы окрасилось правильно
				Продолжить	
			КонецЕсли;
			ОтправкаОК = false;
		КонецЦикла;
		Если ОтправкаОК Тогда
			Сообщить("Обновляю таблицу Партий для создания ВСД");
			ЗаполнитьТаблицуПартий();
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

Процедура КнопкаВыбораПериода2Нажатие(Элемент)
	Если НП.Редактировать() Тогда
		НачДатаПроизводство = НП.ПолучитьДатуНачала();
		КонДатаПроизводство = НП.ПолучитьДатуОкончания();
	КонецЕсли;
КонецПроцедуры

Процедура кнОтправить_ВСД_ПроизводствоВСЕНажатие(Элемент)
	ТекстВопроса = "Отправить все ВСД_Производство по ХС "+Отправитель_ХозСубъект+"
	|за "+ПредставлениеПериода(НачДатаПроизводство,КонецДня(КонДатаПроизводство),"ФП=ИСТИНА")+" ?";
	Ответ = Вопрос(ТекстВопроса,РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
    	ОтправитьВсе_ВСД2_Производство(,НачДатаПроизводство,КонДатаПроизводство);
	КонецЕсли;
КонецПроцедуры

Процедура кнПлощадкаПоХССоздатьНажатие(Элемент)
	Если НЕ(ЗначениеЗаполнено(ВыбХС)) Тогда
		Предупреждение("Выберите Хоз субъект");
		Возврат;
	КонецЕсли;
	Если НЕ(ЗначениеЗаполнено(ВыбХС.GUID)) Тогда
		Предупреждение("Хоз субъект не определен в ГИС Меркурий - Выполните поиск или Создайте");
		Возврат;
	КонецЕсли;
	
	СпрПл = Справочники.ВСД_Площадка.СоздатьЭлемент();
	//СпрПл.Код = ;
	СпрПл.Наименование = ВыбХС.Контрагент.Наименование;
	СпрПл.Контрагент = ВыбХС.Контрагент.Ссылка;
	//СпрПл.GUID = ;
	//СпрПл.UUID = ;
	//СпрПл.Адрес = ГМ.ПолучитьФактАдрес(ВыбХС.Контрагент);
	СпрПл.GuidХозСубъекта = ВыбХС.GUID;
	СпрПл.Записать();
	Сообщить("Создан ВСД_Площадка "+СпрПл);
	
	ВыбПлощадка = СпрПл.Ссылка;
КонецПроцедуры

Процедура ПолеВводаХСПриИзменении(Элемент)
	ВыбПлощадка = "";
КонецПроцедуры

Процедура кнТермУсловияПеревозкиНажатие(Элемент)
    ВыбранныйЭлемент = ВыбратьИзСписка(СзПарамТермУсловияПеревозки, ЭлементыФОрмы.НадпТермУсловияПеревозки);	
	Если ВыбранныйЭлемент = Неопределено Тогда
		Возврат;
	КонецЕсли;
	ТермУсловияПеревозки = ВыбранныйЭлемент.Значение;	
	ЭлементыФОрмы.НадпТермУсловияПеревозки.Заголовок = ВыбранныйЭлемент.Представление;
КонецПроцедуры

Процедура кнЗагрузитьУпаковкуНажатие(Элемент)
	ЗаполнитьФормыУпаковки();
КонецПроцедуры

Процедура кнЗагрузитьЦелиНажатие(Элемент)
	ИнициализацияХС_ЗагрузитьЦели();
КонецПроцедуры

Процедура ТабличноеПоле1ПлощадкаОчистка(Элемент, СтандартнаяОбработка)
	Попытка
		Если НЕ(Элемент.Значение = Справочники.ВСД_Площадка.ПустаяСсылка()) Тогда 
			СпрОб = Элемент.Значение.ПОлучитьОбъект();
			СпрОб.Контрагент = "";
			СпрОб.Записать();
		КонецЕсли;		
	Исключение
	КонецПопытки;
КонецПроцедуры

Процедура ПартииПередНачаломДобавления(Элемент, Отказ, Копирование)
	Отказ = Истина;
КонецПроцедуры

Процедура кнПолучитьОтветВСД2Нажатие(Элемент)
	Сообщить("Выполняется запрос ответов от ВЕТИС на отправленные документы без ответа");
	тзОтгрузки = Отгрузки.Выгрузить();
	Для каждого строкаТЗ из тзОтгрузки Цикл
		ВыбВСД = строкаТЗ.ВСД;
		Если НЕ ЗначениеЗаполнено(ВыбВСД) Тогда
			Продолжить;	
		КонецЕсли;
		Если (НЕ ЗначениеЗаполнено(ВыбВСД.ApplicationID)) или (СокрЛП(ВыбВСД.Статус) = "COMPLETED") Тогда
			Продолжить;	
		КонецЕсли;
		Сообщить("Выполняется проверка ответа Ветис на "+ВыбВСД);
		Попытка
			ПолучитьРезультат_ВСД2(СокрЛП(ВыбВСД.ApplicationID), ВыбВСД);
		Исключение
		    Сообщить(ОписаниеОшибки());
		КонецПопытки;
	КонецЦикла;
	Сообщить("-> Завершено ");
	
КонецПроцедуры

Процедура кнОтправить_ВСД2_транзакцияНажатие(Элемент)
	Отправить_ВСД2_транзакция( ВСД2_транзакция );
КонецПроцедуры

Процедура кнОтвет_ВСД2_транзакцияНажатие(Элемент)
	appID = ВСД2_транзакция.applicationID;
	ПолучитьРезультат_ВСД2(appID, ВСД2_транзакция, Ложь ); 
КонецПроцедуры

Процедура ВСД2_транзакцияНачалоВыбора(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
 	ФормаВыбора =  Документы.ВСД2_транзакция.ПолучитьФормуВыбора(, Элемент);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.Отбор.Отправитель_ХозСубъект.Установить(Отправитель_ХозСубъект, Истина);
    ФормаВыбора.Открыть();
КонецПроцедуры

Процедура кнЗапросРегионализацияНажатие(Элемент)
	Сообщить("Выполняется запрос условий перевозки для выделенных документов ВСД");
	тзОтгрузки = Отгрузки.Выгрузить();
	Для каждого строкаТЗ из тзОтгрузки Цикл
		ВыбВСД = строкаТЗ.ВСД;
		Если НЕ (ЗначениеЗаполнено(ВыбВСД)) или НЕ(строкаТЗ.Отметка) Тогда
			Продолжить;	
		КонецЕсли;
		Если (СокрЛП(ВыбВСД.Статус) = "COMPLETED") или (СокрЛП(ВыбВСД.Статус) = "IN_PROCESS") Тогда
			Продолжить;	
		КонецЕсли;
		Сообщить("Выполняется проверка условий перевозки для "+ВыбВСД);
		Попытка
			ПроверитьВозможностьПеремещения(ВыбВСД);
		Исключение
		    Сообщить(ОписаниеОшибки());
		КонецПопытки;
	КонецЦикла;
	Сообщить("-> Завершено ");
КонецПроцедуры

Процедура кнПолучитьОтветВСДПроизводствоНажатие(Элемент)
	Сообщить("Выполняется запрос ответов от ВЕТИС на отправленные документы из списка партий без ответа");
	тзПартии = Партии.Выгрузить();
	Для каждого строкаТЗ из тзПартии Цикл
		ВыбВСД = строкаТЗ.ВСД_Производство;
		Если НЕ ЗначениеЗаполнено(ВыбВСД) Тогда
			Продолжить;	
		КонецЕсли;
		Если (НЕ ЗначениеЗаполнено(ВыбВСД.ApplicationID)) или (СокрЛП(ВыбВСД.Статус) = "COMPLETED") Тогда
			Продолжить;	
		КонецЕсли;
		Сообщить("Выполняется проверка ответа Ветис на "+ВыбВСД);
		Попытка
			ПолучитьРезультат_ВСД2(СокрЛП(ВыбВСД.ApplicationID), ВыбВСД);
		Исключение
		    Сообщить(ОписаниеОшибки());
		КонецПопытки;
	КонецЦикла;
	Сообщить("-> Завершено ");
КонецПроцедуры

Процедура кнОтвет_ВСД2_ПроизводствоНажатие(Элемент)
	appID = ВСД_производство.applicationID;
	ПолучитьРезультат_ВСД2(appID, ВСД_производство, Ложь ); 
КонецПроцедуры

Процедура КнопкаВыбораПериодаПартииНажатие(Элемент)
	Если НП.Редактировать() Тогда
		ПартииНач = НП.ПолучитьДатуНачала();
		ПартииКон = НП.ПолучитьДатуОкончания();
	КонецЕсли;
КонецПроцедуры

Процедура ТабличноеПоле1ПередНачаломДобавления(Элемент, Отказ, Копирование)
	Отказ = true;
КонецПроцедуры

Процедура ТабличноеПоле1ВСДОчистка(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Попытка
		Если НЕ(Элемент.Значение = Документы.ВСД2_транзакция.ПустаяСсылка()) Тогда 
			ДокОбъект = Элемент.Значение.ПОлучитьОбъект();
			Если СокрЛП(ДокОбъект.Статус) = "COMPLETED" Тогда
				Сообщить(""+Элемент.Значение+" зарегистрирован в Меркурий - удаление невозможно");
				Возврат;
			КонецЕсли;
			Ответ = Вопрос("Удалить "+Элемент.Значение+" ?",РежимДиалогаВопрос.ДаНет,0);
			Если Ответ = КодВозвратаДиалога.Да Тогда
				СтандартнаяОбработка = Истина;
				ДокОбъект.УстановитьПометкуУдаления(ИСТИНА);
			КонецЕсли;
		КонецЕсли;		
	Исключение
	КонецПопытки;
КонецПроцедуры

Процедура ПартииВСД_ПроизводствоОчистка(Элемент, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	Попытка
		Если НЕ(Элемент.Значение = Документы.ВСД2_производство.ПустаяСсылка()) Тогда 
			ДокОбъект = Элемент.Значение.ПОлучитьОбъект();
			Если СокрЛП(ДокОбъект.Статус) = "COMPLETED" Тогда
				Сообщить(""+Элемент.Значение+" зарегистрирован в Меркурий - удаление невозможно");
				Возврат;
			КонецЕсли;
			Ответ = Вопрос("Удалить "+Элемент.Значение+" ?",РежимДиалогаВопрос.ДаНет,0);
			Если Ответ = КодВозвратаДиалога.Да Тогда
				СтандартнаяОбработка = Истина;
				ДокОбъект.УстановитьПометкуУдаления(ИСТИНА);
			КонецЕсли;
		КонецЕсли;		
	Исключение
	КонецПопытки;
КонецПроцедуры

















