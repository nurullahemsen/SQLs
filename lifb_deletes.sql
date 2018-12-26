DELETE FROM public.post
	WHERE post.creator_id = 2;

DELETE FROM f_event USING page 
  WHERE f_event.creator_id = page.creator_id;
 
DELETE FROM likes_page USING fuser
  WHERE likes_page.page_id = 1 AND likes_page.user_id = fuser.user_id AND fuser.relationship_id is NULL;