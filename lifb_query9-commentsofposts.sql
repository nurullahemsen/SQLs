SELECT post.post_id,comment_content
FROM fcomment,post
WHERE fcomment.post_id = post.post_id