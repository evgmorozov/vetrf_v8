﻿
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ЭлементОтбора = ЭтаФорма.дсЗапросы.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Объект");
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно; 
	ЭлементОтбора.РежимОтображения = РежимОтображенияЭлементаНастройкиКомпоновкиДанных.БыстрыйДоступ; 
	ЭлементОтбора.ПравоеЗначение = Объект.Ссылка;
	
	ОбновитьНадписи(ЭтаФорма);
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура ОбновитьНадписи(Форма)
	
	Объект = Форма.Объект;
	
	Запрос = кб99_ВСД_Общий.НайтиПоследнийЗапрос( Объект.Ссылка );
	Форма.ApplicationID = Запрос.ApplicationID;
	Форма.СтатусЗапроса = Запрос.СтатусЗапроса;
	
	Если ЗначениеЗаполнено( Запрос.Ошибки ) Тогда
		Форма.Элементы.Ошибки.Видимость = Истина;
		Форма.Ошибки = Запрос.Ошибки;
	Иначе
		Форма.Элементы.Ошибки.Видимость = Ложь;
	КонецЕсли;
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьСтроку()
	
	СтрокаТч = Элементы.ВСДВходящие.ТекущиеДанные;
	Если НЕ СтрокаТч.Перегрузка Тогда
		кб99_ВСД.СообщитьИнфо("Изменить Тип и Номер транспорта возможно только для точки прегрузки!");
		СтрокаТч.ТипТранспорта = Неопределено;
		СтрокаТч.НомерАвто = Неопределено;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВСДВходящиеТипТранспортаПриИзменении(Элемент)
	ПроверитьСтроку();
КонецПроцедуры

&НаКлиенте
Процедура ВСДВходящиеНомерТСПриИзменении(Элемент)
	ПроверитьСтроку();
КонецПроцедуры
