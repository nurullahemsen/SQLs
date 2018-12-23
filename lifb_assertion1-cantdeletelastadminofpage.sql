create or replace function dontdeletelastadmin() returns trigger as $$
begin
	IF NOT EXISTS(SELECT page_id FROM pmanage WHERE pmanage.page_id=old.page_id ) 
	THEN
		RAISE EXCEPTION 'hata yaptın';
	END IF;
		RETURN NULL;
end;
$$ language plpgsql;

CREATE TRIGGER dontdeleteadmin
  AFTER DELETE ON pmanage
  FOR EACH ROW 
  EXECUTE PROCEDURE dontdeletelastadmin();
  
