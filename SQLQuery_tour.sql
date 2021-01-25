create database [Туристическая фирма]

USE [Туристическая фирма]

CREATE TABLE [Страны (по ISO 3166)]
(
	[ID страны] INT IDENTITY PRIMARY KEY,
	[Страна] NVARCHAR(50) NOT NULL 
	DEFAULT 'название страны' UNIQUE,
	[Alpha-2 ISO 3166-1] NVARCHAR(3) NOT NULL,
	[Alpha-3 ISO 3166-1] NVARCHAR(3) NULL,
	[Цифровой ISO 3166-1] SMALLINT NULL UNIQUE,
	[код ISO 3166-2] NVARCHAR(50) NOT NULL DEFAULT 'ISO 3166-2:'
)
/*
CREATE TABLE [Административное деление ↓]
(
	[ID Административная единица ↓] INT IDENTITY PRIMARY KEY NOT NULL,
	[Административная единица ↓] NVARCHAR(256) NOT NULL DEFAULT 'Введите название',
	[Статус] NVARCHAR(50)
)

CREATE TABLE [Административное деление ↓↓]
(
	[ID Административная единица ↓↓] INT IDENTITY PRIMARY KEY NOT NULL,
	[Административная единица ↓↓] NVARCHAR(256) NOT NULL DEFAULT 'Введите название',
	[Статус] NVARCHAR(50),--Район области/Город
	[ID Административная единица ↓] INT FOREIGN KEY REFERENCES 
	[Административное деление ↓]([ID Административная единица ↓])
)

CREATE TABLE [Административное деление ↓↓↓]
(	
	[ID Административная единица ↓↓↓] INT IDENTITY PRIMARY KEY NOT NULL,
	[Административная единица ↓↓↓] NVARCHAR(256) NOT NULL DEFAULT 'Введите название',
	[Статус] NVARCHAR(50),	--Округ/Район города
	[ID Административная единица ↓↓]
	INT FOREIGN KEY REFERENCES [Административное деление ↓↓]
	([ID Административная единица ↓↓])
)


CREATE TABLE [Улица]
(
	[ID улица] INT IDENTITY PRIMARY KEY,
	[Улица] NVARCHAR(50) NOT NULL 
	DEFAULT 'название улицы' UNIQUE,
	[ID Округ/Район города] INT FOREIGN KEY REFERENCES 
	[Административное деление ↓↓↓]([ID Административная единица ↓↓↓])
)

*/

CREATE TABLE [Валюта]
(
	[ID валюты] INT IDENTITY PRIMARY KEY,
	[Валюта] NVARCHAR(10)
)

CREATE TABLE [Туры]
(
	[ID туры] INT IDENTITY PRIMARY KEY,
	[наименование] NVARCHAR(256) DEFAULT 'название туры',
	[Страна • Туры] INT FOREIGN KEY REFERENCES  [Страны (по ISO 3166)]([ID страны]),
	[цена] MONEY NULL,
	[Валюта • Туры] INT FOREIGN KEY REFERENCES [Валюта]([ID валюты]),
	[длительность тура] DATE NULL
)

CREATE TABLE [Пол]
(
	[ID пол] INT IDENTITY PRIMARY KEY,
	[пол] NVARCHAR(10) NOT NULL DEFAULT 'введите пол'
)

CREATE TABLE [Удостоверения личности]
(
	[ID identity cards] INT PRIMARY KEY,
	[Фамилия] NVARCHAR(50) NOT NULL,
	[Имя] NVARCHAR(50) NOT NULL,
	[Отчество] NVARCHAR(50) NULL,
	[Пол • Удостоверения личности] INT FOREIGN KEY REFERENCES [Пол]([ID пол]),
	[Дата рождения] DATE,
	ИИН BIGINT NOT NULL,
	[дата выдачи удостоверения] DATE NOT NULL,
	UNIQUE (ИИН, [дата выдачи удостоверения])
)

CREATE TABLE [Клиенты]
(
	[ID клиента] INT IDENTITY(1,1) PRIMARY KEY,
	[Номер уд.личности] INT FOREIGN KEY REFERENCES --ФИО, пол, дата рождения итд
			[Удостоверения личности]([ID identity cards]),
	--[Адрес проживания] NVARCHAR(256) NOT NULL DEFAULT 'г. , ул. , дом. , кв.',
	[Номер телефона] BIGINT
)

CREATE TABLE [Адрес прописки клиента] 
(
	[ID адрес прописки] INT IDENTITY PRIMARY KEY,
	[ID клиента • Адрес прописки] INT FOREIGN KEY REFERENCES [Клиенты]([ID клиента]),
	[Место расположения] NVARCHAR(256) NULL,
	[Дом] SMALLINT,
	[кв.] SMALLINT
)

CREATE TABLE [Адрес фактического проживания клиента] 
(
	[ID адрес фактического проживания] INT IDENTITY PRIMARY KEY,
	[ID клиента • Адрес фактического проживания] INT FOREIGN KEY REFERENCES [Клиенты]([ID клиента]),
	[Место расположения] NVARCHAR(256) NULL,
	[Дом] SMALLINT,
	[кв.] SMALLINT
)

CREATE TABLE [Сотрудники]
(
	[ID сотрудники] INT IDENTITY PRIMARY KEY NOT NULL,
	[ФИО • Сотрудники] INT FOREIGN KEY REFERENCES 
	[Удостоверения личности]([ID identity cards]),
	[Номер телефона] bigint
)

CREATE TABLE [Касса]
(
	[ID сотрудника • Касса] INT FOREIGN KEY REFERENCES [Сотрудники]([ID сотрудники]),
	[ID клиента • Касса] INT FOREIGN KEY REFERENCES [Клиенты]([ID клиента]),
	[Сумма] MONEY NULL,
	[Валюта • Касса] INT FOREIGN KEY REFERENCES [Валюта]([ID валюты]),
	[Дата] DATE,
	[Код тура • Касса] INT FOREIGN KEY REFERENCES [Туры]([ID туры])
)

CREATE TABLE [Услуги]
(
	[ID услуги] INT IDENTITY PRIMARY KEY NOT NULL,
	[наименование] NVARCHAR(256)
) 

CREATE TABLE [Договора]
(
	[ID договора] INT PRIMARY KEY IDENTITY,
	[ID клиента • Договора]  INT FOREIGN KEY REFERENCES [Клиенты]([ID клиента]),
	[ID сотрудника • Договора] INT FOREIGN KEY REFERENCES [Сотрудники]([ID сотрудники]),
	[ID тура • Договора] INT FOREIGN KEY REFERENCES [Туры]([ID туры]),
	[дата начала тура] DATE NULL,
	[дата окончания тура] DATE NULL
)

CREATE TABLE [Договор услуга]
(
	[ID договора • Договор услуга] INT FOREIGN KEY REFERENCES [Договора]([ID договора]),
	[ID услуги • Договор услуга] INT FOREIGN KEY REFERENCES  [Услуги]([ID услуги])
)

CREATE TABLE [Профессия]
(
	[ID Профессия] INT IDENTITY PRIMARY KEY,
	[Профессия] NVARCHAR(256)
)

CREATE TABLE [Должности]
(
	[ID Должности] INT IDENTITY PRIMARY KEY NOT NULL,
	[Профессия • Должности] INT FOREIGN KEY REFERENCES [Профессия]([ID Профессия]),
	[Должность] NVARCHAR(256) 
)

CREATE TABLE [Квалификация]
(
	[ID Квалификация] INT IDENTITY PRIMARY KEY NOT NULL,
	[Наличие квалификации] NVARCHAR(50)
)

CREATE TABLE [Дополнительная инфа о клиенте]
(
	[ID клиента • Дополнительно] INT FOREIGN KEY REFERENCES 
	[Клиенты]([ID клиента]),
	[Профессия • Должность] INT FOREIGN KEY 
	REFERENCES [Должности]([ID Должности]),
	[Квалификация • Дополнительно] INT FOREIGN KEY 
	REFERENCES [Квалификация]([ID Квалификация]),
	[предполагаемый уровень доходов] MONEY,
	[Валюта • Дополнительно] INT FOREIGN KEY REFERENCES [Валюта]([ID валюты]),
	[Совершение путешествий] NVARCHAR(50) NULL,
	[Хобби] NVARCHAR(256) DEFAULT 'Собирание марок' NULL,
	[Интересы] NVARCHAR(256) DEFAULT 'Интерес к музыке' NULL
)

CREATE TABLE [Ваучер] 
(
	[ID ваучер] INT IDENTITY PRIMARY KEY,
	[ID клиента • Ваучер] INT 
	FOREIGN KEY REFERENCES [Клиенты]([ID клиента]),
	[Дата] DATE NOT NULL,
	[Направление • Ваучер] INT 
	FOREIGN KEY REFERENCES [Туры]([ID туры]),
	[Комментарий]  NVARCHAR(256) DEFAULT 'Оставьте комментарий',
)

CREATE TABLE [Виды рекламы]
(
	[ID виды рекламы] INT IDENTITY PRIMARY KEY,
	[Виды рекламы] NVARCHAR(256)
)

CREATE TABLE [Рекламный отдел] 
(
	[ID реклама] INT PRIMARY KEY IDENTITY,
	[Вид рекламы • Рекламный отдел] 
	INT FOREIGN KEY REFERENCES  [Виды рекламы]([ID виды рекламы]),
	[ID клиента • Рекламный отдел] INT FOREIGN KEY 
	REFERENCES [Клиенты]([ID клиента]),
	[Приблизительная время] DATE,
	[Комментарий]  NVARCHAR(256) DEFAULT 'Оставьте комментарий'
)


