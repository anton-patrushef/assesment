-- task 2
select employee_name, rating
from (
	select 
		employee_name, 
		monthly_result, 
		ROW_NUMBER () over (order by monthly_result desc) as rating
	from test_monthly_results) T1
where rating = 4


-- task 1
select month_name, income
from (
	select 
		month_name, income, 
		id, 
		LAG(income) OVER(ORDER BY id asc) previous_value
	from test_monthly_profit
	order by id asc
) T1
where income - previous_value < 0