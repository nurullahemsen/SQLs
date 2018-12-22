SELECT
 job_ad.job_id,post.creator_id,post_likes.like_type,
COUNT (post_likes.like_type)
FROM
 post_likes,post,fuser,applies,job_ad
WHERE post.post_id = post_likes.post_id AND post.creator_id = fuser.creator_id AND applies.user_id = fuser.user_id AND applies.job_id =job_ad.job_id
GROUP BY
  job_ad.job_id,post.creator_id,post_likes.like_type  
HAVING post_likes.like_type =1 or post_likes.like_type =2
ORDER BY
  job_id ASC;

