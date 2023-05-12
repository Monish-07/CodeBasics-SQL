SELECT m.movie_id, m.title, m.industry,f.budget, f.revenue,
CASE
WHEN unit="thousands" THEN (revenue-budget)%1000
WHEN unit="billions" THEN (revenue-budget)*1000
ELSE (revenue-budget)
END as profit_in_million
from movies m
JOIN financials f ON m.movie_id=f.movie_id
WHERE m.industry="bollywood"
order by profit_in_million DESC;
