SELECT fname, lname,e1.company_name,date_part('year',age(bdate)) as age,school_name
FROM luser,experience as e1 LEFT JOIN education ON education.user_id=e1.user_id
WHERE date_part('year',age(bdate)) <= ALL (SELECT date_part('year',age(bdate))
										  FROM luser,experience as e2 
										  WHERE e2.user_id=luser.user_id AND e2.company_name=e1.company_name) 
AND luser.user_id=e1.user_id
GROUP BY e1.company_name,fname,lname,age,school_name;
