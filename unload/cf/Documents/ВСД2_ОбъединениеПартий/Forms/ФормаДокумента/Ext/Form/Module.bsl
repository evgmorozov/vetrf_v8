﻿#Область НемодальныеОкна
&НаКлиенте
Процедура ПредупреждениеПользователю(ТекстПредупреждения) Экспорт
    Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияПредупреждения", ЭтаФорма);	
    ПоказатьПредупреждение( Оповещение,   ТекстПредупреждения,   0,   "Предупреждение" );
КонецПроцедуры
 
&НаКлиенте
Процедура ПослеЗакрытияПредупреждения(Параметры) Экспорт	
КонецПроцедуры

#КонецОбласти

//После заполнения сюда сразу попадаем
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Если Параметры.Ключ.Пустая() Тогда //ЭтоНовый   https://helpf.pro/faq83/view/1829.html
		
	КонецЕсли;
	Если Объект.Номер = "" Тогда  // тоже новый
		
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОрганизацияПриИзменении(Элемент)
	СписокПараметров = ВСД.ЗагрузитьПараметры( Объект.Организация );
	Объект.Владелец_ХозСубъект = СписокПараметров["Отправитель_ХозСубъект"];
	Объект.Владелец_Площадка = СписокПараметров["Отправитель_Площадка"];
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если Параметры.Ключ.Пустая() Тогда
		Объект.Статус = "";
		Объект.applicationID = "";
		Объект.Запросы.Очистить();
		Если Не ЗначениеЗаполнено(Объект.Организация) Тогда
       		Объект.Организация   =  ВСД_Общий.ПолучитьОрганизациюПоУмолчанию();
			ОрганизацияПриИзменении("");
		КонецЕсли;
	КонецЕсли;
	Если СокрЛП(Объект.Статус) = "COMPLETED" Тогда
		ЭтаФорма.ТолькоПросмотр = Истина;	
	КонецЕсли;
КонецПроцедуры
//********************
//&НаКлиенте
//Процедура ВыбратьПлощадкиПоХС(Элемент, ГУИДХСдляОтбора)
//	ГУИДХСдляОтбора = ?(ЗначениеЗаполнено(ГУИДХСдляОтбора),ГУИДХСдляОтбора,"****");
//	ЗначениеОтбора = Новый Структура("GuidХозСубъекта", ГУИДХСдляОтбора);
//	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,ЗначениеОтбора);	
//	ОткрытьФорму("Справочник.ВСД_Площадка.ФормаВыбора", ПараметрыПодбора, Элемент);	
//КонецПроцедуры

&НаКлиенте
Функция СтруктураОтбораПартий()
	//СтруктураОтбора = ВСД_Общий.СтруктураОтбораПартий( Неопределено , Объект.Отправитель_Площадка, Объект.Отправитель_ХозСубъект);
	//ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора, МножественныйВыбор, Отбор", Истина, Истина, Истина, СтруктураОтбора);	
	
	СтруктураОтбора = Новый Структура;
	СтруктураОтбора.Вставить("Получатель_Площадка", Объект.Владелец_Площадка );
	СтруктураОтбора.Вставить("Получатель_ХозСубъект", Объект.Владелец_ХозСубъект );
	СтруктураОтбора.Вставить("ПометкаУдаления", Ложь );
	Если ЗначениеЗаполнено(Объект.ВидПродукции) Тогда 
		СтруктураОтбора.Вставить("ВидПродукции", Объект.ВидПродукции );
	КонецЕсли;
	Если ЗначениеЗаполнено(Объект.Продукция_Элемент) Тогда 
		СтруктураОтбора.Вставить("Продукция_Элемент", Объект.Продукция_Элемент );	
	КонецЕсли;	
	Возврат СтруктураОтбора;
КонецФункции

//&НаСервере
//Функция ВыборПартийФильтрЛокал( ВыбВидПродукции = "", ВСД_Продукция_Элемент="",ВСД_Площадка="", ВСД_ХозСубъект="")
//     Запрос = Новый Запрос;
//	 ТекстЗапроса =         
//         "ВЫБРАТЬ
//         |    ВСДПартия.Ссылка
//         |ИЗ
//         |    Справочник.ВСД_Партия КАК ВСДПартия
//         |ГДЕ
//         |    ВСДПартия.ПометкаУдаления = ЛОЖЬ
//		 |    И ВСДПартия.Количество > 0";
//	 Если ЗначениеЗаполнено(ВСД_Продукция_Элемент) Тогда
//		 ТекстЗапроса = ТекстЗапроса + "		 
//         |    И ВСДПартия.Продукция_Элемент = &ВыбПродукция_Элемент";
//	 КонецЕсли;
//	 Если ЗначениеЗаполнено(ВСД_Площадка) Тогда
//		 ТекстЗапроса = ТекстЗапроса + "		 
//         |    И ВСДПартия.Получатель_Площадка = &ВыбПлощадка";
//	 КонецЕсли;
//	 Если ЗначениеЗаполнено(ВСД_ХозСубъект) Тогда
//		 ТекстЗапроса = ТекстЗапроса + "		 
//         |    И ВСДПартия.Получатель_ХозСубъект.GUID = &ВыбХС";
//	 КонецЕсли;
//	Если ЗначениеЗаполнено(ВыбВидПродукции) Тогда
//			ТекстЗапроса = ТекстЗапроса + " 	
//			|	И ВСДПартия.Продукция_Элемент.ВидПродукции = &ВыбВидПродукции";			
//	КонецЕсли;
//	 
//	 
// 	Запрос.Текст = ТекстЗапроса;
//    Запрос.УстановитьПараметр("ВыбПлощадка", ВСД_Площадка);
//    Запрос.УстановитьПараметр("ВыбПродукция_Элемент",ВСД_Продукция_Элемент);
//	Запрос.УстановитьПараметр("ВыбВидПродукции" , ВыбВидПродукции);
//	Запрос.УстановитьПараметр("ВыбХС", ВСД_ХозСубъект.GUID);
//    СписокЭлементов = Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("Ссылка");
//    СЗЭлементов = Новый СписокЗначений;
//    СЗЭлементов.ЗагрузитьЗначения(СписокЭлементов);
//	Возврат СЗЭлементов;
//КонецФункции

// *******************Шапка
&НаКлиенте
Процедура Владелец_ХозСубъектПриИзменении(Элемент)
	Объект.Владелец_Площадка = "";
КонецПроцедуры

&НаКлиенте
Процедура Владелец_ПлощадкаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	//// Отбор по ХС включим
	//ГУИДХСдляОтбора = ВСД.ПолучитьЗначениеРевизитаОбъекта_НаСервере(Объект.Владелец_ХозСубъект,"GUID");
	//ВыбратьПлощадкиПоХС(Элемент,ГУИДХСдляОтбора);
	
	ЗначениеОтбора = Новый Структура("ХозСубъект", Объект.Владелец_ХозСубъект);
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,ЗначениеОтбора);	
	ОткрытьФорму("Справочник.ВСД_Площадка.ФормаВыбора", ПараметрыПодбора, Элемент);	
	
КонецПроцедуры

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

//******* ТЧ
&НаСервере
Функция ПолучитьРеквизитыПартии(ВыбЭлемент)
	Рез = Новый Структура;
	Рез.Вставить("Продукция",ВыбЭлемент.Продукция);
	Рез.Вставить("ВидПродукции",ВыбЭлемент.ВидПродукции);
	Рез.Вставить("Продукция_Элемент",ВыбЭлемент.Продукция_Элемент);
	Рез.Вставить("Наименование",ВыбЭлемент.Наименование);
	Рез.Вставить("ЕдиницаИзмерения",ВыбЭлемент.ЕдиницаИзмерения);
	Рез.Вставить("Количество",ВыбЭлемент.Количество);
	Рез.Вставить("ДатаСрокГодности1",ВыбЭлемент.ДатаСрокГодности1);
	Рез.Вставить("ДатаИзготовления1",ВыбЭлемент.ДатаИзготовления1);
	Рез.Вставить("ДатаСрокГодности2",ВыбЭлемент.ДатаСрокГодности2);
	Рез.Вставить("ДатаИзготовления2",ВыбЭлемент.ДатаИзготовления2);
	Возврат Рез;
КонецФункции

&НаКлиенте
Процедура ЗаполнитьРеквизитыШапки( ДанныеПартии )
	Если НЕ ЗначениеЗаполнено(Объект.Продукция_Элемент) Тогда
		Объект.Продукция_Элемент = ДанныеПартии.Продукция_Элемент;
	КонецЕсли;
	Если НЕ ЗначениеЗаполнено(Объект.ВыбПродукция) Тогда
		Объект.ВыбПродукция = ДанныеПартии.Продукция;
	КонецЕсли;
	Если НЕ ЗначениеЗаполнено(Объект.ВидПродукции) Тогда
		Объект.ВидПродукции = ДанныеПартии.ВидПродукции;
	КонецЕсли;
	Если НЕ ЗначениеЗаполнено(Объект.НаименованиеПродукции) Тогда
		Объект.НаименованиеПродукции = ДанныеПартии.Наименование;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьРеквизитыСтрокиПродукция(СтрокаТЧ,ЧтоИзменили)
	Если ЗначениеЗаполнено(СтрокаТЧ.Партия) Тогда
		ДанныеПартии = ПолучитьРеквизитыПартии(СтрокаТЧ.Партия);
		СтрокаТЧ.Количество = ДанныеПартии.Количество;	
		СтрокаТЧ.ЕдиницаИзмерения =ДанныеПартии.ЕдиницаИзмерения;
		СтрокаТЧ.ДатаИзготовления1 =ДанныеПартии.ДатаИзготовления1;
		СтрокаТЧ.ДатаИзготовления2 =ДанныеПартии.ДатаИзготовления2;
		СтрокаТЧ.ДатаСрокГодности1 =ДанныеПартии.ДатаСрокГодности1;
		СтрокаТЧ.ДатаСрокГодности2 =ДанныеПартии.ДатаСрокГодности2;		
		
		ЗаполнитьРеквизитыШапки( ДанныеПартии );
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияНоменклатураПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
//	СтрокаТабличнойЧасти.Партия = ВСД.ВыбратьПартию(СтрокаТабличнойЧасти.Продукция_Элемент, Объект.Владелец_Площадка, Объект.Владелец_ХозСубъект);
//	ЗаполнитьРеквизитыСтрокиПродукция(СтрокаТабличнойЧасти,Элемент);	
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияПартияНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
//	Если НЕ ЗначениеЗаполнено(Объект.ВидПродукции) Тогда
//		Предупреждение("Не указан Вид Продукции !!!");
////		ЭтаФорма.ТекущийЭлемент = ЭлементыФормы["ВидПродукции"];
//		Возврат;
//	КонецЕсли;
	//ВремПродЭлемент = Объект.Продукция_Элемент;
	//Если ФлПодбиратьБезУчетаПродукцияЭлемент Тогда
	//	ВремПродЭлемент = "";	
	//КонецЕсли;
	//СписокПартийДляВыбора = ВыборПартийФильтрЛокал( Объект.ВидПродукции, ВремПродЭлемент,Объект.Владелец_Площадка, Объект.Владелец_ХозСубъект);
	////СписокПартийДляВыбора = ВСД.СписокАктуальныхПартийПоФильтру_Запрос(Объект.Продукция_Элемент,Объект.Владелец_Площадка, Объект.Владелец_ХозСубъект);	
	//ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,Новый Структура("Ссылка", СписокПартийДляВыбора));	
	
	СтруктураОтбора = СтруктураОтбораПартий();	
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,МножественныйВыбор,Отбор", Истина, Истина, Истина, СтруктураОтбора);	
	
	ОткрытьФорму("Справочник.ВСД_Партия.ФормаВыбора", ПараметрыПодбора, Элемент);
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияПартияПриИзменении(Элемент)
	СтрокаТабличнойЧасти = Элемент.Родитель.ТекущиеДанные;
	ЗаполнитьРеквизитыСтрокиПродукция(СтрокаТабличнойЧасти,Элемент);
КонецПроцедуры

//************* Шапка Продукция
&НаКлиенте
Процедура ВыбПродукцияПриИзменении(Элемент)
	 Объект.ВидПродукции = "";
	 Объект.Продукция_Элемент = "";
	 Объект.НаименованиеПродукции = "";
	 Объект.Продукция.Очистить();
КонецПроцедуры

&НаКлиенте
Процедура ВидПродукцииПриИзменении(Элемент)
	 Объект.Продукция_Элемент = "";
	 Объект.НаименованиеПродукции = "";
	 Объект.Продукция.Очистить();
КонецПроцедуры

&НаСервере
Процедура Продукция_ЭлементПриИзмененииСервер()
	Объект.ВидПродукции = Объект.Продукция_Элемент.ВидПродукции;
	Объект.ВыбПродукция = Объект.Продукция_Элемент.Продукция;
	Объект.НаименованиеПродукции = Объект.Продукция_Элемент.Наименование;
КонецПроцедуры

&НаКлиенте
Процедура Продукция_ЭлементПриИзменении(Элемент)
	Продукция_ЭлементПриИзмененииСервер();
КонецПроцедуры

&НаКлиенте
Процедура Продукция_ЭлементНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,Отбор", Истина, Истина,Новый Структура("ВидПродукции", Объект.ВидПродукции));	
	ОткрытьФорму("Справочник.ВСД_Продукция_Элемент.ФормаВыбора", ПараметрыПодбора, Элемент);		
КонецПроцедуры

//Подбор
&НаСервере
Процедура ЗаполнитьРеквизитыСтрокиПродукцияСервер(СтрокаТЧ)
	Если ЗначениеЗаполнено(СтрокаТЧ.Партия) Тогда
//		СтрокаТЧ.Продукция_Элемент = СтрокаТЧ.Партия.Продукция_Элемент;
//		СтрокаТЧ.Продукция = СтрокаТЧ.Партия.Продукция ;
//		СтрокаТЧ.ВидПродукции =  СтрокаТЧ.Партия.ВидПродукции;
//		СтрокаТЧ.НаименованиеПродукции =  СтрокаТЧ.Партия.Наименование;
		СтрокаТЧ.ЕдиницаИзмерения =СтрокаТЧ.Партия.ЕдиницаИзмерения;
		СтрокаТЧ.Количество = СтрокаТЧ.Партия.Количество;
		СтрокаТЧ.ДатаИзготовления1 =СтрокаТЧ.Партия.ДатаИзготовления1;
		СтрокаТЧ.ДатаИзготовления2 =СтрокаТЧ.Партия.ДатаИзготовления2;
		СтрокаТЧ.ДатаСрокГодности1 =СтрокаТЧ.Партия.ДатаСрокГодности1;
		СтрокаТЧ.ДатаСрокГодности2 =СтрокаТЧ.Партия.ДатаСрокГодности2;		
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура кнПодбор(Команда)
//	Если НЕ ЗначениеЗаполнено(Объект.ВидПродукции) Тогда
////		ПредупреждениеПользователю("Не указан Вид Продукции !!!");
////		ЭтаФорма.ТекущийЭлемент = ЭлементыФормы["ВидПродукции"];
//		Возврат;
//	КонецЕсли;
	//ВремПродЭлемент = Объект.Продукция_Элемент;
	//Если ФлПодбиратьБезУчетаПродукцияЭлемент Тогда
	//	ВремПродЭлемент = "";	
	//КонецЕсли;
	//СписокПартийДляВыбора = ВыборПартийФильтрЛокал( Объект.ВидПродукции, ВремПродЭлемент,Объект.Владелец_Площадка, Объект.Владелец_ХозСубъект);
	//ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,МножественныйВыбор,Отбор", Истина, Истина, Истина,Новый Структура("Ссылка", СписокПартийДляВыбора));	
	
	СтруктураОтбора = СтруктураОтбораПартий();	
	ПараметрыПодбора = Новый Структура("ЗакрыватьПриВыборе, РежимВыбора,МножественныйВыбор,Отбор", Истина, Истина, Истина, СтруктураОтбора );	

	ОткрытьФорму("Справочник.ВСД_Партия.ФормаВыбора", ПараметрыПодбора,Этаформа.Элементы.Продукция);	
КонецПроцедуры

&НаСервере
Процедура ПродукцияОбработкаВыбораНаСервере(ВыбранноеЗначение)
    Для Каждого вЗнч Из ВыбранноеЗначение Цикл
        Если объект.продукция.НайтиСтроки(Новый Структура("Партия", вЗнч)).Количество() = 0 Тогда
           нСтр = объект.продукция.Добавить();
           нСтр.Партия = вЗнч.Ссылка;
           ЗаполнитьРеквизитыСтрокиПродукцияСервер(нСтр);
		   
			Если НЕ ЗначениеЗаполнено(Объект.ВыбПродукция) Тогда 
				Объект.ВыбПродукция = вЗнч.Ссылка.Продукция;
			КонецЕсли;
			Если НЕ ЗначениеЗаполнено(Объект.ВидПродукции) Тогда 
				Объект.ВидПродукции = вЗнч.Ссылка.ВидПродукции;
			КонецЕсли;
			Если НЕ ЗначениеЗаполнено(Объект.Продукция_Элемент) Тогда 
				Объект.Продукция_Элемент = вЗнч.Ссылка.Продукция_Элемент;
			КонецЕсли;
			Если НЕ ЗначениеЗаполнено(Объект.НаименованиеПродукции) Тогда 
				Объект.НаименованиеПродукции = вЗнч.Ссылка.Наименование;
			КонецЕсли;
        КонецЕсли;
     КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ПродукцияОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
	ПродукцияОбработкаВыбораНаСервере(ВыбранноеЗначение);
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

