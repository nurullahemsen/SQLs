create or replace function dontjoinpasteventsfunc() returns trigger as $$
begin
	IF (SELECT event_date FROM f_event WHERE f_event.event_id=new.event_id )<current_date
	THEN
		RAISE EXCEPTION 'geçmiş eventlere katılamazsınız';
	END IF;
		RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER dontjoinpastevents
  BEFORE INSERT ON join_event
  FOR EACH ROW 
  EXECUTE PROCEDURE dontjoinpasteventsfunc();
  
