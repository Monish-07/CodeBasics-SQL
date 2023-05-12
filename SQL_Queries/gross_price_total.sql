WITH cte1 
AS(
    SELECT 
		fsm.date, 
		fsm.fiscal_year, 
		fsm.customer_code, 
		dc.customer, 
		dc.market, 
		fsm.product_code, 
		dp.product, 
		dp.variant,
		fsm.sold_quantity,
		fgp.gross_price 
	FROM fact_sales_monthly fsm
	join dim_customer dc
	on fsm.customer_code = dc.customer_code
	join dim_product dp
	on fsm.product_code = dp.product_code
	join fact_gross_price fgp
	on fsm.product_code = fgp.product_code
	and fsm.fiscal_year = fgp.fiscal_year
    )
select *, (sold_quantity * gross_price) as gross_price_total
from cte1;