SELECT newTable.user_id, newTable.fname, newTable.lname, pname
FROM (SELECT fuser.user_id, fname, lname, page_id
		FROM fuser
		FULL OUTER JOIN pmanage ON pmanage.user_id = fuser.user_id) as newTable,
		page
WHERE newTable.page_id = page.page_id
ORDER BY user_id ASC