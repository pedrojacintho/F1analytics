-- Consistência por piloto
SELECT 
    driver_name, 
    podiums, 
    DNFs, 
    ROUND(Podiums / NULLIF(DNFs, 0), 2) AS Podiums_per_DNF
FROM f1
WHERE DNFs > 0
ORDER BY Podiums_per_DNF DESC

-- Comparativo entre os construtores

SELECT 
    Constructor, 
    SUM(points) AS total_points, 
    SUM(wins) AS total_wins, 
    COUNT(DISTINCT driver_code) AS drivers
FROM f1
GROUP BY Constructor
ORDER BY Total_Points DESC

-- Identificação de Anomalias

SELECT 
    driver_name, 
    points, 
    wins, 
    pole_positions, 
    no_of_fast_laps
FROM f1
WHERE (Points < 100 AND Wins > 0) 
    OR (pole_positions > 5 AND Wins < 2)
ORDER BY Points


-- Pilotos com maior número de vitórias

SELECT 
	driver_Name,
	wins
FROM f1
ORDER BY Wins DESC
LIMIT 5

-- Média de DNFs por equipe

SELECT 
	Constructor, 
	AVG(DNFs) AS Avg_DNFs
FROM F1
GROUP BY Constructor
ORDER BY Avg_DNFs DESC

-- Correlação entre Poles e Vitórias

SELECT 
	driver_name,
	pole_positions,
	wins
FROM f1
ORDER BY Wins DESC






