create or replace function addAdminAsMember() returns trigger as $$
begin
	INSERT INTO public.member_of(
	user_id, group_id, mdate)
	VALUES (new.admin_id, new.group_id, CURRENT_DATE);
	RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER addMember
  AFTER INSERT ON lgroup
  FOR EACH ROW
  EXECUTE PROCEDURE addAdminAsMember();
  