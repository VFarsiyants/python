-- ����� 10 �������������, ������� ��������� ���������� ���������� � ������������� ���������� ����.


-- ������ ������� ��� ������������ ���� �� ���� ��� ����������� �����-������� ��� �������
-- ������ ���������� ������������ ����� ������� ������ ������ ����� ���������, �����-��������, ������ ������������, ������� � �����������, 
-- �������� � ������� � �����������, �������� �������� �� ������, ����� ���������� ��� ������� � ���������� �� �������������
-- ������ ���-�� ����� ���������� �� ����, ������� ��� ������������ �������� ���������, ������ �����, �������� ������� � ��

select firstname, lastname from users
where id in (select user_id from (
									select count(*) activity, user_id from (
															select admin_user user_id from communities c
															union all
															select initiator_user_id user_id from friend_requests fr 
															union all
															select user_id from media m 
															union all
															select from_user_id user_id from messages m
															union all
															select user_id from likes
															union all
															select user_id from users_comunities uc
														) as activity_index
									group by user_id
									order by activity
									limit 10) as ten_users_with_smalest_activity)
									
-- ������� �� ��������� ������������� � ������� ������ ��� ������� ���������, ���� � �.�., �.� � 0�� �����������