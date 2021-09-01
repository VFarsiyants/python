/* �������� ������� logs ���� Archive. ����� ��� ������ �������� ������ � �������� users, 
 *catalogs � products � ������� logs ���������� ����� � ���� �������� ������, 
 *�������� �������, ������������� ���������� ����� � ���������� ���� name. */


use shop;

drop table if exists logs;
create table logs(
record varchar(255)
) comment '������� ��� �����������' engine=archive;


drop trigger if exists arhcive_users;
drop trigger if exists arhcive_catalogs;
drop trigger if exists arhcive_products;

-- ������� �������� ��� �� ��� ������ ������� � ������� ���������� ��������������� ������ � ����

delimiter //
create trigger arhcive_users before insert on users
for each row
begin
	declare user_id bigint;
	select count(*) + 1 into user_id from users;
	insert into logs values 
	(concat('����� ��������: ', now(),'; users; pk_id: ', new.id, '; ���������� name: ', new.name));
end//
create trigger arhcive_catalogs before insert on catalogs
for each row
begin
	insert into logs values 
	(concat('����� ��������: ', now(),'; catalogs; pk_id: ', new.id, '; ���������� name: ', new.name));
end//
create trigger arhcive_products before insert on products
for each row
begin
	insert into logs values 
	(concat('����� ��������: ', now(),'; products; pk_id: ', new.id, '; ���������� name: ', new.name));
end//
delimiter ;


-- ��������� �������� ����� ������ � �������
insert into catalogs values (10, '����� �������');
insert into users(id, name) values (7, '����');
insert into products(id, name) values (8, '���� ����');
