create table creator(
creator_id serial primary key);

create table luser(
user_id serial primary key,
fname varchar(255) not null,
lname varchar(255) not null,
email varchar(255) unique not null,
pass varchar(255) not null,
address varchar(255) not null,
bdate date not null CHECK (bdate < current_date),
tel varchar(15) not null,
creator_id integer not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table lgroup(
group_id serial primary key,
description varchar(255),
admin_id integer not null,
foreign key(admin_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table notification(
notification_id serial primary key,
ndate date not null,
is_seen boolean not null,
user_id integer not null,
notification_content varchar(255) not null,
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table job_ad(
job_id serial primary key,
description varchar(255),
company_name varchar(255),
job_title varchar(255),
job_type varchar(255),
user_id integer not null,
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table message(
message_id serial primary key,
mdate date not null,
mtime time not null,
is_read boolean not null,
sender_id integer not null,
receiver_id integer not null,
message_content varchar(255) not null,
foreign key(sender_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(receiver_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table page(
page_id serial primary key,
ptype varchar(255) not null,
pname varchar(255) not null,
address varchar(255),
creator_id integer not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table education(
user_id integer,
school_name varchar(255) not null,
edegree varchar(255),
gpa numeric(10,2) CHECK (gpa<= 4.00),
department varchar(255),
start_date date,
end_date date,
primary key(user_id,start_date),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table experience(
user_id integer,
title varchar(255),
elocation varchar(255),
company_name varchar(255) not null,
start_date date,
end_date date,
sector varchar(255),
description varchar(255),
CHECK (start_date < end_date),
primary key(user_id,start_date),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
				
create table successes(
user_id integer,
description varchar(255) not null,
sdate date not null,
primary key(user_id,sdate),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table lconnect(
user1_id integer,
user2_id integer,
cdate date not null,
primary key(user1_id,user2_id),
foreign key(user1_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(user2_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table member_of(
user_id integer,
group_id integer,
mdate date not null,
primary key(user_id,group_id),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(group_id) references lgroup(group_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table applies(
user_id integer,
job_id integer,
primary key(user_id,job_id),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(job_id) references job_ad(job_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table pmanage(
user_id integer,
page_id integer,
primary key(user_id,page_id),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(page_id) references page(page_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table follow_page(
user_id integer,
page_id integer,
primary key(user_id,page_id),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(page_id) references page(page_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table talents(
user_id integer,
talent_name varchar(255) not null,
primary key(user_id,talent_name),
foreign key(user_id) references luser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);			 

create table post(
post_id serial primary key,
creator_id integer not null,
pcontent varchar(255) not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
			 
create table lcomment(
post_id integer,
comment_id serial,
cdate date not null,
ccontent varchar(255) not null,
creator_id integer not null,
primary key(post_id,comment_id),
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(post_id) references post(post_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table likes(
post_id integer,
creator_id integer,
primary key(post_id,creator_id),
foreign key(post_id) references post(post_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE)
				
				
				
				
				
				
				
				
				
				
				
				
				
				