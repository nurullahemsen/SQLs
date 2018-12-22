SELECT applies.job_id,j.fname,e.fname 
FROM applies,job_ad,luser AS e,luser AS j  
WHERE EXISTS (SELECT user1_id FROM lconnect WHERE user1_id = applies.user_id AND user2_id = job_ad.user_id
UNION
SELECT user2_id FROM lconnect WHERE user2_id = applies.user_id AND user1_id = job_ad.user_id) 
AND e.user_id = applies.user_id AND j.user_id = job_ad.user_id AND job_ad.job_id = applies.job_id;
