 SELECT id Id
 FROM(
    SELECT *,
    LAG(temperature,1) OVER(ORDER BY recordDate) as PreviousTemp,
    LAG(recordDate,1) OVER(ORDER BY recordDate) as PreviousDay
    FROM Weather
)T
 WHERE temperature > PreviousTemp
 AND DATEDIFF(day,PreviousDay,recordDate) = 1 ;