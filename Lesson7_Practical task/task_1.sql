-- ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������.

select id, name
from users u 
where id in (select distinct user_id from orders o);