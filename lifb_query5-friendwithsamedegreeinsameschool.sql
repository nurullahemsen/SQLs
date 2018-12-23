SELECT e2.school_name,u1.fname,u2.fname
FROM education as e1,education as e2,fuser as u1,fuser as u2
WHERE EXISTS(SELECT user2_id  FROM friendship where user1_id = u1.user_id and user2_id = u2.user_id)AND e1.user_id = u1.user_id AND e2.user_id = u2.user_id
AND e1.school_name=e2.school_name AND e1.edegree=e2.edegree;