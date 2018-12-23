create or replace function addcreator() returns trigger as $$
begin
    insert into creator values (default);
	new.creator_id=creator_id from creator WHERE creator_id=(select max(creator_id) from creator);
	RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER adduser
  BEFORE INSERT ON fuser
  FOR EACH ROW
  EXECUTE PROCEDURE addcreator();
  
CREATE TRIGGER addpage
  BEFORE INSERT ON page
  FOR EACH ROW
  EXECUTE PROCEDURE addcreator();
