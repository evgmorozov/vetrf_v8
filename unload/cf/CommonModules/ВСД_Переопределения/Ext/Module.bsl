﻿// Модуль используется для переопределения стандартный функций модуля Интеграции
// чтобы при обновлении изменения сохранились - используйте переопределение в этом модуле


// переопределение функций модуля
Функция НайтиФункцию( ИмяФункции ) Экспорт
	
	ПереопределяемыеФункции = новый Структура;
	// ПереопределяемыеФункции.Вставить("ПолучитьНомерАвто", Истина);
	// ПереопределяемыеФункции.Вставить("РассчитатьКоличествоДляВСД", Истина);
	// ПереопределяемыеФункции.Вставить("ПолучитьАртикулНоменклатуры", Истина);
	
	Возврат ПереопределяемыеФункции.Свойство( ИмяФункции );
		
КонецФункции

Функция ПолучитьНомерАвто( ДокОснование ) Экспорт
	Возврат "123АА63"
КонецФункции

Функция РассчитатьКоличествоДляВСД( ПараметрыОрганизации, СтрокаТЧДок, Продукция_Элемент = "" ) Экспорт

	Коэфф = 1;
	
	Если СтрокаТЧДок.Номенклатура.ВесИспользовать Тогда
		Попытка
			Если СтрокаТЧДок.Номенклатура.ВесЗнаменатель>0 Тогда 
				Коэфф=СтрокаТЧДок.Номенклатура.ВесЧислитель/СтрокаТЧДок.Номенклатура.ВесЗнаменатель;
			Иначе
				Коэфф=1;
			КонецЕсли;
		Исключение
			Коэфф = 1;
		КонецПопытки;
	КонецЕсли;
	
	Рез = СтрокаТЧДок[ ПараметрыОрганизации["НазваниеРеквизитаКоличество"] ]*Коэфф;
	
	Возврат Рез;
	
КонецФункции

// заполнение Артикула в ВСД2_Транзакцию -> к каждой сети свой Артикул #2683
Функция ПолучитьСвойствоКонтрагентаАртикул(ВыбКонтрагент)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "	
	|ВЫБРАТЬ
	|	ЗначенияСвойствОбъектов.Значение
	|ИЗ
	|	РегистрСведений.ЗначенияСвойствОбъектов КАК ЗначенияСвойствОбъектов
	|ГДЕ
	|	ЗначенияСвойствОбъектов.Объект = &ВыбКонтрагент
	|	И ЗначенияСвойствОбъектов.Свойство.Наименование = &АртикулСсылка";
	Запрос.УстановитьПараметр("ВыбКонтрагент", ВыбКонтрагент);
	Запрос.УстановитьПараметр("АртикулСсылка", "НазваниеСвойстваАртикулаНоменклатуры"); // АртикулСсылка
	ТзВрем = Запрос.Выполнить().Выбрать();
	Если ТзВрем.Следующий() Тогда
		Возврат ТзВрем.Значение.Наименование;
	Иначе
		Возврат ""; // Справочники.ЗначенияСвойствОбъектов.ПустаяСсылка();	
	КонецЕсли;
	
КонецФункции

Функция ПолучитьАртикулНоменклатуры(ПараметрыОрганизации, НоваяСтрока, СтрокаОснования, ДокСсылка) Экспорт
	
	Ответ = "";
	
	Попытка
		СвойствоКонтрагентаАртикул = ПолучитьСвойствоКонтрагентаАртикул(ДокСсылка.Документоснование.Контрагент);
		
		Запрос = Новый Запрос;
		Запрос.Текст = "	
		|ВЫБРАТЬ
		|	ЗначенияСвойствОбъектов.Значение
		|ИЗ
		|	РегистрСведений.ЗначенияСвойствОбъектов КАК ЗначенияСвойствОбъектов
		|ГДЕ
		|	ЗначенияСвойствОбъектов.Объект = &ВыбНоменклатура
		|	И ЗначенияСвойствОбъектов.Свойство.Наименование = &СвойствоАртикул";
		
		Запрос.УстановитьПараметр("ВыбНоменклатура", НоваяСтрока.Номенклатура);
		Запрос.УстановитьПараметр("СвойствоАртикул", СвойствоКонтрагентаАртикул);
		ТзВрем = Запрос.Выполнить().Выбрать();
		Если ТзВрем.Следующий() Тогда
			Ответ = ТзВрем.Значение;
		Иначе
			Ответ = "";	
		КонецЕсли;
		
	Исключение
		// РеквАртикул = ""; //Нет основания - нет Контрагента
	КонецПопытки;

	Возврат Ответ;
	
КонецФункции

