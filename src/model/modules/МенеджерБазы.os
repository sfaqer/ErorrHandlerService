#Использовать entity
#Использовать json

Перем БазаСоздана Экспорт;

Перем МенеджерСущностей;
Перем ХранилищеОтчетовОбОшибке Экспорт;

Процедура Инициализация() Экспорт

	МенеджерСущностей = Новый МенеджерСущностей(
		Тип("КоннекторPostgreSQL"), 
		"Host=psql;Username=postgres;Password=postgres;Database=postgres;port=5432;"
	);

	МенеджерСущностей.ДобавитьКлассВМодель(Тип("ОтчетОбОшибке"));

	МенеджерСущностей.Инициализировать();
	ХранилищеОтчетовОбОшибке = МенеджерСущностей.ПолучитьХранилищеСущностей(Тип("ОтчетОбОшибке"));

	Сообщить("База создана", СтатусСообщения.Информация);
	
	БазаСоздана = Истина;

КонецПроцедуры

Функция ПолучитьСписокОтчетовОбОшибке() Экспорт

	Возврат ХранилищеОтчетовОбОшибке.Получить();
	
КонецФункции

///////////////////////////////////////////////////

БазаСоздана = Ложь;