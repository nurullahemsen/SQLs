SELECT fname,lname
FROM fuser
WHERE date_part('year',age(bdate))::text LIKE '2_';