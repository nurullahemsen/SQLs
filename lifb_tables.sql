create table creator(
creator_id serial primary key);

create table fuser(
user_id serial primary key,
fname varchar(255) not null,
lname varchar(255) not null,
email varchar(255) unique not null,
pass varchar(255) not null,
bdate date not null,
gender char not null,
relationship_id integer,
CHECK(user_id != relationship_id),
creator_id integer not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(relationship_id) references fuser(user_id)
	ON DELETE SET NULL ON UPDATE CASCADE);

create table fgroup(
group_id serial primary key,
description varchar(255));

create table notification(
notification_id serial primary key,
ndate date not null,
is_seen boolean not null,
notification_content varchar(255) not null,
creator_id integer not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table message(
message_id serial primary key,
mdate date not null,
mtime time not null,
message_content varchar(255) not null,
is_read boolean not null,
sender_id integer not null,
receiver_id integer not null,
foreign key(sender_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(receiver_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table page(
page_id serial primary key,
category varchar(255) not null,
pname varchar(255) not null,
address varchar(255),
phone varchar(255),
email varchar(255),
creator_id integer not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table friendship(
user1_id serial,
user2_id serial,
fdate date not null,
primary key(user1_id,user2_id),
foreign key(user1_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(user2_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table member_of(
user_id integer,
group_id integer,
mdate date not null,
primary key(user_id,group_id),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(group_id) references fgroup(group_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table pmanage(
user_id integer,
page_id integer,
primary key(user_id,page_id),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(page_id) references page(page_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table likes_page(
user_id integer,
page_id integer,
primary key(user_id,page_id),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(page_id) references page(page_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table post(
post_id serial primary key,
creator_id integer not null,
post_date date not null,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
										   
create table post_content(
post_id integer,
pcontent varchar(255) not null,
primary key(post_id, pcontent),
foreign key(post_id) references post(post_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
			 
create table fcomment(
post_id integer,
comment_id serial,
cdate date not null,
comment_content varchar(255) not null,
creator_id integer not null,
primary key(post_id,comment_id),
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(post_id) references post(post_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table post_likes(
post_id integer,
creator_id integer,
like_type integer not null,
primary key(post_id,creator_id),
foreign key(post_id) references post(post_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
				
create table f_event(
event_id serial,
creator_id integer,
event_name varchar(255) not null,
event_date date not null CHECK (event_date > current_date),
address varchar(255) not null,
description varchar(255),
primary key(event_id),
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
										   
create table user_profile(
user_id integer,
school varchar(255),
city varchar(255),
hometown varchar(255),
address varchar(255),
pwork varchar(255),
phone varchar(255),
email varchar(255),
planguage varchar(255),
religion varchar(255),
political_view varchar(255),
primary key(user_id),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);										   
				
create table user_relative(
user1_id integer,
user2_id integer,
rtype varchar(255) not null,
primary key(user1_id,user2_id),
foreign key(user1_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(user2_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
									   
create table join_event(
user_id integer,
event_id integer,
primary key(user_id, event_id),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(event_id) references f_event(event_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table group_manage(
creator_id integer,
group_id integer,
primary key(creator_id,group_id),
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(group_id) references fgroup(group_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
				
				
create table job_ad(
job_id serial primary key,
description varchar(255),
company_name varchar(255),
job_title varchar(255),
job_type varchar(255),
user_id integer not null,
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
					
create table education(
user_id integer,
school_name varchar(255) not null,
edegree varchar(255),
gpa numeric(10,2),
department varchar(255),
start_date date,
end_date date,
CHECK (start_date < end_date),
primary key(user_id,start_date),
foreign key(user_id) references fuser(user_id)
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
primary key(user_id,start_date),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
				
create table successes(
user_id integer,
description varchar(255) not null,
sdate date not null,
primary key(user_id,sdate),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);


create table talents(
user_id integer,
talent_name varchar(255) not null,
primary key(user_id,talent_name),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE);		
					
create table applies(
user_id integer,
job_id integer,
primary key(user_id,job_id),
foreign key(user_id) references fuser(user_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(job_id) references job_ad(job_id)
	ON DELETE CASCADE ON UPDATE CASCADE);

create table feed(
creator_id integer,
post_id integer,
primary key(creator_id,post_id),
foreign key(creator_id) references creator(creator_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(post_id) references post(post_id)
	ON DELETE CASCADE ON UPDATE CASCADE);
								
				
				
				
				
				
				