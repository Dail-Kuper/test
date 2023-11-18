-- Кутявин Антон
-- Справочник сотрудников
DROP DATABASE IF EXISTS test_kutyavin;
CREATE DATABASE test_kutyavin;
USE test_kutyavin;

create table Employee (
  ID int not null primary key,
  Code varchar(10) not null unique,
  Name varchar(255)
);

insert into Employee (ID, Code, Name)
values (1, 'E01', 'Ivanov Ivan Ivanovich'),
  (2, 'E02', 'Petrov Petr Petrovich'),
  (3, 'E03', 'Sidorov Sidr Sidorovich'),
  (4, 'E04', 'Semenov Semen Semenovich'),
  -- Полный тёзка сотрудника E02
  (5, 'E05', 'Petrov Petr Petrovich');

-- Отпуска сотрудников
create table Vacation (
  ID int not null auto_increment primary key,
  ID_Employee int not null references Employee(ID),
  DateBegin date not null,
  DateEnd date not null
);

-- !Добавил еще 2 строки для самопроверки
insert into Vacation (ID_Employee, DateBegin, DateEnd)
values (1, '2019-08-10', '2019-09-01')
  ,(2, '2019-05-01', '2019-05-15')
  ,(1, '2019-12-29', '2020-01-14')
  ,(3, '2020-01-14', '2020-01-14')
  ,(4, '2021-02-01', '2021-02-14')
  ,(4, '2019-05-05', '2019-05-25')
  ,(2, '2020-01-05', '2020-01-20');