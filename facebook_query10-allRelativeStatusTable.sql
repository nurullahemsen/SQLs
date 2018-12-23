SELECT u1.fname, u1.lname, allTable.rtype, u2.fname, u2.lname
FROM (SELECT user2_id, user1_id, rtype  FROM user_relative
UNION
SELECT user1_id, user2_id, rtype  FROM user_relative) as allTable, fuser as u1, fuser as u2
WHERE allTable.user2_id = u1.user_id AND allTable.user1_id = u2.user_id

