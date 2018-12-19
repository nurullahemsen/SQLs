INSERT INTO public.job_ad(
	description, company_name, job_title, job_type, user_id)
	VALUES ('job1','name1','title1','type1',1),
	('job2','name2','title2','type1',1),
	('job3','name3','title3','type1',2),
	('job4','name4','title4','type2',1),
	('job5','name5','title5','type2',6);

INSERT INTO public.lgroup(
	description, admin_id)
	VALUES ('groupdesc1',2),
	('groupdesc2',3),
	('groupdesc3',4),
	('groupdesc4',2),
	('groupdesc5',2);
	

INSERT INTO public.post(
	creator_id, pcontent)
	VALUES (2,'post1'),
	(2,'post2'),
	(3,'post3'),
	(3,'post4'),
	(10,'post5'),
	(11,'post6'),
	(12,'post7'),
	(10,'post8'),
	(6,'post9'),
	(10,'post10');
	