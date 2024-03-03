
create database claims_db;

use claims_db;

create table claim_status (
	id int primary key auto_increment,
    caption varchar(255) not null
);

insert into claim_status (caption) values
('новое'),
('подтверждено'),
('отклонено');

create table users (
	id int primary key auto_increment,
    second_name varchar(50) not null,
    first_name varchar(50) not null,
    patronymic varchar(50),
    tel varchar(12) not null,
    email varchar(50) not null unique,
    login varchar(20) not null,
    password varchar(255) not null
);

insert into users (second_name, first_name, tel, email, login, password) values
('Test', 'Test', '+79543214566', 'test', 'test@mail.ru', 'password');


create table claims (
	id int primary key auto_increment,
    user_id int not null,
    autonumber varchar(20) not null,
    description text not null,
    status_id int not null,
    claim_date timestamp not null,
    foreign key (user_id) references users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    foreign key (status_id) references claim_status (id) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into claims (user_id, autonumber, description, status_id, claim_date) values
(1, '3СОС32177RUS', 'Заехал на бордюр', 1, NOW());
