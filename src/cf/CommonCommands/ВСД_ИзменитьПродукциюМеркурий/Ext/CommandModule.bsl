﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	ТВопроса = "Изменить Продукцию в Меркурий ?";
	Ответ = Вопрос(ТВопроса,РежимДиалогаВопрос.ДаНет,0);
	Если НЕ (Ответ = КодВозвратаДиалога.Да) Тогда
		Возврат;
	КонецЕсли;
	ПоказатьОповещениеПользователя("Выполняем запрос Изменение Продукции",,"Ожидайте...",БиблиотекаКартинок.Информация32);
	ВСД.Изменить_Продукцию_Меркурий(,ПараметрКоманды,"UPDATE");
	ПоказатьОповещениеПользователя("Операция завершена");
КонецПроцедуры
