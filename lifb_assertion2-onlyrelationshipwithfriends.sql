create or replace function rshfriendconditioncontrol() returns trigger as $$
begin
   IF NOT EXISTS (SELECT *  FROM friendship where user1_id = new.user_id and user2_id=new.relationship_id
	UNION
	SELECT * FROM friendship where user2_id = new.user_id and user1_id=new.relationship_id) AND new.relationship_id is not NULL THEN
    RAISE EXCEPTION 'Daha tanımıyorsun bile !';
	END IF;
	RETURN NEW;
    end;
$$ language plpgsql;

CREATE TRIGGER rshfriendcondition
  BEFORE UPDATE ON fuser
  FOR EACH ROW 
  EXECUTE PROCEDURE rshfriendconditioncontrol();
  
  