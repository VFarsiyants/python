-- �������� ������ ������� products � �������� catalogs, ������� ������������� ������.

select p.name, c.name from products p 
join catalogs c 
on p.catalog_id = c.id 
