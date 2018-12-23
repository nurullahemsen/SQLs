SELECT user_id, fname, lname, date_part('year',age(bdate)) as age
FROM fuser
ORDER BY age ASC 