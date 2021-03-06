﻿Функция ПолучитьНоменклатуруПоВСДЭлементу(ВСДЭлемент)
	// Возврашает массив со ссылками на Номенклатуру
	Запрос = Новый Запрос;
	Запрос.Текст = "Выбрать ВСД_Соответсвия.Номенклатура из РегистрСведений.ВСД_Соответсвия как ВСД_Соответсвия где ВСД_Соответсвия.ПродукцияЭлемент = &Ресурс1";
	Запрос.УстановитьПараметр("Ресурс1", ВСДЭлемент);
	ТзВрем = Запрос.Выполнить().Выгрузить();
	ТзВрем.ВыгрузитьКолонку("Номенклатура");
	Возврат ТзВрем.ВыгрузитьКолонку("Номенклатура");
КонецФункции

Функция ПолучитьВСДЭлементПоНоменклатуре(ВыбНоменклатура)
	Запрос = Новый Запрос;
	Запрос.Текст = "Выбрать ВСД_Соответсвия.ПродукцияЭлемент КАК ПродукцияЭлемент из РегистрСведений.ВСД_Соответсвия как ВСД_Соответсвия где ВСД_Соответсвия.Номенклатура = &ВыбНоменклатура";
    Запрос.УстановитьПараметр("ВыбНоменклатура", ВыбНоменклатура); 
	
	ПродукцияЭлемент = Справочники.ВСД_Продукция_Элемент.ПустаяСсылка();
	
	Выборка = Запрос.Выполнить().Выбрать();
	Если Выборка.Следующий() Тогда
		Возврат Выборка.ПродукцияЭлемент;	
	КонецЕсли;
//	Пока Выборка.Следующий() Цикл
//		ПродукцияЭлемент = Выборка.ПродукцияЭлемент;
//		Прервать;
//	КонецЦикла; 
	Возврат ПродукцияЭлемент;
КонецФункции


Процедура УстановитьСоответствие(ВыбНоменклатура,ВСДЭлемент)
	Набор = РегистрыСведений.ВСД_Соответсвия.СоздатьНаборЗаписей();
	Набор.Отбор.Номенклатура.Установить(ВыбНоменклатура);
	Набор.Отбор.Номенклатура.Использование = Истина;
	Набор.Прочитать();
	Набор.Очистить(); // если что и было - подчистим
	НовЗапись = Набор.Добавить();
	НовЗапись.Номенклатура = ВыбНоменклатура;
	НовЗапись.ПродукцияЭлемент = ВСДЭлемент;
	Набор.Записать(true);
КонецПроцедуры

Процедура ОчиститьСоответствие(ВыбНоменклатура,ВСДЭлемент)
	Набор = РегистрыСведений.ВСД_Соответсвия.СоздатьНаборЗаписей();
	Набор.Отбор.Номенклатура.Установить(ВыбНоменклатура);
	Набор.Отбор.Номенклатура.Использование = Истина;
	Набор.Прочитать();
	Набор.Очистить();
	Набор.Записать(true);
КонецПроцедуры


Процедура УстановитьСоответствиеСписку(СписокНоменклатуры,ВСДЭлемент)
	Для каждого Элемент из СписокНоменклатуры Цикл
		УстановитьСоответствие(Элемент.Значение,ВСДЭлемент);
	КонецЦикла; 	
КонецПроцедуры

Процедура УдалитьСоответствиеСписку(СписокНоменклатуры,ВСДЭлемент)
	Для каждого Элемент из СписокНоменклатуры Цикл
		ОчиститьСоответствие(Элемент.Значение,ВСДЭлемент);
	КонецЦикла; 	
КонецПроцедуры


Процедура ОбработкаВыбора(ЗначениеВыбора, Источник)
	Если СзНоменклатура.НайтиПоЗначению(ЗначениеВыбора) = Неопределено Тогда
		СзНоменклатура.Добавить(ЗначениеВыбора);
	КонецЕсли;
КонецПроцедуры

Процедура ОткрытьПодборНоменклатуры()
    ФормаВыбора = Справочники.Номенклатура.ПолучитьФормуВыбора(,ЭтаФорма);
    ФормаВыбора.РежимВыбора = Истина;
    ФормаВыбора.ЗакрыватьПриВыборе = Ложь;
    ФормаВыбора.Открыть();
КонецПроцедуры


Процедура УдалитьИзСпискаНажатие(Элемент)
	Элем = ЭлементыФормы.СзНоменклатура.ТекущаяСтрока;
	Если Элем = неопределено тогда
		Возврат;
	КонецЕсли;
	ТекущаяСтрока = СзНоменклатура.Индекс(Элем);                        
	СзНоменклатура.Удалить(ТекущаяСтрока);	
КонецПроцедуры

Процедура ДобавитьВСписокНажатие(Элемент)
	ОткрытьПодборНоменклатуры()
КонецПроцедуры


Процедура ПрочитатьСоответствияВСДЭлементуНажатие(Элемент)
	СзНоменклатура.Очистить();
	Рез = ПолучитьНоменклатуруПоВСДЭлементу(ВыбВСДЭлемент);
	СзНоменклатура.ЗагрузитьЗначения(Рез);
КонецПроцедуры


Процедура КнопкаУстановитьСоответствия(Кнопка)
	Если ВыбВСДЭлемент.Пустая() тогда
		Предупреждение("Укажите ВСДЭлемент");
		Возврат;
	КонецЕсли;
	//Для начала очистим соответствия
	МассивНоменклатуры = ПолучитьНоменклатуруПоВСДЭлементу(ВыбВСДЭлемент);
	СписокНоменклатуры = Новый СписокЗначений;
	СписокНоменклатуры.ЗагрузитьЗначения(МассивНоменклатуры);
	УдалитьСоответствиеСписку(СписокНоменклатуры,ВыбВСДЭлемент);
	
	УстановитьСоответствиеСписку(СзНоменклатура,ВыбВСДЭлемент);
	Предупреждение("Установлено");
КонецПроцедуры

Процедура КнопкаОчиститьСоответствия(Кнопка)
	Если ВыбВСДЭлемент.Пустая() тогда
		Предупреждение("Укажите ВСДЭлемент");
		Возврат;
	КонецЕсли;
	Ответ = Вопрос("Удалить соответствие выбранной номенклатуры ВСДЭлементу?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Нет Тогда
    	Возврат;
	КонецЕсли;
	УдалитьСоответствиеСписку(СзНоменклатура,ВыбВСДЭлемент);
	ПрочитатьСоответствияВСДЭлементуНажатие(Кнопка);
КонецПроцедуры

Процедура кнЗагрузитьНажатие(Элемент)
	Ответ = Вопрос("Загрузить в регистр соответствия, указанные в справочнике Номенклатура?",РежимДиалогаВопрос.ДаНет,0);
	Если Ответ = КодВозвратаДиалога.Нет Тогда
    	Возврат;
	КонецЕсли;
	
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	|	Номенклатура.Ссылка,
	|	Номенклатура.ВСД_Продукция_Элемент
	|ИЗ
	|	Справочник.Номенклатура КАК Номенклатура
	|ГДЕ
|	Номенклатура.ВСД_Продукция_Элемент <> &ПустойЭлемент";
	Запрос.УстановитьПараметр("ПустойЭлемент",Справочники.ВСД_Продукция_Элемент.ПустаяСсылка());
			   
	Выборка = Запрос.Выполнить().Выбрать();
	Пока Выборка.Следующий() Цикл
		Сообщить(Выборка.Ссылка);
		УстановитьСоответствие(Выборка.Ссылка,Выборка.ВСД_Продукция_Элемент);
	КонецЦикла;
	//Перерисуем
	 ПрочитатьСоответствияВСДЭлементуНажатие(Элемент);

	
КонецПроцедуры








