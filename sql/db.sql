drop database if exists collocation_db;
create database collocation_db;

drop table if exists collocation_db.user;
create table collocation_db.user(
  id int auto_increment primary key
  comment 'id PK',
  email varchar(255) not null unique
    comment 'email NN UQ',
  username varchar(255) default 'BBR996'
  comment 'username NN UN',
  password varchar(255) not null
  comment 'password NN',
  avatar varchar(255) default 'default.png'
    comment 'avatar',
  sign varchar(255)
    comment 'sign',
  gender varchar(10)
    comment 'gender',
  phone varchar(11)
    comment 'phone',
  updateTime datetime
  comment 'last sign in time'
)comment 'user table';

select *
from collocation_db.user;

drop table if exists collocation_db.type;
create table collocation_db.type(
  id int auto_increment primary key
  comment 'id PK',
  typename varchar(255) not null
  comment 'typename NN UN'
)comment 'type table';

# String typename

select *
from collocation_db.type;

drop table if exists collocation_db.collocation;
create table collocation_db.collocation (
  id int auto_increment primary key
  comment 'id PK',
  title varchar(255) not null
  comment 'title NN',
  introduce varchar(255)
  comment 'introduce',
  coverPicture   varchar(255) not null
  comment '封面图片 NN',
  content varchar(1000)
    comment 'content',
  status varchar(2) not null default '公开'
  comment '状态：公开/私密',
  createTime datetime
  comment 'createTime',
  lookData int default 0
    comment 'lookData',
  typeId int not null
  comment 'typeId FK NN',
  userId int not null
  comment 'userId FK NN'
)comment 'collocation table';
# String name, String gender, int height
# String title, String introduce, String coverPicture, String detailPictures, String content, String status, String createTime

alter table collocation_db.collocation
  add constraint
  collocation_info_fk_typeId
foreign key (typeId)
references collocation_db.type(id);

alter table collocation_db.collocation
  add constraint
  collocation_info_fk_userId
foreign key (userId)
references collocation_db.user(id);

select *
from collocation_db.collocation;
