use [������������� �����]
go

delete from [��������� �����]

insert into [��������� �����]
([��� ������� � ��������� �����], [ID ������� � ��������� �����], [��������������� �����])
values
(1, 1, '2021-04-02'),
(2, 2, '2021-04-12'),
(2, 3, '2021-04-23'),
(3, 4, '2021-05-04'),
(6, 5, '2021-05-21'),
(1, 6, '2021-05-26'),
(5, 7, '2021-06-02'),
(5, 8, '2021-06-09'),
(6, 9, '2021-06-15'),
(2, 10, '2021-06-17'),
(3, 11, '2021-06-24'),
(3, 12, '2021-07-05'),
(2, 13, '2021-07-08'),
(2, 14, '2021-07-09'),
(2, 15, '2021-07-29'),
(4, 16, '2021-08-03'),
(5, 17, '2021-08-18'),
(4, 18, '2021-08-26'),
(6, 19, '2021-08-27'),
(2, 20, '2021-08-31'),
(1, 21, '2021-08-09')

select 
	[���� �������].[���� �������],
	[������������� ��������].[ID identity cards] as 'ID �������',
	�������, ���, [��������],  [����� ��������],
	[��������������� �����]--, �����������
from [��������� �����]
right join [���� �������] on
[���� �������].[ID ���� �������] = [��������� �����].[��� ������� � ��������� �����]
right join ������� on �������.[ID �������] = [��������� �����].[ID ������� � ��������� �����]
inner join [������������� ��������] on
[������������� ��������].[ID identity cards] = �������.[����� ��.��������]
 