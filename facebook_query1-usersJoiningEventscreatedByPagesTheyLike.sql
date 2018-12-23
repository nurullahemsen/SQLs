SELECT fuser.user_id, fname, lname, pname, event_name
FROM fuser, page, f_event, likes_page,join_event
WHERE fuser.user_id = likes_page.user_id AND likes_page.page_id = page.page_id 
	AND page.creator_id = f_event.creator_id AND fuser.user_id = join_event.user_id AND join_event.event_id = f_event.event_id;
	