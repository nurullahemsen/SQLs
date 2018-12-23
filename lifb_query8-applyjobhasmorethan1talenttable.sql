SELECT applies.job_id,applies.user_id
FROM applies,talents
WHERE applies.user_id = talents.user_id
GROUP BY applies.user_id,applies.job_id
HAVING COUNT(talents.user_id) > 1
ORDER BY job_id ASC

				