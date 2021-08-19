/* �� �������) ����� ������� ������� � ����������� ����� created_at. � ��� ��������� ���������� 
 * ����������� ������ �� ������ 2018 ���� '2018-08-01', '2016-08-04', '2018-08-16' � 2018-08-17. 
 * ��������� ������, ������� ������� ������ ������ ��� �� ������, ��������� � �������� ���� �������� 1, 
 * ���� ���� ������������ � �������� ������� � 0, ���� ��� �����������. */

-- ������� ����� ������� �� ������� ���� vk ��� � ��� ���� ������� profiles � ����� ����� ������

use vk;
drop procedure if exists august_2018_dates;

delimiter //
create procedure august_2018_dates (in `year_month` varchar(100))
begin
	declare i int default 1;
	declare x int;
	declare `date` date;
	drop table if exists august_dates_temp;
	create table august_dates_temp (
	day_date date,
	day_presence bool
	);
	while i < 32 do
		set `date` = concat(`year_month`, '-' , i);
		if ((select count(*) from profiles p where date(created_at) = `date`) > 0) then 
			set x = (select count(*) from profiles p where date(created_at) = `date`);
		else
			set x = 0;
		end if;
		insert into august_dates_temp values
			(`date`, x);
		set i = i + 1;
	end while;
	select*from august_dates_temp;
	drop table august_dates_temp;
end//
delimiter ;

call august_2018_dates('2018-08');

call august_2018_dates('1991-08');
drop procedure august_2018_dates;