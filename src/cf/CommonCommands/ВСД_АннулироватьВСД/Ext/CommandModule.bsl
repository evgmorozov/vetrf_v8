﻿&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	Ответ = Вопрос("Аннулировать ВСД ?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Да Тогда
		ПоказатьОповещениеПользователя("Выполняем Аннулирование ВСД",,"Ожидайте...",БиблиотекаКартинок.Информация32);
		Если Найти(ПараметрыВыполненияКоманды.Источник.ИмяФормы,"Списка") = 0 Тогда
			ПараметрыВыполненияКоманды.Источник.этаФорма.Закрыть();
		КонецЕсли;		
    	ВСД.АннулироватьВСД(ПараметрКоманды);
		ПоказатьОповещениеПользователя("Выполнено");
	КонецЕсли;
КонецПроцедуры
