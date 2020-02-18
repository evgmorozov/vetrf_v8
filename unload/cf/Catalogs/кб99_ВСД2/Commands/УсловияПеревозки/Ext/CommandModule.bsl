﻿&НаКлиенте
Процедура ПредупреждениеПользователю(ТекстПредупреждения) Экспорт
 
    Оповещение = Новый ОписаниеОповещения("ПослеЗакрытияПредупреждение",
        ЭтотОбъект);	
 
    ПоказатьПредупреждение(
        Оповещение,
        ТекстПредупреждения, // предупреждение
        0, // (необ.) таймаут в секундах
        "Предупреждение" // (необ.) заголовок
    );
 
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗакрытияПредупреждение(Параметры) Экспорт	
	
КонецПроцедуры

&НаСервере
Процедура ЗаписатьВсдНаСервере(ДокСсылка)
	
	Докобъект = ДокСсылка.ПолучитьОбъект();
	//Докобъект.УсловияПеревозки.Очистить();
	ДокОбъект.Записать();
	
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаОтвета(Ответ, Парам) Экспорт
	
	Если Ответ = КодВозвратаДиалога.Да Тогда
		
		ДокСсылка = Парам.ПараметрКоманды;
			
		ПоказатьОповещениеПользователя("Выполняем запрос Регионализации",,"Ожидайте...",БиблиотекаКартинок.Информация32);
		
		//ЗаписатьВСДНаСервере(ДокСсылка);
		кб99_ВСД.ПолучитьУсловияПеревозки(ДокСсылка);
		ПоказатьОповещениеПользователя("Выполнено");
		
	КонецЕсли;
	
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	ТВопроса = "Получить Условия перевозки?";
	Парам = Новый Структура("ПараметрКоманды,ПараметрыВыполненияКоманды",ПараметрКоманды,ПараметрыВыполненияКоманды);
    Оповещение = Новый ОписаниеОповещения("ОбработкаОтвета",ЭтотОбъект,Парам);	
    ПоказатьВопрос(Оповещение, ТВопроса, РежимДиалогаВопрос.ДаНет,  0, КодВозвратаДиалога.Да, ""   );
	
КонецПроцедуры
