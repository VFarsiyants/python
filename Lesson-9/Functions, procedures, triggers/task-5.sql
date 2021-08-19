/*(�� �������) ����� ������� ����� ������� � ����������� ����� created_at. �������� ������, 
 * ������� ������� ���������� ������ �� �������, �������� ������ 5 ����� ������ �������. */


-- ������� ������� ������� ����� ��������� � �������� �������� � ��������� �� �������
use vk;
drop table if exists profiles_for_dz;
create table profiles_for_dz(
	user_id bigint unsigned,
	gender char(1),
	birthday date,
	photo_id bigint unsigned,
	created_at datetime,
	hometown varchar(100)
);

insert into profiles_for_dz select*from profiles;

-- ������ �������� � �������� profiles_for_dz

start transaction;
create table profiles_tmp(
	user_id bigint unsigned,
	gender char(1),
	birthday date,
	photo_id bigint unsigned,
	created_at datetime,
	hometown varchar(100)
	);

insert into profiles_tmp (select*from profiles_for_dz order by created_at desc limit 5);
truncate table profiles_for_dz;
insert into profiles_for_dz select*from profiles_tmp;
drop table profiles_tmp;
commit;


