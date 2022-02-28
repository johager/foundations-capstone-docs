create table users (
    user_id serial primary key,
    name varchar(75) not null,
    email varchar(75) not null,
    passwd varchar(150) not null 
);

create table contacts (
    contact_id serial primary key,
    user_id not null references users(user_id),
    fname varchar(75),
    lname varchar(75),
    company varchar(75),
    note text
);

create table phone_types (
    type_id serial primary key,
    type varchar(15)
);

create table email_types (
    type_id serial primary key,
    type varchar(15)
);

create table address_types (
    type_id serial primary key,
    type varchar(15)
);

create table phones (
    id serial primary key,
    contact_id not null references contacts(contact_id),
    type_id not null references phone_types(type_id),
    number varchar(20),
    sort tinyint not null
);

create table emails (
    id serial primary key,
    contact_id not null references contacts(contact_id),
    type_id not null references email_types(type_id),
    email varchar(100),
    sort tinyint not null
);

create table addresses (
    id serial primary key,
    contact_id not null references contacts(contact_id),
    type_id not null references address_types(type_id),
    address varchar(200),
    sort tinyint not null
);

create table groups (
    group_id serial primary key,
    user_id not null references users(user_id),
    group varchar(75)
);

create table contacts_groups (
    id serial primary key,
    contact_id not null references contacts(contact_id),
    group_id not null references groups(group_id)
);