create or replace function groupwithoutmember() returns trigger as $$
begin
	DELETE FROM fgroup
      WHERE
  		NOT EXISTS(SELECT group_id FROM member_of WHERE member_of.group_id=fgroup.group_id );
		RETURN NULL;
end;
$$ language plpgsql;

CREATE TRIGGER deletepage
  AFTER DELETE ON member_of
  FOR EACH ROW 
  EXECUTE PROCEDURE groupwithoutmember();
  
  