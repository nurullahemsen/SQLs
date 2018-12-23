SELECT u1.fname,u2.fname,user_relative.rtype
FROM fuser AS u1,fuser AS u2,user_relative  
WHERE EXISTS (SELECT user1_id WHERE user1_id = u1.user_id AND user2_id = u2.user_id
UNION
SELECT user2_id WHERE user2_id = u1.user_id AND user1_id = u2.user_id);