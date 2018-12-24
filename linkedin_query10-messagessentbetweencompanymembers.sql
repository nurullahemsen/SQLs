SELECT message_content,u1.fname as sender_name,u2.fname as receiver_name
FROM message,experience as e1,experience as e2,luser as u1,luser as u2
WHERE message.sender_id=u1.user_id AND message.receiver_id=u2.user_id AND e1.user_id=u1.user_id AND e2.user_id=u2.user_id AND e1.company_name=e2.company_name;