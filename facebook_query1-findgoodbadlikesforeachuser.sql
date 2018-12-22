SELECT
 post.creator_id,post_likes.like_type,
COUNT (post_likes.like_type)
FROM
 post_likes,post,fuser
WHERE post.post_id = post_likes.post_id AND post.creator_id = fuser.creator_id
GROUP BY
  post.creator_id,post_likes.like_type
HAVING post_likes.like_type =1 or post_likes.like_type =2;