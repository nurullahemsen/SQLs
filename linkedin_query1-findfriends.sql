SELECT user2_id  FROM lconnect where user1_id = 3
UNION
SELECT user1_id FROM lconnect where user2_id = 3