﻿&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	ПутьВеб = ВСД.ПечатьПолнойФормыВСД(ПараметрКоманды);
	Если ПутьВеб.Количество() > 0 Тогда
		Для каждого стрПуть из ПутьВеб Цикл
			ЗапуститьПриложение(стрПуть.Значение);	
		КонецЦикла;
	Иначе
		Сообщить("Нечего открывать");
	КонецЕсли;
	//ВСД.ПечатьПолнойФормыВСД(ПараметрКоманды);
КонецПроцедуры
