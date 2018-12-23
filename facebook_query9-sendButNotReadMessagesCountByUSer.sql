SELECT sender_id, COUNT(*)
FROM message 
GROUP BY sender_id, is_read
HAVING is_read = false
ORDER BY sender_id ASC;