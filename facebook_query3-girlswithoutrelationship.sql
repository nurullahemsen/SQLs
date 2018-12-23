SELECT fname, lname
FROM fuser
WHERE user_id IN (SELECT user_id
FROM fuser
WHERE relationship_id IS NULL) AND
gender = 'f';