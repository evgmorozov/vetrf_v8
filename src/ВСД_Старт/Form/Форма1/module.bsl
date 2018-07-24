﻿Перем СписокКонстант;
Перем КаталогОбработок, ИмяОбработкиИнтеграции;

Процедура ПутьИИмяИзПолного(ПутьИИмя)
	//mista
	Путь = "";
	Имя  = "";
	ПозСлэш = Найти(ПутьИИмя,"\");
	Пока ПозСлэш > 0 Цикл
    	Путь = Путь+Сред(ПутьИИмя,1,ПозСлэш);
	    ПутьИИмя = Сред(ПутьИИмя,ПозСлэш+1);
    	ПозСлэш = Найти(ПутьИИмя,"\");
	КонецЦикла;
	Имя = ПутьИИмя;
	КаталогОбработок = Путь;
	ИмяОбработкиИнтеграции = Имя;
	//Сообщить(Путь);
	//Сообщить(Имя);	
КонецПроцедуры

Процедура ПередОткрытием(Отказ, СтандартнаяОбработка)
	_Организация   = УправлениеПользователями.ПолучитьЗначениеПоУмолчанию(глЗначениеПеременной("глТекущийПользователь"), "ОсновнаяОрганизация");
	СписокКонстант = ВСД.ЗагрузитьПараметры( _Организация );
	Если НЕ ЗначениеЗаполнено(СписокКонстант.Получить("ПолноеИмяФайлаОбработки")) тогда
		Сообщить("Не удалось получить настройки для запуска обработок");
		Отказ = истина;
		Возврат;
	КонецЕсли;
	ПутьИИмяИзПолного(СписокКонстант.Получить("ПолноеИмяФайлаОбработки"));
КонецПроцедуры

Процедура ПриОткрытии()
	//ПутьИИмяИзПолного(СписокКонстант.Получить("ПолноеИмяФайлаОбработки"));
КонецПроцедуры

Процедура ОткрытьОбработку(ИмяОбработки)
	ПолноеИмяФайлаОбработки = КаталогОбработок+ИмяОбработки;
	ВнешняяОбработка = ВнешниеОбработки.Создать(ПолноеИмяФайлаОбработки);
	Форма = ВнешняяОбработка.ПолучитьФорму();
	Форма.Открыть();
КонецПроцедуры


Процедура КнИнтеграцияНажатие(Элемент)
	ОткрытьОбработку(ИмяОбработкиИнтеграции);
КонецПроцедуры

Процедура КнСоздатьПродукциюНажатие(Элемент)
	ОткрытьОбработку("МеркурийСоздатьПродукцияЭлемент.epf");
КонецПроцедуры

Процедура КнГашениеНажатие(Элемент)
	ОткрытьОбработку("МеркурийГашениеВСД.epf");
КонецПроцедуры
