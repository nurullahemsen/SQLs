create or replace function friendconditioncontrol() returns trigger as $$
begin
   IF NOT EXISTS (SELECT *  FROM lconnect where user1_id = new.sender_id and user2_id=new.receiver_id
	UNION
	SELECT * FROM lconnect where user1_id = new.receiver_id and user2_id=new.sender_id) THEN
    RAISE EXCEPTION 'Mesaj yollamak için arkadaş olmalısınız !';
	END IF;
	RETURN NEW;
    end;
$$ language plpgsql;

CREATE TRIGGER messagefriendcondition
  BEFORE INSERT ON message
  FOR EACH ROW 
  EXECUTE PROCEDURE friendconditioncontrol();
