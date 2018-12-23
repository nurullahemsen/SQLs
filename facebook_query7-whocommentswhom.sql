SELECT u1.fname, u1.lname, post.post_id, comment_content,u2.fname, u2.lname 
FROM fuser as u1, fuser as u2, post, fcomment
WHERE u1.creator_id = fcomment.creator_id AND fcomment.post_id = post.post_id AND post.creator_id = u2.creator_id