SELECT COUNT(p2.page_id),fuser.user_id
FROM fuser,likes_page as p1,likes_page as p2
WHERE (p1.user_id=fuser.user_id AND p2.user_id=fuser.relationship_id) AND p1.page_id=p2.page_id
GROUP BY fuser.user_id;