UPDATE public.fuser
	SET email='newEmail@mailSite.com'
	WHERE user_id=3;
	
UPDATE public.post_content
	SET pcontent='newContent'
	WHERE post_id = 3;
	
UPDATE public.page_profile
	SET address=NULL
	WHERE page_id = 2;