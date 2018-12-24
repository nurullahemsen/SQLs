SELECT e2.company_name,u1.fname,u2.fname,edu2.school_name
FROM experience as e1,experience as e2,luser as u1,luser as u2,education as edu1,education as edu2
WHERE EXISTS(SELECT user2_id  
			 FROM lconnect 
			 WHERE user1_id = u1.user_id AND user2_id = u2.user_id)AND e1.user_id = u1.user_id AND e2.user_id = u2.user_id AND  e1.user_id=edu1.user_id 
AND e2.user_id=edu2.user_id
AND e1.company_name=e2.company_name AND edu1.school_name=edu2.school_name;