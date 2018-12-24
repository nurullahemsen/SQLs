SELECT allConnections.user1_id, fname, lname, COUNT(*)
FROM (SELECT user1_id, user2_id FROM lconnect
	 UNION
	 SELECT user2_id, user1_id FROM lconnect) as allConnections, luser
WHERE user_id = allConnections.user1_id
GROUP BY allConnections.user1_id, fname, lname
HAVING COUNT(*) > 3
ORDER BY allConnections.user1_id ASC;