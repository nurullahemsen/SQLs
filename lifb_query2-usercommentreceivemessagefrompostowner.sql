SELECT u1.fname,u2.fname
FROM fcomment,post,message,fuser AS u1,fuser AS u2
WHERE fcomment.post_id=post.post_id AND message.receiver_id=fcomment.creator_id AND message.sender_id=post.creator_id
AND u2.user_id= message.receiver_id AND u1.user_id=message.sender_id;