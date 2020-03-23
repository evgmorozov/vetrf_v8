﻿
Функция ПолучитьДанныеДляСозданияВСДТранзакции( ПараметрыОрганизации ) 
// вызов переопределения
	//Обработка = ФункцияПереопределена("ПолучитьДанныеДляСозданияВСДТранзакции");
	//Если обработка <> Неопределено Тогда
	//	Возврат Обработка.ПолучитьДанныеДляСозданияВСДТранзакции(ЭтотОбъект, ДокументОснование, Получатель_Хозсубъект, Получатель_Площадка);
	//КонецЕсли;	
	
	Рез = Новый Структура;
	
		Если ТипЗнч(ДокументОснование) = Тип("ДокументСсылка.РеализацияТоваровУслуг") Тогда
			Если ПараметрыОрганизации["ПарамФильтроватьРеализациюПоСкладуПлощадкиОтправителя"] Тогда   // Определим нашу площадку по Складу
				_Отправитель_Площадка = кб99_ВСД.НайтиПлощадкуПоСкладу(ДокументОснование.Склад, ПараметрыОрганизации["Отправитель_ХозСубъект"]);
			Иначе
				_Отправитель_Площадка = ПараметрыОрганизации["Отправитель_Площадка"];
			КонецЕсли;
			_Получатель_ХозСубъект = кб99_ВСД.НайтиХозСубъект(ДокументОснование.Контрагент);				
			Если ПараметрыОрганизации["РеквизитГрузополучатель"] = 0 Тогда 
				//контрагент
				_Получатель_Площадка = кб99_ВСД.НайтиПлощадкуПоКонтрагенту(ДокументОснование.Контрагент);
			Иначе
				//Адрес доставки
				_Получатель_Площадка = кб99_ВСД.НайтиПлощадкуПоКонтрагенту(ДокументОснование.АдресДоставки);
			КонецЕсли;
				
		ИначеЕсли  ТипЗнч(ДокументОснование) = Тип("ДокументСсылка.ПеремещениеТоваров") Тогда
			
			_Отправитель_Площадка = кб99_ВСД.НайтиПлощадкуПоСкладу(ДокументОснование.СкладОтправитель, ПараметрыОрганизации["Отправитель_ХозСубъект"]);
			_Получатель_ХозСубъект = ПараметрыОрганизации["Отправитель_ХозСубъект"];
			_Получатель_Площадка = кб99_ВСД.НайтиПлощадкуПоСкладу(ДокументОснование.СкладПолучатель, _Получатель_ХозСубъект);
			
		ИначеЕсли  ТипЗнч(ДокументОснование) = Тип("ДокументСсылка.РасходныйОрдер") Тогда
			
			_Отправитель_Площадка = ПараметрыОрганизации["Отправитель_Площадка"];
			_Получатель_ХозСубъект = кб99_ВСД.НайтиХозСубъект(ДокументОснование.Контрагент);				
			Если ПараметрыОрганизации["РеквизитГрузополучатель"] = 0 Тогда 
				//контрагент
				_Получатель_Площадка = кб99_ВСД.НайтиПлощадкуПоКонтрагенту(ДокументОснование.Контрагент);
			Иначе
				//Адрес доставки
				_Получатель_Площадка = кб99_ВСД.НайтиПлощадкуПоКонтрагенту(ДокументОснование.АдресДоставки);
			КонецЕсли;
			
		КонецЕсли;
		
		Рез.Вставить("Отправитель_Хозсубъект", 	ПараметрыОрганизации["Отправитель_ХозСубъект"]);  // Взяли из реквизитов обработки - активные данные
		Рез.Вставить("Отправитель_Площадка", 	_Отправитель_Площадка);
		Рез.Вставить("Получатель_Хозсубъект", 	_Получатель_ХозСубъект);
		Рез.Вставить("Получатель_Площадка", 	_Получатель_Площадка);
	
	Возврат Рез;
КонецФункции


Процедура ОбработкаЗаполнения( ДанныеЗаполнения, СтандартнаяОбработка)
	ОтПоставщика = Ложь; // временно
	
	Если (ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.РеализацияТоваровУслуг")) или
		(ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ПеремещениеТоваров")) Тогда
		// Заполнение шапки
		ДокументОснование = ДанныеЗаполнения.Ссылка;
		Организация = ДокументОснование.Организация;
		
		ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Организация );
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, ПараметрыОрганизации );
		
		ЭтоПеремещениеОтПоставщика = ОтПоставщика;
				
		ПараметрыДокумента = ПолучитьДанныеДляСозданияВСДТранзакции( ПараметрыОрганизации );  //!!!!
		
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, ПараметрыДокумента );
		
		Дата = ?(ЗначениеЗаполнено(ДокументОснование), ДокументОснование.Дата, ТекущаяДата());			
		//Перевозчик_ХозСубъект = ПараметрыОрганизации["Перевозчик_ХозСубъект"];
		ТтнСерия = ""; 
		ТтнНомер = кб99_ВСД_Общий.ПолучитьНомерДокБезПрефикса( ДокументОснование );
		ТтнДата = Дата; 
		номерАвто = кб99_ВСД_Общий.ПолучитьНомерАвто( ДокументОснование ); 
		
		Местность 		= ПараметрыОрганизации["ВСД_Местность"];
		ОсобыеОтметки 	= ПараметрыОрганизации["ВСД_ОсобыеОтметки"];
		cargoInspected  	= Истина;			
		РезультатыИсследований = ПараметрыОрганизации["ВСД_РезультатыИсследований"]; 
		//ТермическиеУсловияПеревозки = ПараметрыОрганизации["ТермическиеУсловияПеревозки"];
		
		кб99_ВСД_Общий.ЗаполнитьТабЧастьВСД( ПараметрыОрганизации, ДокументОснование, ЭтотОбъект );
		
	ИначеЕсли ( ТипЗнч(ДанныеЗаполнения) = Тип("Структура") ) Тогда 
				
		Если ДанныеЗаполнения.Свойство("ОтПоставщика") и ДанныеЗаполнения.ОтПоставщика Тогда 
			// внутреннее перемещение ОТ поставщика
			ДокументОснование = ДанныеЗаполнения.Основание;
			ЭтоПеремещениеОтПоставщика = Истина;
			тзАктуальныхПартий = Неопределено;
			Комментарий = "Перемещение от поставщика на основании "+ДокументОснование;
			
			ОрганизацияПолучатель = ДокументОснование.Организация;
			ПараметрыОрганизацииПолучателя = кб99_ВСД.ЗагрузитьПараметры( ОрганизацияПолучатель );
			Организация = ПараметрыОрганизацииПолучателя.ПарамПоставщикОрганизация;			
			ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Организация );
			ЗаполнитьЗначенияСвойств(ЭтотОбъект, ПараметрыОрганизации );			
			
			Отправитель_ХозСубъект = ПараметрыОрганизацииПолучателя.ПарамПоставщикХозСубъект;
			Отправитель_Площадка = ПараметрыОрганизацииПолучателя.ПарамПоставщикПлощадка;			
			Получатель_ХозСубъект = ПараметрыОрганизацииПолучателя.Отправитель_ХозСубъект;
			Получатель_Площадка = ПараметрыОрганизацииПолучателя.Отправитель_Площадка;
			
			кб99_ВСД_Общий.ЗаполнитьТабЧастьВСД( ПараметрыОрганизации, ДокументОснование, ЭтотОбъект, тзАктуальныхПартий );
		Иначе
			// заполнение по ТЗ Партий
			ПараметрыДокумента = ДанныеЗаполнения.ПараметрыДокумента;
			Если ДанныеЗаполнения.Свойство("тзАктуальныхПартий") Тогда 
				тзАктуальныхПартий = ДанныеЗаполнения.тзАктуальныхПартий;
			Иначе
				тзАктуальныхПартий = Неопределено;
			КонецЕсли;
			Если ПараметрыДокумента.Свойство("ДокОснование") Тогда 
				ДокументОснование  = ПараметрыДокумента.ДокОснование;
				Попытка 
					Организация = ДокументОснование.Организация;
				Исключение 
					Организация = ПараметрыДокумента.Организация;
				КонецПопытки;
			Иначе
				Организация = ПараметрыДокумента.Организация;
				ДокументОснование = Неопределено;
			КонецЕсли;
			
			ПараметрыОрганизации = кб99_ВСД.ЗагрузитьПараметры( Организация );
			ЗаполнитьЗначенияСвойств(ЭтотОбъект, ПараметрыОрганизации );			
			
			//загрузим входящие параметры
			ЗаполнитьЗначенияСвойств(ЭтотОбъект, ПараметрыДокумента);
			
			Если ДанныеЗаполнения.Свойство("Партии") Тогда 
				
				// заполним Товары подготовленной таблицей Партий				
				Для Каждого стрПартия из ДанныеЗаполнения.Партии Цикл
					СтрТовары = ЭтотОбъект.Товары.Добавить();
					СтрТовары.КлючСтроки = Новый УникальныйИдентификатор();
					ЗаполнитьЗначенияСвойств( стрТовары, стрПартия );
					кб99_ВСД_Общий.ЗаполнитьРеквизитыСтрокиВСД(ПараметрыОрганизации,СтрТовары,стрПартия, ЭтотОбъект);
				КонецЦикла;
				
			ИначеЕсли ПараметрыДокумента.Свойство("Товары") Тогда 
				кб99_ВСД_Общий.ЗаполнитьТабЧастьВСДпоТЗ( ПараметрыОрганизации, ПараметрыДокумента.Товары, ЭтотОбъект, тзАктуальныхПартий );
			Иначе
				кб99_ВСД_Общий.ЗаполнитьТабЧастьВСД( ПараметрыОрганизации, ДокументОснование, ЭтотОбъект, тзАктуальныхПартий );
			КонецЕсли;
			
		КонецЕсли;		
		
		Дата = ?(ЗначениеЗаполнено(ДокументОснование), ДокументОснование.Дата, ТекущаяДата());			
		//Перевозчик_ХозСубъект = ПараметрыОрганизации["Перевозчик_ХозСубъект"];
		ТтнСерия = ""; 
		Если Не ЗначениеЗаполнено( ТтнНомер ) Тогда 
			ТтнНомер = кб99_ВСД_Общий.ПолучитьНомерДокБезПрефикса( ДокументОснование );
		КонецЕсли;
		Если Не ЗначениеЗаполнено( ТтнДата ) Тогда 
			ТтнДата = Дата; 
		КонецЕсли;
		Если Не ЗначениеЗаполнено(НомерАвто) Тогда 
			номерАвто = кб99_ВСД_Общий.ПолучитьНомерАвто( ДокументОснование ); 		
		КонецЕсли;
		
		Если ПараметрыОрганизации.Свойство("ВСД_Местность") Тогда 
			Местность = ПараметрыОрганизации["ВСД_Местность"];
		КонецЕсли;
		Если ПараметрыОрганизации.Свойство("ВСД_ОсобыеОтметки") Тогда 
			ОсобыеОтметки = ПараметрыОрганизации["ВСД_ОсобыеОтметки"];
		КонецЕсли;
		cargoInspected = Истина;			
		Если ПараметрыОрганизации.Свойство("ВСД_РезультатыИсследований") Тогда 
			РезультатыИсследований = ПараметрыОрганизации["ВСД_РезультатыИсследований"]; 
		КонецЕсли;
		
	КонецЕсли;
	
	кб99_ВСД_Общий.ЗаполнитьСвязанныеДокументы( ЭтотОбъект ); 	
КонецПроцедуры
