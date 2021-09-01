-- ����� ����� ��������� ������������. 
-- �� ���� ������ ����� ������������ ������� ��������, 
-- ������� ������ ���� ������� � ����� �������������.


set @user_id = 422;

select firstname, lastname from users u 
where id in (select with_who_chated from
							(select count(*) as how_many_times_chated, from_user_id as with_who_chated
							from 
							(
							-- ���������� ��������� ������ ������������ �� ��� ������
							select id, from_user_id, to_user_id from messages m 
							where from_user_id in ((	
														-- ����� ���������� ������������� ������ � �������� ����������� ��� ������������
														select target_user_id from friend_requests fr 
														where initiator_user_id = @user_id and status = 'aproved')
														union
													(	
														-- ���������� � �������� ������������� ������� ����������� ������ � ����� �������������
														select initiator_user_id from friend_requests fr 
														where target_user_id = @user_id and status = 'aproved')) and to_user_id = @user_id
							-- ����������� �� ����� ����������� (��� �������� ����������) �� ������������ �������
							union all
							-- ���������� ��������� ������������ �� ������ ������ ������������, ���������� ������ ������� ������� ��� �� ����� ��������� �������������
							select id, to_user_id, from_user_id from messages m 
							where to_user_id in ((	
													-- ����� ���������� ������������� ������ � �������� ����������� ��� ������������
													select target_user_id from friend_requests fr 
													where initiator_user_id = @user_id and status = 'aproved')
													union
												(	
													-- ���������� � �������� ������������� ������� ����������� ������ � ����� �������������
													select initiator_user_id from friend_requests fr 
													where target_user_id = @user_id and status = 'aproved')) and from_user_id = @user_id) as messages
							group by with_who_chated
							order by with_who_chated desc 
							limit 1) as top_chated_user);