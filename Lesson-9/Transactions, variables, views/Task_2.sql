-- �������� �������������, ������� ������� �������� name �������� ������� �� 
-- ������� products � ��������������� �������� �������� name �� ������� catalogs.


use shop;

create view name_catalog as 
select p.name product_name, c.name catalog_name from products p 
join catalogs c on c.id = p.catalog_id;

select*from name_catalog;
