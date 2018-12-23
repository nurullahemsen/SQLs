create or replace function over18() returns trigger as $$
begin
	IF (SELECT date_part('year',age(bdate)) FROM luser WHERE luser.user_id= new.user_id)<18
	THEN
		RAISE EXCEPTION 'hata yaptın';
	END IF;
		RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER jobadage
  BEFORE INSERT ON job_ad
  FOR EACH ROW 
  EXECUTE PROCEDURE over18();


