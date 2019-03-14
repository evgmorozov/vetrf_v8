﻿&НаСервере
Процедура ВыполнитьНаСервере( СписокПартий )
	
	Организация = ВСД_Общий.ПолучитьОрганизациюПоУмолчанию();	
	ПараметрыОрганизации = ВСД.ЗагрузитьПараметры( Организация );
	
	Для каждого ВыбПартия из СписокПартий Цикл
		ВСД_Запросы.Партии_ПолучитьПоGUID( ПараметрыОрганизации, ВыбПартия );
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	ПоказатьОповещениеПользователя("Выполняем запрос",,"Ожидайте...",БиблиотекаКартинок.Информация32);
	
	ВыполнитьНаСервере( ПараметрКоманды );
	
	ПоказатьОповещениеПользователя("Операция завершена");
КонецПроцедуры
