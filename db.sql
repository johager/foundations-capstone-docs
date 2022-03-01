drop table if exists contacts_groups;
drop table if exists phones;
drop table if exists emails;
drop table if exists addresses;
drop table if exists phone_types;
drop table if exists email_types;
drop table if exists address_types;
drop table if exists groups;
drop table if exists contacts;
drop table if exists users;

create table users (
    user_id serial primary key,
    name varchar(75) not null,
    email varchar(75) not null,
    passwd varchar(150) not null 
);

create table contacts (
    contact_id serial primary key,
    user_id int not null references users(user_id),
    fname varchar(75) not null default '',
    lname varchar(75) not null default '',
    company varchar(75) not null default '',
    note text not null default ''
);

create table phone_types (
    id serial primary key,
    type varchar(15) not null
);

create table email_types (
    id serial primary key,
    type varchar(15) not null
);

create table address_types (
    id serial primary key,
    type varchar(15) not null
);

create table phones (
    phone_id serial primary key,
    contact_id int not null references contacts(contact_id),
    type_id int not null references phone_types(id),
    phone varchar(20) not null,
    sort smallint not null
);

create table emails (
    email_id serial primary key,
    contact_id int not null references contacts(contact_id),
    type_id int not null references email_types(id),
    email varchar(100) not null,
    sort smallint not null
);

create table addresses (
    address_id serial primary key,
    contact_id int not null references contacts(contact_id),
    type_id int not null references address_types(id),
    addr1 varchar(100) not null default '',
    addr2 varchar(100) not null default '',
    city varchar(50) not null default '',
    state varchar(10) not null default '',
    zip varchar(100) not null default '',
    sort smallint not null
);

create table groups (
    group_id serial primary key,
    user_id int not null references users(user_id),
    name varchar(75) not null
);

create table contacts_groups (
    id serial primary key,
    contact_id int not null references contacts(contact_id),
    group_id int not null references groups(group_id)
);

insert into phone_types (type) values
('mobile'),
('home'),
('work'),
('school'),
('home fax'),
('work fax'),
('other');

insert into email_types (type) values
('home'),
('work'),
('school'),
('other');

insert into address_types (type) values
('home'),
('work'),
('school'),
('vacation'),
('other');

insert into users (name, email, passwd) values ('James','email@email.net','passwd');

insert into contacts (user_id, fname, lname) values
(1,'James', 'Hager'),
(1,'James', 'Kirk'),
(1,'S''chn T''gai', 'Spock'),
(1,'Leonard', 'McCoy'),
(1,'Montgomery', 'Scott');

insert into phones (contact_id, type_id, phone, sort) values
(1, 1,'111-123-1234',1),
(2, 1,'222-123-1234',1),
(3, 1,'333-123-1234',1),
(4, 1,'444-123-1234',1),
(5, 1,'555-123-1234',1);

insert into emails (contact_id, type_id, email, sort) values
(1, 1,'e1@email.net',1),
(2, 1,'e2@email.net',1),
(3, 1,'e3@email.net',1),
(4, 1,'e4@email.net',1),
(5, 1,'e5@email.net',1);

insert into addresses (contact_id, type_id, addr1, city, state, zip, sort) values
(1, 1,'111 Main St', 'MyCity', 'CO', '81010',1),
(2, 1,'222 2nd Ave.', 'MyCity', 'CO', '81010',1),
(3, 1,'333 Broad St', 'MyCity', 'CO', '81010',1),
(4, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(5, 1,'555 Elm St', 'MyCity', 'CO', '81010',1);