INSERT INTO public.pmanage(
	user_id, page_id)
	VALUES (1,1),
	(2,1),
	(2,2),
	(3,3),
	(5,4),
	(6,5),
	(4,6),
	(3,6),
	(7,7);

INSERT INTO public.talents(
	user_id, talent_name)
	VALUES (1,'talent1'),
	(2,'talent1'),
	(3,'talent1'),
	(1,'talent2'),
	(1,'talent3'),
	(1,'talent4'),
	(4,'talent5'),
	(4,'talent6'),
	(5,'talent4'),
	(5,'talent7'),
	(6,'talent8'),
	(6,'talent3'),
	(7,'talent1');

INSERT INTO public.successes(
	user_id, description, sdate)
	VALUES (1,'success1','2000-01-01'),
	(2,'success1','2002-01-01'),
	(2,'success2','2003-01-01'),
	(4,'success3','2005-01-01'),
	(5,'success4','2008-01-01');
	
	
INSERT INTO public.education(
	user_id, school_name, edegree, gpa, department, start_date, end_date)
	VALUES (2,'ege','lisans','3.56','ceng','2016-09-09','2020-05-06'),
	(2,'ege','ylisans','3.20','ceng','2020-09-09','2022-05-06'),
	(1,'yıldız','lisans','3.87','ceng','2017-09-09','2021-05-06'),
	(3,'odtü','lisans','2.48','ee','203-09-09','2028-05-06'),
	(4,'ege','lisans','3.02','medicine','2013-09-09','2019-05-06');

INSERT INTO public.experience(
	user_id, title, elocation, company_name, start_date, end_date, sector, description)
	VALUES (2,'intern','izmir','company1','2015-07-11','2015-08-22','IT','blahblah'),
	(1,'developer','izmir','company1','2012-07-11',NULL,'IT','blahblah'),
	(3,'director','istanbul','company2','2013-07-11',NULL,'FOOD','blahblah'),
	(4,'manager','ankara','company3','2015-07-11','2015-08-22','ENTERTAINMENT','blahblah'),
	(7,'intern','izmir','company1','2006-07-11','2007-08-22','ELECTRONIC','blahblah'),
	(7,'advisor','istanbul','company2','2015-07-11',NULL,'IT','blahblah');

INSERT INTO public.follow_page(
	user_id, page_id)
	VALUES (2,1),
	(1,1),
	(3,1),
	(4,2),
	(5,3),
	(6,4),
	(7,5),
	(4,5),
	(4,1),
	(6,6),
	(5,7),
	(2,7);

INSERT INTO public.applies(
	user_id,job_id)
	VALUES (2,1),
	(2,2),
	(3,3),
	(4,4),
	(5,5),
	(6,1),
	(4,2),
	(7,2);
	
INSERT INTO public.lconnect(
	user1_id, user2_id, cdate)
	VALUES (1,2,'2016-10-31'),
			(2,4,'2016-10-22'),
			(1,3,'2015-10-31'),
			(3,7,'2015-08-31'),
			(4,5,'2002-10-31'),
			(5,7,'2002-10-31'),
			(6,7,'2003-10-07'),
			(7,4,'2003-10-31'),
			(3,4,'2004-10-31'),
			(6,5,'2014-10-31'),
			(2,5,'2018-10-31'),
			(7,2,'2017-10-31'),
			(1,7,'2016-10-31'),
			(1,4,'2013-10-31'),
			(6,1,'2013-10-31');
	
INSERT INTO public.message(
	mdate, mtime, is_read, sender_id, receiver_id,message_content)
	VALUES ('2017-12-14','14:05:10',true,1,2,'content1'),
	('2013-12-14','14:05:10',true,1,3,'content2'),
	('2014-12-14','14:05:10',true,2,4,'content3'),
	('2015-12-14','14:05:10',false,4,3,'content4'),
	('2016-12-14','14:05:10',true,5,2,'content5'),
	('2017-12-14','14:05:10',false,7,6,'content6');
	
INSERT INTO public.notification(
	ndate, is_seen, user_id,notification_content)
	VALUES ('2018-12-14',false,2,'content1'),
	('2018-11-14',false,1,'content2'),
	('2018-10-14',false,3,'content3'),
	('2018-09-14',true,3,'content4'),
	('2018-12-11',false,3,'content5'),
	('2018-12-12',true,4,'content6'),
	('2017-12-14',true,5,'content7'),
	('2016-12-14',false,6,'content8');

INSERT INTO public.member_of(
	user_id, group_id, mdate)
	VALUES (3,1,'2018-12-14'),
	(2,2,'2017-12-14'),
	(3,4,'2016-11-14'),
	(3,3,'2015-10-14'),
	(1,4,'2012-08-14'),
	(6,5,'2011-12-14'),
	(7,1,'2017-12-12'),
	(5,1,'2016-12-12'),
	(4,2,'2010-12-07');

	
INSERT INTO public.likes(
	post_id, creator_id)
	VALUES (1,3),
	(1,11),
	(2,12),
	(2,8),
	(3,7),
	(4,6),
	(5,5),
	(10,13),
	(7,12),
	(8,6);

INSERT INTO public.lcomment(
	post_id,cdate, ccontent, creator_id)
	VALUES (1,'2017-12-14','mycomment',9),
	(1,'2016-12-14','mycomment',10),
	(2,'2015-12-14','mycomment',4),
	(3,'2013-12-14','mycomment',3),
	(8,'2012-12-14','mycomment',5),
	(9,'2016-12-14','mycomment',6),
	(4,'2015-12-14','mycomment',6),
	(4,'2012-12-14','mycomment',6);



	