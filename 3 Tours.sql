use [C:\������ ���� ������\����\�������������_�����.MDF]
go

insert into ����
(������������, [������ � ����], ����, [������ � ����], [������������ ����])
values
('����� �� ���� �� ������� ������ ���!', 152, 190667, 1, '2021-01-01'),
('�������� �� ������. ������� ���� �� �����', 128, 438577, 1, '2021-01-01'),
('����� ��� �� ����! ���� �����������', 73, 361966, 1, '2021-01-01'),
('��� �� ������. ������� ����', 152, 108891, 1, '2021-01-01'),
('������� �� 7 ���� - ��������� 10 � RIXOS SHARM!', 73, 250460, 1, '2021-01-01'),
('��� �� ���-������� (������). ������� ����', 152, 326120, 1, '2021-01-01'),
('�������� �� ���� �������� - ������ ������!', 128, 486000, 1, '2021-01-01'),
('ALL INCLUSIVE ������� �� ��������� �� ������!', 128, 45000, 2, '2021-01-01'),--���
('���-���� ��� ������� ����� � ����� �� ������!', 73, 2500, 3, '2021-01-01'),--����
('����� � ����������� ���������� �� ������ ����', 152, 564687, 1, '2021-01-01'),
('����� � ������ ����� ������, ����� � Marina Mall �� �������!', 152, 4500, 3, '2021-01-01'),--
('�������� ���� � ������ � ����� Iberotel Palace 5* �� ������!', 73, 65400, 2, '2021-01-01'),
('����� �������� ���������� ��� � ������ � ����� REEF', 73, 365400, 1, '2021-01-01'),
('��� ����������� ������ ����� ����� �� �����! ����� DAY&NIGHT', 73, 21360, 2, '2021-01-01'),
('���������� ����� � �����, ����� TROPITEL WAVES!', 73, 4100, 3, '2021-01-01'),
('������ ��� � ������ ���� ��� �����!', 73, 256400, 1, '2021-01-01'),
('RIXOS HOTELS 5* � ������ � ������� �� ������!', 73, 657240, 1, '2021-01-01'),
('���� ������ Albatros Hotels � ������ ����� ������!', 73, 241540, 1, '2021-01-01'),
('��� ������ ����� �� �������� �� ������!', 128, 4230, 3, '2021-01-01'),
('����� - ���� �� 12�� ��� ����� ��������� � ������ BARON RESORTS', 73, 12450, 2, '2021-01-01'),
('��� 10 ������ � ������� ������� � ������!', 73, 532140, 1, '2021-01-01'),
('����� ��� � ��� �� ������!', 152, 420320, 1, '2021-01-01'),
('������ ��� �������� � ��� � ����� RIXOS THE PALM', 152, 50400, 2, '2021-01-01'),
('������ �� ���-������� (������). ������� ���� �� �����', 215, 36540, 2, '2021-01-01'),
('������ �� ���-������� (������). ������� ���� �� �����', 73, 12500, 2, '2021-01-01'),
('������� ��� � ������, ����� � ������ �������� ������!', 73, 465752, 1, '2021-01-01'),
('�������� ����� �� ������ �� ���������!', 128, 987542, 1, '2021-01-01'),
('LAND OF LEGENDS � ������ ������� �� 40%', 215, 465325, 1, '2021-01-01'),
('������ � ��������! ����� �� �����!', 215, 784623, 1, '2021-01-01'),
('���� ������� ��� ������ - HABTOOR GRAND RESORT!', 152, 5230, 3, '2021-01-01')

select [ID ����], ������������ as '�������� �����',
[������ (�� ISO 3166)].������, ���� as '����',
������.������, [������������ ����] as '������������ ����',
(DATEADD(WEEK, 2 , [������������ ����])) as '��',  --2 ������ � �������
DATEDIFF(DAY, CAST([������������ ����] AS date), 
CAST(DATEADD(WEEK, 2 , [������������ ����]) AS date)) AS '����' -- ���������
from ����
right join [������ (�� ISO 3166)] on 
����.[������ � ����] = [������ (�� ISO 3166)].[ID ������]
right join ������ on
������.[ID ������] = ����.[������ � ����]
where ������������ like '%�����%'