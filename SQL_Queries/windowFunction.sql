-- show % of total expense

select *,amount*100/sum(amount) over() as pct
from random_tables.expenses 
order by category;


-- show % of total expense per category

select *, amount*100/sum(amount) over(partition by category) as pct
from random_tables.expenses 
order by category,  pct desc;


-- Show expenses per category till date
-- Cummulative
select *, sum(amount) over(partition by category order by date) as expenses_till_date
from random_tables.expenses;
