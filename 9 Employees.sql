use [������������� �����]
go

insert into ����������([��� � ����������],[����� ��������])
values
(823191,87025554125),
(939178,87016543212),
(950155,87024578251),
(979808,87071235645),
(993107,87025263124)

select 
	��� as '��� ����������', �������, ���, ��������,
	���.���, [���� ��������], [����� ��������] 
from ����������
inner join [������������� ��������] on
[������������� ��������].[ID identity cards] = ����������.[��� � ����������]
right join ��� on
���.[ID ���] = [������������� ��������].[��� � ������������� ��������]
