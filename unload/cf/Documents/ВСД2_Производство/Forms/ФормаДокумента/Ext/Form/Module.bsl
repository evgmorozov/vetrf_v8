﻿&НаКлиенте
Перем АвтоЗаписьВСДСоответствия;

#Область НемодальныеОкна
&НаКлиенте
Процедура ПредупреждениеПользователю(ТекстПредупреждения) Экспорт
    Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияПредупреждения", ЭтаФорма);	// ЭтотОбъект
    ПоказатьПредупреждение( Оповещение,   ТекстПредупреждения,   0,   "Предупреждение" );
КонецПроцедуры
 
&НаКлиенте
Процедура ПослеЗакрытияПредупреждения(Параметры) Экспорт	
КонецПроцедуры

#КонецОбласти

Процедура ОбновитьДанныеКолонокСрокиГодности()
	Запрос = Новый Запрос(
	"ВЫБРАТЬ РАЗРЕШЕННЫЕ
	|	ВСД_Партия.Ссылка КАК Партия,
	|	ВСД_Партия.ДатаСрокГодности1 КАК ДатаСрокГодности,
	|	ВСД_Партия.ДатаСрокГодности2 КАК ДатаСрокГодности2,
	|	ВСД_Партия.ДатаИзготовления1 КАК ДатаИзготовления,
	|	ВСД_Партия.ДатаИзготовления2 КАК ДатаИзготовления2
	|ИЗ
	|	Справочник.ВСД_Партия КАК ВСД_Партия
	|ГДЕ
	|	ВСД_Партия.Ссылка В(&СписокПартий)"
	);
	Запрос.УстановитьПараметр("СписокПартий",Объект.ПартииСписания.Выгрузить().ВыгрузитьКолонку("Партия"));
	Выборка = Запрос.Выполнить().Выгрузить();// .Выбрать();
	Для Каждого Стр Из Объект.ПартииСписания Цикл
		СтрТЗ = Выборка.Найти(Стр.Партия,"Партия");
		Если стрТЗ <> Неопределено Тогда           //НайтиСледующий(Стр.Партия,"Партия")
			Стр.ДатаСрокГодности = стрТЗ.ДатаСрокГодности;
			Стр.ДатаСрокГодности2 = стрТЗ.ДатаСрокГодности2;
			Стр.ДатаИзготовления = стрТЗ.ДатаИзготовления;
			Стр.ДатаИзготовления2 = стрТЗ.ДатаИзготовления2;			
		Иначе
			Стр.ДатаСрокГодности = "";
			Стр.ДатаСрокГодности2 = "";
			Стр.ДатаИзготовления = "";
			Стр.ДатаИзготовления2 = "";			
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Ключ.Пустая() Тогда //ЭтоНовый   https://helpf.pro/faq83/view/1829.html
		
	КонецЕсли;
	Если Объект.Номер = "" Тогда  // тоже новый
		
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	ОбновитьДанныеКолонокСрокиГодности();
КонецПроцедуры

&НаСервере
Процедура ПослеЗаписиНаСервере(ТекущийОбъект, ПараметрыЗаписи)
	ОбновитьДанныеКолонокСрокиГодности();
КонецПроцедуры

&НаКлиенте
Процедура ОрганизацияПриИзменении(Элемент)
	СписокПараметров = ВСД.ЗагрузитьПараметры( Объект.Организация );
	Объект.Производитель_ХозСубъект = СписокПараметров.Получить("Отправитель_ХозСубъект");
	Объект.Производитель_Площадка = СписокПараметров.Получить("Отправитель_Площадка");
	Объект.РезультатыИсследований = СписокПараметров.Получить("ВСД_РезультатыИсследований");
    Объект.cargoInspected = true;
	АвтоЗаписьВСДСоответствия = СписокПараметров.Получить("АвтоЗаписьВСДСоответствия");	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если Параметры.Ключ.Пустая() Тогда
		Если (Не ЗначениеЗаполнено(Объект.Организация)) и ЗначениеЗаполнено(Объект.ДокументОснование) тогда
			// заполняется ОбработкаЗаполнения - 	
			ДокВСД = ВСД.НайтиВСД_Производство(Объект.ДокументОснование);
			ОткрытьФорму("Документ.ВСД2_Производство.ФормаОбъекта",Новый Структура("Ключ", ДокВСД));
			Отказ = истина;
			Возврат;
		КонецЕсли;
		Объект.Статус = "";
		Объект.applicationID = "";
		Объект.Комментарий = "";
		Объект.Запросы.Очистить();
		Если Не ЗначениеЗаполнено(Объект.Организация) тогда
       		Объект.Организация   =  ВСД.ПолучитьОрганизациюПоУмолчанию();
			ОрганизацияПриИзменении("");
		Иначе
			СписокПараметров = ВСД.ЗагрузитьПараметры( Объект.Организация );
			АвтоЗаписьВСДСоответствия = СписокПараметров.Получить("АвтоЗаписьВСДСоответствия");
		КонецЕсли;
	Иначе
		СписокПараметров = ВСД.ЗагрузитьПараметры( Объект.Организация );
		АвтоЗаписьВСДСоответствия = СписокПараметров.Получить("АвтоЗаписьВСДСоответствия");
	КонецЕсли;
		ОбновитьДанныеКолонокСрокиГодности();
	Если СокрЛП(Объект.Статус) = "COMPLETED" Тогда
		ЭтаФорма.ТолькоПросмотр = Истина;	
	КонецЕсли;
КонецПроцедуры
//********************
&НаКлиенте
Процедура ВыбратьПлощадкиПоХС(Элемент, ГУИДХСдляОтбора)
	ГУИДХСдляОтбора = ?(ЗначениеЗаполнено(ГУИДХСдляОтбора),ГУИДХСдляОтбора,"****");
	ЗначениеОтбора = Новый Структура("GuidХозСубъекта", ГУИДХСдляОтбора);
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,ЗначениеОтбора);	
	ОткрытьФорму("Справочник.ВСД_Площадка.ФормаВыбора", ПараметрыПодбора, Элемент);	
КонецПроцедуры

// *******************Шапка
&НаКлиенте
Процедура Производитель_ХозСубъектПриИзменении(Элемент)
	Объект.Производитель_Площадка = "";
КонецПроцедуры

&НаКлиенте
Процедура Производитель_ПлощадкаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	// Отбор по ХС включим
	ГУИДХСдляОтбора = ВСД.ПолучитьЗначениеРевизитаОбъекта_НаСервере(Объект.Производитель_ХозСубъект,"GUID");
	ВыбратьПлощадкиПоХС(Элемент,ГУИДХСдляОтбора);
КонецПроцедуры


//** ТЧ Продукция
&НаСервере
Функция ПолучитьРеквизитыЭлемента(ВыбЭлемент)
	Рез = Новый Структура;
	Рез.Вставить("Продукция",ВыбЭлемент.Продукция);
	Рез.Вставить("ВидПродукции",ВыбЭлемент.ВидПродукции);
	Рез.Вставить("Наименование",ВыбЭлемент.Наименование);
	Рез.Вставить("ЕдиницаИзмерения",ВыбЭлемент.ЕдиницаИзмерения);
	Рез.Вставить("СрокГодности",ВыбЭлемент.СрокГодности);
	Возврат Рез;
КонецФункции

&НаКлиенте
Процедура ЗаполнитьРеквизитыСтрокиПродукция(СтрокаТЧ,ЧтоИзменили)
	ПродЭлемент = ПолучитьРеквизитыЭлемента(СтрокаТЧ.Продукция_Элемент);	
	СтрокаТЧ.Продукция = ПродЭлемент.Продукция ;
	СтрокаТЧ.ВидПродукции =  ПродЭлемент.ВидПродукции;
	СтрокаТЧ.НаименованиеПродукции =  ПродЭлемент.Наименование;
//	СтрокаТЧ.Количество = 0;
	СтрокаТЧ.ЕдиницаИзмерения =ПродЭлемент.ЕдиницаИзмерения;
	Если НЕ ЗначениеЗаполнено(СтрокаТЧ.ДатаИзготовления1) тогда
		СтрокаТЧ.ДатаИзготовления1 = Объект.дата;
	КонецЕсли;
	СтрокаТЧ.ДатаСрокГодности1 = СтрокаТЧ.ДатаИзготовления1+60*60*24*ПродЭлемент.СрокГодности;
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияПриАктивизацииСтроки(Элемент)
	// Фильтруем Уровни Упаковки
	к=0;	
	Если Элемент.ТекущиеДанные = Неопределено Тогда
		ЭтаФорма.Элементы.УровниУпаковки.ОтборСтрок = Новый ФиксированнаяСтруктура("СтрокаПродукции", 0);//.СтрокаПродукции.Установить(0);
	Иначе
		ЭтаФорма.Элементы.УровниУпаковки.ОтборСтрок = Новый ФиксированнаяСтруктура("СтрокаПродукции", Элемент.ТекущиеДанные.НомерСтроки);//.СтрокаПродукции.Установить(Элемент.ТекущиеДанные.НомерСтроки);
		ЭтаФорма.Элементы.Маркировка.ОтборСтрок = Новый ФиксированнаяСтруктура("СтрокаПродукции",Элемент.ТекущиеДанные.НомерСтроки);
	КонецЕсли

КонецПроцедуры

&НаКлиенте
Процедура ПродукцияПередУдалением(Элемент, Отказ)
	к = 0;
	// Удалить связанные уровни упаковки и маркировки
	//ЖД  - ту косяк - все строки ниже удаленной сдвигаются - вот незадача !!!!
	// а у нас связь по № строки тч. Товары  - нужно что то уникальное
	// сдвиг строк в ТЧ Товары стандартный - аналогичный косяк !!!
	
	СтруктураДляПоиска = Новый Структура("СтрокаПродукции", Элемент.ТекущиеДанные.НомерСтроки); 
	//ТабличнаяЧастьДок = ОбъектДок.Товары; 
	//Получаем список строк соответсвтвующих отбору, и перебором удаляем.
	МассивПустыхСтрок = Объект.Маркировка.НайтиСтроки(СтруктураДляПоиска); 
	Для каждого Строка Из МассивПустыхСтрок Цикл 
		Объект.Маркировка.Удалить(Строка); 
	КонецЦикла; 
	МассивПустыхСтрок = Объект.УровниУпаковки.НайтиСтроки(СтруктураДляПоиска); 
	Для каждого Строка Из МассивПустыхСтрок Цикл 
		Объект.УровниУпаковки.Удалить(Строка); 
	КонецЦикла; 
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияНоменклатураПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	СтрокаТабличнойЧасти.Продукция_Элемент = ВСД.Получить_ВСД_Продукция_Элемент( СтрокаТабличнойЧасти.Номенклатура );
	ЗаполнитьРеквизитыСтрокиПродукция(СтрокаТабличнойЧасти,Элемент);	
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияПродукция_ЭлементПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	ЗаполнитьРеквизитыСтрокиПродукция(СтрокаТабличнойЧасти,Элемент);
	Если ЗначениеЗаполнено(СтрокаТабличнойЧасти.Номенклатура) и ЗначениеЗаполнено(СтрокаТабличнойЧасти.Продукция_Элемент) и АвтоЗаписьВСДСоответствия Тогда
		ВСД.Установить_Соответствие_ВСД_Продукция_Элемент(СтрокаТабличнойЧасти.Номенклатура,СтрокаТабличнойЧасти.Продукция_Элемент);	
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияДатаИзготовления1ПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	СтрокаТабличнойЧасти.ДатаСрокГодности1 = СтрокаТабличнойЧасти.ДатаИзготовления1+60*60*24*ВСД.ПолучитьЗначениеРевизитаОбъекта_НаСервере(СтрокаТабличнойЧасти.Продукция_Элемент,"СрокГодности");
КонецПроцедуры


//***** Работа с уровнями упаковки : на событиях и фильтрация.
#Область ТЧ_УровниУпаковки_Маркировка

&НаКлиенте
Процедура УровниУпаковкиПриАктивизацииСтроки(Элемент)
	Если (ЭтаФорма.Элементы.Продукция.ТекущаяСтрока = Неопределено) или
		(ЭтаФорма.Элементы.УровниУпаковки.ТекущаяСтрока = Неопределено) Тогда
		ЭтаФорма.Элементы.Маркировка.ОтборСтрок = Новый ФиксированнаяСтруктура("СтрокаПродукции", 0);
	ИначеЕсли (Элемент.ТекущиеДанные <> Неопределено) тогда  //Непонятный момент Чему равна ТекущаяСтрока
		ЭтаФорма.Элементы.Маркировка.ОтборСтрок = Новый ФиксированнаяСтруктура("СтрокаПродукции",Элемент.ТекущиеДанные.СтрокаПродукции);
		ЭтаФорма.Элементы.Маркировка.ОтборСтрок = Новый ФиксированнаяСтруктура("НомерУровня",Элемент.ТекущиеДанные.НомерУровня);
	КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура УровниУпаковкиПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Если ЭтаФорма.Элементы.Продукция.ТекущаяСтрока = Неопределено Тогда
		Отказ = true;
	КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура УровниУпаковкиПередУдалением(Элемент, Отказ)
	// Удалить маркировки по уровню
	СтруктураДляПоиска = Новый Структура("НомерУровня", Элемент.ТекущиеДанные.НомерУровня); 
	//Получаем список строк соответсвтвующих отбору, и перебором удаляем.
	МассивПустыхСтрок = Объект.Маркировка.НайтиСтроки(СтруктураДляПоиска); 
	Для каждого Строка Из МассивПустыхСтрок Цикл 
		Объект.Маркировка.Удалить(Строка); 
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура УровниУпаковкиПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	Элемент.ТекущиеДанные.СтрокаПродукции = ЭтаФорма.Элементы.Продукция.ТекущиеДанные.НомерСтроки;
КонецПроцедуры

&НаКлиенте
Процедура УровниУпаковкиПередОкончаниемРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования, Отказ)
	Если НЕ(ЗначениеЗаполнено(Элемент.ТекущиеДанные.НомерУровня))	или НЕ(ЗначениеЗаполнено(Элемент.ТекущиеДанные.ФормаУпаковки)) Тогда
		ПредупреждениеПользователю("Заполните все данные !!!");
		Отказ = Истина;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура МаркировкаПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	Если ЭтаФорма.Элементы.УровниУпаковки.ТекущаяСтрока = Неопределено Тогда 
		Отказ = true;
	КонецЕсли
КонецПроцедуры

&НаКлиенте
Процедура МаркировкаПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	Если ЭтаФорма.Элементы.УровниУпаковки.ТекущиеДанные <> Неопределено Тогда 
		Элемент.ТекущиеДанные.СтрокаПродукции = ЭтаФорма.Элементы.УровниУпаковки.ТекущиеДанные.СтрокаПродукции;
		Элемент.ТекущиеДанные.НомерУровня = ЭтаФорма.Элементы.УровниУпаковки.ТекущиеДанные.НомерУровня;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура МаркировкаПередОкончаниемРедактирования(Элемент, НоваяСтрока, ОтменаРедактирования, Отказ)
	Если НЕ(ЗначениеЗаполнено(Элемент.ТекущиеДанные.Класс))	или НЕ(ЗначениеЗаполнено(Элемент.ТекущиеДанные.Маркировка)) Тогда
		ПредупреждениеПользователю("Заполните все данные !!!");
		Отказ = Истина;
	КонецЕсли;

КонецПроцедуры
#КонецОбласти

//********* Партии Списания
&НаКлиенте
Процедура ПартииСписанияНоменклатураПриИзменении(Элемент)
	// поищем ВСД Элемент и Партию
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	СтрокаТабличнойЧасти.Продукция_Элемент = ВСД.Получить_ВСД_Продукция_Элемент( СтрокаТабличнойЧасти.Номенклатура );
	СтрокаТабличнойЧасти.Партия = ВСД.ВыбратьПартию(СтрокаТабличнойЧасти.Продукция_Элемент, Объект.Производитель_Площадка, Объект.Производитель_ХозСубъект);
	СтрокаТабличнойЧасти.ЕдиницаИзмерения = ВСД.ПолучитьЗначениеРевизитаОбъекта_НаСервере(СтрокаТабличнойЧасти.Продукция_Элемент,"ЕдиницаИзмерения");
КонецПроцедуры

&НаКлиенте
Процедура ПартииСписанияПартияНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	СписокПартийДляВыбора = ВСД.СписокАктуальныхПартийПоФильтру_Запрос(Элемент.Родитель.ТекущиеДанные.Продукция_Элемент,Объект.Производитель_Площадка, Объект.Производитель_ХозСубъект);	
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,Новый Структура("Ссылка", СписокПартийДляВыбора));	
	ОткрытьФорму("Справочник.ВСД_Партия.ФормаВыбора", ПараметрыПодбора, Элемент);	
КонецПроцедуры

&НаКлиенте
Процедура ПартииСписанияПартияПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	
	//!!! заполнение на сервере
	ДанныеСтрокиТЧ = новый Структура("Партия, Продукция_Элемент, Продукция, ВидПродукции, ЕдиницаИзмерения, ДатаИзготовления, ДатаИзготовления2, ДатаСрокГодности, ДатаСрокГодности2");
	ЗаполнитьЗначенияСвойств(ДанныеСтрокиТЧ, СтрокаТабличнойЧасти);
	ЗаполнитьРеквизитыСтрокиПродукцияСервер(ДанныеСтрокиТЧ);
	ЗаполнитьЗначенияСвойств(СтрокаТабличнойЧасти, ДанныеСтрокиТЧ);
	//ЗаполнитьРеквизитыСтрокиПродукцияСервер( СтрокаТабличнойЧасти ); // нельзя на сервер
	
	Если ЗначениеЗаполнено(СтрокаТабличнойЧасти.Номенклатура) и ЗначениеЗаполнено(СтрокаТабличнойЧасти.Продукция_Элемент) и АвтоЗаписьВСДСоответствия Тогда
		ВСД.Установить_Соответствие_ВСД_Продукция_Элемент(СтрокаТабличнойЧасти.Номенклатура,СтрокаТабличнойЧасти.Продукция_Элемент);	
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПартииСписанияПродукция_ЭлементПриИзменении(Элемент)
	// Сопоставить Номенклатуру с ПродукцияЭлемент
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	СтрокаТабличнойЧасти.Партия = ВСД.ВыбратьПартию(СтрокаТабличнойЧасти.Продукция_Элемент, Объект.Производитель_Площадка, Объект.Производитель_ХозСубъект);
	
	//!!! заполнение на сервере
	ДанныеСтрокиТЧ = новый Структура("Партия, Продукция_Элемент, Продукция, ВидПродукции, ЕдиницаИзмерения, ДатаИзготовления, ДатаИзготовления2, ДатаСрокГодности, ДатаСрокГодности2");
	ЗаполнитьЗначенияСвойств(ДанныеСтрокиТЧ, СтрокаТабличнойЧасти);
	ЗаполнитьРеквизитыСтрокиПродукцияСервер(ДанныеСтрокиТЧ);
	ЗаполнитьЗначенияСвойств(СтрокаТабличнойЧасти, ДанныеСтрокиТЧ);
	//ЗаполнитьРеквизитыСтрокиПродукцияСервер(СтрокаТабличнойЧасти);
	
	Если ЗначениеЗаполнено(СтрокаТабличнойЧасти.Номенклатура) и ЗначениеЗаполнено(СтрокаТабличнойЧасти.Продукция_Элемент) и АвтоЗаписьВСДСоответствия Тогда
		ВСД.Установить_Соответствие_ВСД_Продукция_Элемент(СтрокаТабличнойЧасти.Номенклатура,СтрокаТабличнойЧасти.Продукция_Элемент);	
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура кнПодбор(Команда)
	СписокПартийДляВыбора = ВСД.СписокАктуальныхПартийПоФильтру_Запрос(,Объект.Производитель_Площадка, Объект.Производитель_ХозСубъект);	
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,МножественныйВыбор,Отбор", Истина, Истина, Истина,Новый Структура("Ссылка", СписокПартийДляВыбора));	
	ОткрытьФорму("Справочник.ВСД_Партия.ФормаВыбора", ПараметрыПодбора,Этаформа.Элементы.ПартииСписания);	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьРеквизитыСтрокиПродукцияСервер(СтрокаТЧ)
	Если ЗначениеЗаполнено(СтрокаТЧ.Партия) тогда
		СтрокаТЧ.Продукция_Элемент = СтрокаТЧ.Партия.Продукция_Элемент;
		СтрокаТЧ.ЕдиницаИзмерения =СтрокаТЧ.Партия.ЕдиницаИзмерения;
		//Если НЕ(типЗНч(СтрокаТЧ) = Тип("Структура")) Тогда
		//	СтрокаТЧ.Количество = СтрокаТЧ.Партия.Количество;
		//КонецЕсли;
		СтрокаТЧ.ДатаИзготовления =СтрокаТЧ.Партия.ДатаИзготовления1;
		СтрокаТЧ.ДатаИзготовления2 =СтрокаТЧ.Партия.ДатаИзготовления2;
		СтрокаТЧ.ДатаСрокГодности =СтрокаТЧ.Партия.ДатаСрокГодности1;
		СтрокаТЧ.ДатаСрокГодности2 =СтрокаТЧ.Партия.ДатаСрокГодности2;		
		СтрокаТЧ.Продукция = СтрокаТЧ.Партия.Продукция;
		СтрокаТЧ.ВидПродукции = СтрокаТЧ.Партия.ВидПродукции;
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПартииСписанияОбработкаВыбораНаСервере(ВыбранноеЗначение)
    Для Каждого вЗнч Из ВыбранноеЗначение Цикл
        Если объект.ПартииСписания.НайтиСтроки(Новый Структура("Партия", вЗнч)).Количество() = 0 Тогда
           нСтр = объект.ПартииСписания.Добавить();
           нСтр.Партия = вЗнч.Ссылка;
		   нСтр.Количество = нСтр.Партия.Количество;
           ЗаполнитьРеквизитыСтрокиПродукцияСервер(нСтр);
        КонецЕсли;
     КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ПартииСписанияОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	СтандартнаяОбработка = ложь;
	ПартииСписанияОбработкаВыбораНаСервере(ВыбранноеЗначение);
КонецПроцедуры

&НаСервере
Процедура кнЗаполнитьПоПродукцияЭлементНаСервере()
	ЭлементыСпецификации = ВСД_Производство.ЗаполнитьСырьеИзВСД_Продукция_Элемент( Объект.Продукция.Выгрузить() );
	Объект.ПартииСписания.Загрузить(ЭлементыСпецификации);
КонецПроцедуры

&НаКлиенте
Процедура кнЗаполнитьПоПродукцияЭлемент(Команда)
	кнЗаполнитьПоПродукцияЭлементНаСервере()
КонецПроцедуры

&НаСервере
Процедура кнЗаполнитьПартииСписанияПоВСД_Продукция_ЭлементНаСервере()
	//Парам = Новый Структура("Организация, Отправитель_ХозСубъект, Отправитель_Площадка",Объект.Организация, Объект.Производитель_ХозСубъект,Объект.Производитель_Площадка);
	ПараметрыФункции = ВСД.ЗагрузитьПараметры( Объект.Организация );
	ПараметрыФункции.Вставить("Организация", Объект.Организация);
	ПараметрыФункции.Вставить("Отправитель_ХозСубъект", Объект.Производитель_ХозСубъект);
	ПараметрыФункции.Вставить("Отправитель_Площадка", Объект.Производитель_Площадка);
	
	Сырье = ВСД_Производство.ЗаполнитьСырьеИзВСД_Продукция_Элемент( Объект.Продукция.Выгрузить() );
	
	ПартииСписания = ВСД_Производство.тзПартииСписанияПоТзПродукция_Элемент( ПараметрыФункции, Сырье );
	
	Объект.ПартииСписания.Загрузить(ПартииСписания);
	Для Каждого СтрокаТабличнойЧасти из Объект.ПартииСписания Цикл
		ЗаполнитьРеквизитыСтрокиПродукцияСервер(СтрокаТабличнойЧасти);
	КонецЦикла;
	
	ОбновитьДанныеКолонокСрокиГодности();
КонецПроцедуры

&НаКлиенте
Процедура кнЗаполнитьПартииСписанияПоВСД_Продукция_Элемент(Команда)
	кнЗаполнитьПартииСписанияПоВСД_Продукция_ЭлементНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура кнОткрытьЗапрос(Команда)
	ПутьКXML = "";
	Если (ЭтаФорма.Элементы.Запросы.ТекущаяСтрока <> Неопределено) Тогда
		ПутьКXML = ЭтаФорма.Элементы.Запросы.ТекущиеДанные.Файл;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ПутьКXML) Тогда
		//КомандаСистемы("""""%ProgramFiles%\Internet Explorer\iexplore.exe"""" "+ПутьКXML);
		ЗапуститьПриложение(ПутьКXML);
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура кнЗаполнитьПоСпецификацииНоменклатурыНаСервере()
	ПараметрыФункции = ВСД.ЗагрузитьПараметры( Объект.Организация );
	ПараметрыФункции.Вставить("Организация", Объект.Организация);
	ПараметрыФункции.Вставить("Отправитель_ХозСубъект", Объект.Производитель_ХозСубъект);
	ПараметрыФункции.Вставить("Отправитель_Площадка", Объект.Производитель_Площадка);
	
	Сырье = ВСД_Производство.ЗаполнитьТчСписаниеИзСпецификацииНоменклатуры( Объект.Продукция.Выгрузить() );
	
	ПартииСписания = ВСД_Производство.тзПартииСписанияПоТзПродукция_Элемент( ПараметрыФункции, Сырье );
	Объект.ПартииСписания.Загрузить(ПартииСписания);
	Для Каждого СтрокаТабличнойЧасти из Объект.ПартииСписания Цикл
		ЗаполнитьРеквизитыСтрокиПродукцияСервер(СтрокаТабличнойЧасти);
	КонецЦикла;
	ОбновитьДанныеКолонокСрокиГодности();
КонецПроцедуры

&НаКлиенте
Процедура кнЗаполнитьПоСпецификацииНоменклатуры(Команда)
	кнЗаполнитьПоСпецификацииНоменклатурыНаСервере();
КонецПроцедуры
