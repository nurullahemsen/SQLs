create or replace function addrelationship() returns trigger as $$
begin
    IF(old.relationship_id is null) THEN
    UPDATE public.fuser
	SET relationship_id=new.user_id
	WHERE user_id=new.relationship_id;	
	END IF;
	RETURN NEW;
end;
$$ language plpgsql;


CREATE TRIGGER addrlsh
  AFTER UPDATE ON fuser
  FOR EACH ROW
  EXECUTE PROCEDURE addrelationship();