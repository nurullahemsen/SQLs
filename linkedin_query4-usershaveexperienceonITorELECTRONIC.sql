SELECT
 luser.fname,
 luser.lname,
 experience.company_name,
 experience.sector
FROM
 experience,luser
WHERE
 experience.sector IN ('IT','ELECTRONIC') AND experience.user_id=luser.user_id;

 