INSERT INTO public.f_event(
	creator_id, event_name, event_date, address, description)
	VALUES (1,'ename1','2019-08-09','address1','descp1'),
	(3,'ename2','2019-08-09','address2','descp2'),
	(4,'ename3','2020-08-09','address3','descp3'),
	(8,'ename4','2020-08-09','address4','descp4'),
	(9,'ename5','2019-05-09','address5','descp5'),
	(2,'ename6','2019-08-07','address6','descp6'),
	(5,'ename7','2018-12-30','address7','descp7');

INSERT INTO public.fgroup(
	description)
	VALUES ('groupdesc1'),
	('groupdesc2'),
	('groupdesc3'),
	('groupdesc4'),
	('groupdesc5');
	

INSERT INTO public.post(
	creator_id,post_date)
	VALUES (2,'2012-03-03'),
	(2,'2011-03-03'),
	(3,'2015-03-03'),
	(3,'2012-04-03'),
	(10,'2012-05-03'),
	(11,'2012-03-03'),
	(12,'2010-05-07'),
	(10,'2009-07-03'),
	(6,'2015-06-03'),
	(10,'2013-09-03');

INSERT INTO public.job_ad(
	description, company_name, job_title, job_type, user_id)
	VALUES ('job1','name1','title1','type1',1),
	('job2','name2','title2','type1',1),
	('job3','name3','title3','type1',2),
	('job4','name4','title4','type2',1),
	('job5','name5','title5','type2',6);