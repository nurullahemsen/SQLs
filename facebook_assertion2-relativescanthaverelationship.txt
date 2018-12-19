create or replace function rshconditioncontrol() returns trigger as $$
begin
   IF EXISTS (SELECT * from user_relative where new.user_id = user1_id and new.relationship_id=user2_id) THEN
    RAISE EXCEPTION 'Orda dur !';
	END IF;
	RETURN NEW;
    end;
$$ language plpgsql;

CREATE TRIGGER rshcondition
  BEFORE UPDATE ON fuser
  FOR EACH ROW 
  EXECUTE PROCEDURE rshconditioncontrol();
  
  