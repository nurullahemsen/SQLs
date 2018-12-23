SELECT user_id, fname, lname
FROM fuser
WHERE date_part('year',age(bdate)) > ALL (SELECT date_part('year',age(bdate))
										  FROM fuser
										  WHERE gender = 'f')
	AND gender = 'm';
