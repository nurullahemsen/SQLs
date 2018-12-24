SELECT e2.company_name,u1.fname,u2.fname
FROM experience as e1,experience as e2,luser as u1,luser as u2
WHERE EXISTS(SELECT user2_id  FROM lconnect where user1_id = u1.user_id and user2_id = u2.user_id)AND e1.user_id = u1.user_id AND e2.user_id = u2.user_id
AND e1.company_name=e2.company_name;