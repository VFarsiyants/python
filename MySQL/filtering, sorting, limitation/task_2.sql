-- ������� users ���� �������� ��������������. ������ created_at � updated_at ���� ������ 
-- ����� VARCHAR � � ��� ������ ����� ���������� �������� � ������� 20.10.2017 8:10. 
-- ���������� ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.

-- � ����������� ������� ��� ������ ������, ������� ���������� �� ��������������.
-- ��� ������ ������� ��������� ������� users � users_for_task ��� ��� ��� ����� �������� �������
drop table users_for_task if exists;
create table users_for_task like users;
-- �������� ���� ����� created_at, updated_at ��� ����� �������� ������
alter table users_for_task modify created_at varchar(100);
alter table users_for_task modify updated_at varchar(100);
-- ��������� ������� ������� �� ������� ���������� � ��
insert into users_for_task (name, birthday_at, created_at, updated_at) values 
('Vladislav Farsiyants', '1994-09-21', '04.08.2021 10:45', '04.08.2021 10:45'),
('Konstantin Sivakozov', '1993-07-10', '04.08.2021 9:45', '04.08.2021 9:45'),
('Roman Radchenko', '1993-08-24', '03.08.2021 21:45', '03.08.2021 21:45');
-- ������� ����� ������� ������ ������������������ � ����������� ������
drop table user_correct if exists;
create table users_correct like users_for_task;
alter table users_correct modify created_at datetime;
alter table users_correct modify updated_at datetime;

-- ��������� � ����� ������� �������� �� ���������� ��������� ������� STR_TO_DATE ��� ����������� �� ������ � ������ datetime
insert into users_correct (id, name, birthday_at, created_at, updated_at) 
select id, name, birthday_at, STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i') from users_for_task;

-- ������� ������� users_for_task � ��������������� ������������������ ������� � ��������.
drop table users_for_task;
rename table users_correct to users_for_task;