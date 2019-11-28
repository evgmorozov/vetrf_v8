﻿
&НаСервере
Процедура ВыполнитьНаСервере(ПараметрКоманды)
	Организация = кб99_ВСД_Общий.ПолучитьОрганизациюПоУмолчанию();	
	ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Организация );
	
	Для Каждого ВыбХозСубъект Из ПараметрКоманды Цикл
		кб99_ВСД_Запросы.ХозСубъект_ПолучитьGuidПоИНН( ПараметрыОрганизации, ВыбХозСубъект );
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	ПоказатьОповещениеПользователя("Выполняем запрос",,"Ожидайте...",БиблиотекаКартинок.Информация32);
	
	ВыполнитьНаСервере(ПараметрКоманды);
		
	ПоказатьОповещениеПользователя("Операция завершена");
КонецПроцедуры
