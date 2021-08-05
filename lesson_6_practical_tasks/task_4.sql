-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

select concat('������ ����� ������ ���������', ' ', gender) result
from (
		-- ���������� ������� ������ ��������� �������
		select count(*) given_likes, '�������' gender from likes l 
		where user_id in (	select user_id 
							from profiles p 
							where gender = 'M')
		union	-- ��������� ��������� � ������ ������ ������
		-- ���������� ������� ������ ��������� �������
		select count(*) given_likes, '�������' gender from likes l 
		where user_id in (	select user_id 
							from profiles p 
							where gender = 'F')
		order by given_likes desc -- ��������� �� �������� ����� ������� ��������
		limit 1) as likes_gender