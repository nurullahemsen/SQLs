SELECT u.fname, u.lname, u2.fname, u2.lname
FROM fuser as u
LEFT OUTER JOIN fuser as u2 ON u.relationship_id = u2.user_id