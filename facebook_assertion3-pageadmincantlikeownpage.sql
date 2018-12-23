create or replace function pgmanagerCantLikecontrol() returns trigger as $$
begin
   IF EXISTS (SELECT * from pmanage where new.user_id = user_id and new.page_id = page_id) THEN
    RAISE EXCEPTION 'Zaten yönettiğin sayfayı like layamazsın !';
	END IF;
	RETURN NEW;
    end;
$$ language plpgsql;

CREATE TRIGGER pgmanagerCantLike
  BEFORE UPDATE OR INSERT ON likes_page
  FOR EACH ROW 
  EXECUTE PROCEDURE pgmanagerCantLikecontrol();
  
  