create or replace function addnotification() returns trigger as $$
begin
    INSERT INTO public.notification(
	ndate, is_seen, user_id,notification_content)
	VALUES (new.mdate,false,new.receiver_id,'new message!');
	RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER addmessage
  AFTER INSERT ON message
  FOR EACH ROW
  EXECUTE PROCEDURE addnotification();