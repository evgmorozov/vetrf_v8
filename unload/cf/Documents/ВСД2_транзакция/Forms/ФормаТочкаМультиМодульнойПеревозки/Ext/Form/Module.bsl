﻿
&НаКлиенте
Процедура кнСохранить(Команда)
	// Снятие модифицированности, т.к. перед закрытием признак проверяется.
	Модифицированность = Ложь;
	Отказ = Ложь;
	
	//Если НЕ ИспользоватьРеализациюПоНесколькимЗаказам Тогда
	//	Отказ = ПроверитьВыборНесколькихЗаказов();
	//КонецЕсли;
	//
	//Если Отказ Тогда
	//	ПоказатьПредупреждение(,НСтр("ru='Нельзя выбрать товары больше, чем по одному заказу.'"));
	//	Возврат
	//КонецЕсли;
	//
	//АдресТоваровВХранилище = ПоместитьТоварыВХранилище();
	
	//Закрыть();

	Ответ = Новый Структура;
	//Ответ.Вставить( "SequenceNumber",SequenceNumber );
	Ответ.Вставить( "Площадка", Площадка );
	Ответ.Вставить( "ТипТранспорта", ТипТранспорта );
	Ответ.Вставить( "номерАвто", номеравто );
	Ответ.Вставить( "номерКонтейнера", номерКонтейнера );
	Ответ.Вставить( "номерПрицепа", номерПрицепа );
	Ответ.Вставить( "номерВагона", номерВагона );
	Ответ.Вставить( "НазваниеСудна", НазваниеСудна );
	Ответ.Вставить( "НомерАвиарейса", НомерАвиарейса );
	Ответ.Вставить( "Площадка", Площадка );
	Ответ.Вставить( "Страна", Страна );
	Ответ.Вставить( "Регион", Регион );
	Ответ.Вставить( "Район", Район );
	Ответ.Вставить( "Город", Город );
	Ответ.Вставить( "Улица", Улица );
	Ответ.Вставить( "Дом", Дом );
	Ответ.Вставить( "Строение", Строение );
	Ответ.Вставить( "Помещение", Помещение );
	Ответ.Вставить( "Название", Название );
	Ответ.Вставить( "Перегрузка", Перегрузка);
	ОповеститьОВыборе( Ответ );

КонецПроцедуры
