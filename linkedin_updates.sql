UPDATE public.page
	SET ptype='school'
	WHERE pname ::text LIKE 'school%';

UPDATE public.experience
    SET elocation='ankara'
	WHERE company_name IN ('company1','company2');

UPDATE public.luser
    SET user_id = 15
	WHERE user_id = 3;