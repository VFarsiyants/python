-- ����������� ���������� ���� ��������, ������� ���������� �� ������ �� ���� ������. 
-- ������� ������, ��� ���������� ��� ������ �������� ����, � �� ���� ��������.

select count(*), dayname(concat(year(now()), substring(birthday_at, 5))) as dayname_in_current_year  from users
group by dayname_in_current_year;