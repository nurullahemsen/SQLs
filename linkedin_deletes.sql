DELETE FROM applies 
WHERE  NOT applies.user_id IN (SELECT user_id FROM education);

DELETE FROM luser
WHERE date_part('year',age(bdate)) > 30;

DELETE FROM notification
WHERE is_seen='false';						   