create or replace function deletepagewithoutadmin() returns trigger as $$
begin
	DELETE FROM page
      WHERE
  		NOT EXISTS(SELECT page_id FROM pmanage WHERE pmanage.page_id=page.page_id );
		RETURN NULL;
end;
$$ language plpgsql;

CREATE TRIGGER deletepage
  AFTER DELETE ON pmanage
  FOR EACH ROW 
  EXECUTE PROCEDURE deletepagewithoutadmin();
  
  