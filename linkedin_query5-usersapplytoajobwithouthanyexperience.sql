SELECT
 luser.fname,
 luser.lname
FROM
 luser,applies
WHERE NOT EXISTS(SELECT * FROM experience WHERE luser.user_id=experience.user_id) 
AND applies.user_id=luser.user_id;

 