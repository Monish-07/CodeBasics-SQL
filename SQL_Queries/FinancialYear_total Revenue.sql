SELECT  get_fiscal_year(fsm.date) Financial_year,
		fsm.product_code, fsm.sold_quantity, 
        fgp.gross_price, 
        round(sum(fgp.gross_price*fsm.sold_quantity),2) Total_Price
FROM fact_sales_monthly fsm
JOIN fact_gross_price fgp
	ON fsm.product_code=fgp.product_code
		AND fgp.fiscal_year=get_fiscal_year(fsm.date)
WHERE fsm.customer_code=90002002
	GROUP BY get_fiscal_year(fsm.date)
	ORDER BY Financial_year;









-- SELECT fsm.product_code, fsm.sold_quantity, fgp.fiscal_year, fgp.gross_price,(fsm.sold_quantity*fgp.gross_price) as total_gross
-- FROM fact_sales_monthly fsm
-- JOIN fact_gross_price fgp
-- ON fsm.product_code=fgp.product_code
-- WHERE customer_code=90002002
-- ORDER BY fiscal_year;
