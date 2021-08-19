/*�������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����. 
 * � 6:00 �� 12:00 ������� ������ ���������� ����� "������ ����", � 12:00 �� 18:00 ������� ������ ���������� ����� 
 * "������ ����", � 18:00 �� 00:00 � "������ �����", � 00:00 �� 6:00 � "������ ����". */


drop function if exists hello;
delimiter //


create function hello ()
returns text deterministic
begin
	if ((curtime() > '06:00:00') and (curtime() < '12:00:00')) then 
		return '������ ����';
	elseif ((curtime() > '12:00:00') and (curtime() < '18:00:00')) then
		return '������ ����';
	elseif ((curtime() > '18:00:00') and (curtime() < '24:00:00')) then
		return '������ �����';
	else
		return '������ ����';
	end if;
end//

delimiter ;

-- ������ ��� �������� ������ �������
select hello();