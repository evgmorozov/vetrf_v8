﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	// Оформляем ВСД2
	//Можно задать вопрос - 1 или 2 форму создавать
	ДокСсылка = ПараметрКоманды;
	ОткрытьФорму("Документ.ВСД2_Производство.ФормаОбъекта", Новый Структура("Основание", ДокСсылка));
КонецПроцедуры
