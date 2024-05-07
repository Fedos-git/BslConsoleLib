//параметры по умолчанию:
//font-family: Consolas, "Courier New", monospace; 
//font-weight: normal; 
//font-size: 14px; 
//line-height: 19px; 


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка) 
	
	ЭтотОбъект.ЗакрыватьПриВыборе = Ложь; 
	
	ЗаполнитьЗначенияСвойств(ЭтотОбъект, Параметры.НастройкиРедактора);
	ЗаполнитьЗначенияСвойств(ЭтотОбъект, Параметры.ШрифтРедактора); 
	
КонецПроцедуры


&НаКлиенте
Процедура ВыборШрифтаЗавершение(_Шрифт, _ДополнительныеПараметры) Экспорт 
	
	Если _Шрифт <> Неопределено Тогда
		Если _Шрифт.Вид <> ВидШрифта.Абсолютный Тогда
			Сообщить("Должен быть выбран абсолютный шрифт.");
		Иначе
			ИмяШрифта = _Шрифт.Имя;	
		КонецЕсли;			
	КонецЕсли;
	
КонецПроцедуры 

&НаКлиенте
Процедура ИмяШрифтаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	ДиалогВыбора = Новый ДиалогВыбораШрифта; 
	ДиалогВыбора.Шрифт = Новый Шрифт(ИмяШрифта, РазмерШрифта);
	ДиалогВыбора.Показать(Новый ОписаниеОповещения("ВыборШрифтаЗавершение", ЭтотОбъект));
	
КонецПроцедуры

&НаКлиенте
Функция СтруктураНастроек()
	
	Результат = ЭтотОбъект.ВладелецФормы.НовыеНастройкиЭкспорт();
	
	Результат.ШрифтРедактора.ИмяШрифта 		= ?(ПустаяСтрока(ИмяШрифта), Неопределено, ИмяШрифта);	
	Результат.ШрифтРедактора.РазмерШрифта 	= РазмерШрифта;	
	Результат.ШрифтРедактора.ТолщинаШрифта 	= ТолщинаШрифта;	
	Результат.ШрифтРедактора.ВысотаСтроки 	= ВысотаСтроки;
	
	Результат.НастройкиРедактора.КартаКода 			= КартаКода;
	Результат.НастройкиРедактора.СтрокаСостояния 	= СтрокаСостояния;
	Результат.НастройкиРедактора.Тема 				= Тема;
	Результат.НастройкиРедактора.Язык 				= Язык;
	Результат.НастройкиРедактора.НомераСтрок 		= НомераСтрок;
	Результат.НастройкиРедактора.ОтображатьПробелы 	= ОтображатьПробелы;
	
		                                        
	Возврат Результат;
	
КонецФункции 

&НаКлиенте
Процедура Применить(Команда)
	
	ОповеститьОВыборе(СтруктураНастроек());
	
КонецПроцедуры
