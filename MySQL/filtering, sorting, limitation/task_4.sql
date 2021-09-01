-- (�� �������) �� ������� users ���������� ������� �������������, 
-- ���������� � ������� � ���. ������ ������ � ���� ������ ���������� �������� (may, august)


-- ������� ������� ������� ���� ������������ ��� ������� ������

drop table users_for_task_4 if exists

create table users_for_task_4 like users;
alter table users_for_task_4 modify birthday_at varchar(100);
-- ��������� ������� ������� ����� ������� ����� ������ ������������� ���������� � � ��� � �������
insert into users_for_task_4(name, birthday_at) values
('Vladislav Farsiyants', '21 september 1994'),
('Kostya Sivakozov', '10 july 1993'),
('Roman Radchenko', '24 july 1993'),
('Aksinia Farsiyants', '9 may 1991'),
('Vasya Pupkin', '18 august 1983');

-- ��������� ������� � ������� � �������������� ������� � ��������� rlike ��� �������� ������ ��������� ������ (august ��� may)
select*from users_for_task_4 uft 
where birthday_at rlike '.*august|may.*';