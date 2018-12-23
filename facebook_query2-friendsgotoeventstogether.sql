SELECT u1.fname,u2.fname,a.event_id
FROM join_event as a,join_event as b,fuser as u1,fuser as u2
WHERE 
a.event_id = b.event_id AND
EXISTS (SELECT user1_id FROM friendship WHERE user1_id = b.user_id AND user2_id = a.user_id) AND a.user_id =u1.user_id AND b.user_id = u2.user_id
ORDER BY event_id ASC,a.user_id ASC;
