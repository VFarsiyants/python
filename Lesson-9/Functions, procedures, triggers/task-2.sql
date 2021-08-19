/*� ������� products ���� ��� ��������� ����: name � ��������� ������ � description � ��� ���������. 
 * ��������� ����������� ����� ����� ��� ���� �� ���. ��������, ����� ��� ���� ��������� ��������������
 *�������� NULL �����������. ��������� ��������, ��������� ����, ����� ���� �� ���� ����� ��� ��� ����
 *���� ���������. ��� ������� ��������� ����� NULL-�������� ���������� �������� ��������. */ 

drop trigger if exists products_check
delimiter //
create trigger products_check before insert on products
for each row begin
	if ((new.name is null) and (new.description is null)) then
		signal sqlstate '45000' set MESSAGE_TEXT = 'INSERT canceled';
	end if;
end //
delimiter ;

insert into products(name, description) values (null, null);