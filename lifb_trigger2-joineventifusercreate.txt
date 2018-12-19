create or replace function addusertoevent() returns trigger as $$
begin
     	INSERT INTO public.join_event(user_id,event_id)
	    (SELECT user_id,event_id 
		FROM fuser,f_event 
		WHERE new.creator_id =fuser.creator_id AND event_id=new.event_id);
		RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER joineventcreator
  AFTER INSERT ON f_event
  FOR EACH ROW 
  EXECUTE PROCEDURE addusertoevent();
  
  