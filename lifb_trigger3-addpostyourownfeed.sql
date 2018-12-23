create or replace function addyourposttofeed() returns trigger as $$
begin
	INSERT INTO public.feed(creator_id, post_id)
	VALUES (new.creator_id,new.post_id);
		RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER addtofeed
  AFTER INSERT ON post
  FOR EACH ROW 
  EXECUTE PROCEDURE addyourposttofeed();
  
  