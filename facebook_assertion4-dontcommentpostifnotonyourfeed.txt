create or replace function notcommentpostnotonyourfeed() returns trigger as $$
begin
    IF(new.post_id NOT IN (SELECT post_id
    FROM feed
    WHERE feed.creator_id=new.creator_id)) 
	THEN
    RAISE EXCEPTION 'feedinizde olmayan bir gönderiye yorum yapamazsınız';	
	END IF;
	RETURN NEW;
end;
$$ language plpgsql;

CREATE TRIGGER commenttopost
  BEFORE INSERT ON fcomment
  FOR EACH ROW
  EXECUTE PROCEDURE notcommentpostnotonyourfeed();