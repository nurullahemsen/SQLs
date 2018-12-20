create or replace function messagenotificationcondition() returns trigger as $$
begin
    IF NOT EXISTS (SELECT * FROM message,notification WHERE creator_id = new.receiver_id AND notification_content = 'new message!' AND is_seen = false AND message.sender_id=
				  new.sender_id AND message.receiver_id=new.receiver_id ) THEN
		INSERT INTO public.notification(
		ndate, is_seen, creator_id,notification_content)
		VALUES (new.mdate,false,new.receiver_id,'new message!');
	ELSE
	RAISE NOTICE 'bu kişiden gelen mesaj için okunmamış bildirim zaten mevcut,yeni bildirim yaratılmadı';
	END IF;
	RETURN NEW;
end;
$$ language plpgsql;

DROP TRIGGER addmessage ON message;

CREATE TRIGGER messagenotification
  BEFORE INSERT ON message
  FOR EACH ROW
  EXECUTE PROCEDURE messagenotificationcondition()
  
  