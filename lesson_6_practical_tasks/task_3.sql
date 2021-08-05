-- ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

-- ���������� ����� ������������� ����� 10�� ����� ���� �������������
select count(*) likes_received from likes l 
where media_id in (	-- ���������� media ������������� ����� ���� �������������
					select id from media m 
					where user_id in 	(	-- mysql �� ��������� ������������ limit � ���������� ������� ����� �������� �����������
											select user_id from (	-- ���������� ����� ������� �������������
																select user_id 
																from profiles p 
																order by timestampdiff(year, birthday, now())
																limit 10) as youngest_users))