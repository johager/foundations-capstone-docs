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
    fname varchar(75),
    lname varchar(75),
    company varchar(75),
    note text
);

create table phone_types (
    type_id serial primary key,
    type varchar(15) not null
);

create table email_types (
    type_id serial primary key,
    type varchar(15) not null
);

create table address_types (
    type_id serial primary key,
    type varchar(15) not null
);

create table phones (
    id serial primary key,
    contact_id int not null references contacts(contact_id),
    type_id int not null references phone_types(type_id),
    phone varchar(20) not null,
    sort smallint not null
);

create table emails (
    id serial primary key,
    contact_id int not null references contacts(contact_id),
    type_id int not null references email_types(type_id),
    email varchar(100) not null,
    sort smallint not null
);

create table addresses (
    id serial primary key,
    contact_id int not null references contacts(contact_id),
    type_id int not null references address_types(type_id),
    address varchar(200) not null,
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