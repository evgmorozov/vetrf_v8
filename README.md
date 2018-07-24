# vetrf_v8
# Создание ветсправок в ГИС Меркурий из 1С Предприятие 8.2

Интеграция 1С:Комплексная с государственной информационной системой “Меркурий” предназначен для обеспечения взаимодействия учетной системы заказчика, созданной на базе конфигурации Управление Торговлей, ред. 10\11 системы программ "1С:Предприятие 8.2", с ГИС "Меркурий".

* автоматическое создание входящих ВСД из 1С
* групповое создание исходящих (транспортных) ВСД, заполненных на основании введенных документов Реализация товаров
* получение ответа о создании документа (принят / отклонен), с указанием причины отказа.
* получение списка площадок и ХозСубъектов из ГИС Меркурий
* создание новых площадок и хоз. субъектов в ГИС Меркурий из 1С

ВСД = Ветеринарно сопроводительная документация = Ветсправка форма 2 или форма 4

Продукт предназначен для всех предприятий, участвующих в обороте поднадзорных госветнадзору грузов, для отслеживания их транзакций и путей их перемещения по территории Российской Федерации и Таможенного союза использующих систему 1С Предприятие 7.7 

### Преимущества:
 
* Соединение 1С Предприятие с Ветис ( ГИС Меркурий ) происходит с помощью внешней библиотеки
* Отсутствуют промежуточные шлюзы для выгрузки-передачи данных

[*Подробное описание*](http://www.kb99.pro/%D0%BE%D0%B1%D0%BC%D0%B5%D0%BD-%D0%B2%D1%81%D0%B4-%D0%B3%D0%B8%D1%81-%D0%BC%D0%B5%D1%80%D0%BA%D1%83%D1%80%D0%B8%D0%B9-1%D1%81-%D0%BF%D1%80%D0%B5%D0%B4%D0%BF%D1%80%D0%B8%D1%8F%D1%82%D0%B8%D0%B5/)

[*Описание установки*](https://redmine.kb99.pro/projects/vsd_v8/wiki)

### Регистрация dll
<pre>
%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\regasm.exe  "[Полный путь к soapdll_test.dll в кавычках]" /codebase
</pre>
