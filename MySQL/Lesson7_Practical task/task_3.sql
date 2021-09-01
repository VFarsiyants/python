-- (�� �������) ����� ������� ������� ������ flights (id, from, to) � ������� ������� cities (label, name). 
-- ���� from, to � label �������� ���������� �������� �������, ���� name � �������. �������� ������ ������ 
-- flights � �������� ���������� �������.

-- ������� �� ��� ���������� �������
drop table if exists lesson_7_pz;
create database lesson_7_pz;
-- ������� ������� �������� �������
drop table if exists flights;
create table flights(
id serial primary key,
`from` varchar(100),
`to` varchar(100)
);

drop table if exists cities;
create table cities(
label varchar(100),
name varchar(100)
);
-- ��������� ������� �������
insert into flights(`from`, `to`) values
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

insert into cities(label, name) values
('moscow', '������'),
('irkutsk', '�������'),
('novgorod', '��������'),
('kazan', '������'),
('omsk', '����');
-- ����� ��� ������, ��� ����� ����� �������� ������� ��� ����
select from_c.name, to_c.name from flights f
join cities to_c 
-- ������ ��������� ��� ���������� ����������� ����
on f.`to` = to_c.label
join cities from_c
-- ������ ��������� ��� ���������� ����������� ������
on f.`from` = from_c.label;

