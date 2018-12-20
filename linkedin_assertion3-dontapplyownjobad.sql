create or replace function dontapplyyourjob() returns trigger as $$
begin
  		IF EXISTS(SELECT user_id FROM job_ad WHERE user_id = new.user_id and job_id=new.job_id) THEN
		RAISE EXCEPTION 'kendi iş ilanınıza başvuramazsınız';
		END IF;
		RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER noapply
  BEFORE INSERT ON applies
  FOR EACH ROW 
  EXECUTE PROCEDURE dontapplyyourjob();
 
  