SELECT applies.job_id,AVG(date_part('year',age(bdate)))
FROM fuser,applies
WHERE applies.user_id = fuser.user_id 		
GROUP BY applies.job_id
ORDER BY job_id ASC											  
								
				