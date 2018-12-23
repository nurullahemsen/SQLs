SELECT fname, lname, feed.post_id
FROM fuser, feed
WHERE NOT EXISTS(SELECT * FROM fcomment WHERE feed.post_id = fcomment.post_id AND feed.creator_id = fcomment.creator_id )
AND fuser.creator_id = feed.creator_id;
