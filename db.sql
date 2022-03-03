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
(1,'James T.', 'Kirk'),
(1,'S''chn T''gai', 'Spock'),
(1,'Leonard', 'McCoy'),
(1,'Montgomery', 'Scott'),
(1,'Jean-Luc', 'Picard'),
(1,'William T', 'Riker'),
(1,'Geordi', 'La Forge'),
(1,'Benjamin', 'Sisko'),
(1,'Jadzia', 'Dax'),
(1,'Miles', 'O''Brien');

insert into contacts (user_id, fname, lname) values
(1,'Galileo', 'Galilei'),
(1,'Isaac', 'Newton'),
(1,'Benjamin', 'Franklin'),
(1,'James Clerk', 'Maxwell'),
(1,'Ernst', 'Mach'),
(1,'Ludwig', 'Boltzmann'),
(1,'Nikola', 'Tesla'),
(1,'Max', 'Planck'),
(1,'Marie', 'Curie'),
(1,'Albert', 'Einstein'),
(1,'Niels', 'Bohr'),
(1,'Erwin', 'Schrödinger'),
(1,'Enrico', 'Fermi'),
(1,'Francis', 'Crick'),
(1,'James', 'Watson'),
(1,'Leo', 'Szilard'),
(1,'J. Robert', 'Oppenheimer'),
(1,'Richard P.', 'Feynman'),
(1,'Charles', 'Darwin');

insert into contacts (user_id, fname, lname) values
(1,'Isaac', 'Asimov'),
(1,'Arthur C.', 'Clarke'),
(1,'Robert A.', 'Heinlein'),
(1,'George R.R.', 'Martin');

update contacts set note = E'First line.\n\n<b>Second line is bold.</b>\n\n<i>Third line is italic.</i>' where lname='Scott';
update contacts set note = 'Bacon ipsum dolor amet bresaola pork boudin chicken burgdoggen shank spare ribs drumstick fatback short loin cupim prosciutto. Pork short loin burgdoggen, capicola kielbasa alcatra pork belly ground round ball tip. Corned beef frankfurter tongue shoulder ball tip, chuck sirloin turducken. T-bone tenderloin drumstick filet mignon biltong brisket flank cow porchetta prosciutto salami ham hock rump ham. Salami turkey hamburger, short loin sausage short ribs t-bone sirloin pig. Pork belly turducken ribeye drumstick, picanha meatloaf doner t-bone pig burgdoggen landjaeger.\n\nTongue ham chuck pork chop pancetta hamburger alcatra. Shank hamburger chuck, capicola ground round jowl ham hock brisket beef shoulder prosciutto drumstick chislic ham venison. Short ribs ham drumstick bresaola bacon, flank turducken fatback shankle pork chop pastrami. Bresaola frankfurter pig alcatra, bacon tail capicola rump beef ribs pastrami. Shank ground round doner landjaeger, sirloin tri-tip shoulder buffalo swine pancetta ham prosciutto t-bone. Tongue venison pig, hamburger corned beef filet mignon beef ribs jerky kevin.\n\nBrisket beef hamburger, tenderloin shank pork ham hock chicken. Salami turducken beef ribs, drumstick burgdoggen ribeye chicken shoulder tail capicola. Leberkas fatback t-bone, chicken swine beef short ribs cupim chislic burgdoggen doner prosciutto beef ribs. Beef ribs ground round salami kevin, prosciutto short ribs meatball venison pastrami boudin. Shank chicken jowl cupim alcatra.\n\nStrip steak hamburger alcatra boudin ground round pork belly bresaola salami short ribs tail brisket. Meatball kielbasa sirloin chicken spare ribs brisket. Bacon meatloaf beef, spare ribs tenderloin tail turducken bresaola rump sausage swine. Tri-tip ball tip biltong ham hock brisket picanha jerky burgdoggen turducken porchetta kevin. Frankfurter salami drumstick, leberkas porchetta shoulder meatloaf venison ham swine. Picanha prosciutto ground round, brisket bresaola leberkas shankle meatloaf spare ribs pancetta swine burgdoggen t-bone.\n\nHamburger landjaeger tenderloin ham hock brisket. Ribeye jowl burgdoggen shank meatloaf sirloin pancetta pork chop pastrami chicken ground round cow hamburger pork belly. Picanha pork loin fatback shoulder pancetta. Cow filet mignon prosciutto sausage frankfurter tongue biltong, short ribs turducken shoulder ham pork pastrami capicola boudin. Pancetta jerky fatback, strip steak burgdoggen short loin pork tri-tip shankle ham t-bone pastrami buffalo cupim. Ham pork chop ball tip drumstick.' where lname='McCoy';

insert into phones (contact_id, type_id, phone, sort) values
(1, 1,'111-123-1234',1),
(2, 1,'222-123-1234',1),
(3, 1,'333-123-1234',1),
(4, 1,'444-123-1234',1),
(5, 1,'555-123-1234',1),
(6, 1,'555-123-1234',1),
(7, 1,'555-123-1234',1),
(8, 1,'555-123-1234',1),
(9, 1,'555-123-1234',1),
(10, 1,'555-123-1234',1),
(11, 1,'555-123-1234',1),
(12, 1,'555-123-1234',1),
(13, 1,'555-123-1234',1),
(14, 1,'555-123-1234',1),
(15, 1,'555-123-1234',1),
(16, 1,'555-123-1234',1),
(17, 1,'555-123-1234',1),
(18, 1,'555-123-1234',1),
(19, 1,'555-123-1234',1),
(20, 1,'555-123-1234',1),
(21, 1,'555-123-1234',1),
(22, 1,'555-123-1234',1),
(23, 1,'555-123-1234',1),
(24, 1,'555-123-1234',1),
(25, 1,'555-123-1234',1),
(26, 1,'555-123-1234',1),
(27, 1,'555-123-1234',1),
(28, 1,'555-123-1234',1),
(29, 1,'555-123-1234',1),
(30, 1,'555-123-1234',1),
(31, 1,'555-123-1234',1),
(32, 1,'555-123-1234',1),
(33, 1,'555-123-1234',1);

insert into emails (contact_id, type_id, email, sort) values
(1, 1,'e1@email.net',1),
(2, 1,'e2@email.net',1),
(3, 1,'e3@email.net',1),
(4, 1,'e4@email.net',1),
(5, 1,'e4@email.net',1),
(6, 1,'e4@email.net',1),
(7, 1,'e4@email.net',1),
(8, 1,'e4@email.net',1),
(9, 1,'e4@email.net',1),
(10, 1,'e4@email.net',1),
(11, 1,'e4@email.net',1),
(12, 1,'e4@email.net',1),
(13, 1,'e4@email.net',1),
(14, 1,'e4@email.net',1),
(15, 1,'e4@email.net',1),
(16, 1,'e4@email.net',1),
(17, 1,'e4@email.net',1),
(18, 1,'e4@email.net',1),
(19, 1,'e4@email.net',1),
(20, 1,'e4@email.net',1),
(21, 1,'e4@email.net',1),
(22, 1,'e4@email.net',1),
(23, 1,'e4@email.net',1),
(24, 1,'e4@email.net',1),
(25, 1,'e4@email.net',1),
(26, 1,'e4@email.net',1),
(27, 1,'e4@email.net',1),
(28, 1,'e4@email.net',1),
(29, 1,'e4@email.net',1),
(30, 1,'e4@email.net',1),
(31, 1,'e4@email.net',1),
(32, 1,'e4@email.net',1),
(33, 1,'e4@email.net',1);

insert into addresses (contact_id, type_id, addr1, city, state, zip, sort) values
(1, 1,'111 Main St', 'MyCity', 'CO', '81010',1),
(2, 1,'222 2nd Ave.', 'MyCity', 'CO', '81010',1),
(3, 1,'333 Broad St', 'MyCity', 'CO', '81010',1),
(4, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(5, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(6, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(7, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(8, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(9, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(10, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(11, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(12, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(13, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(14, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(15, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(16, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(17, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(18, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(19, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(20, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(21, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(22, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(23, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(24, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(25, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(26, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(27, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(28, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(29, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(30, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(31, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(32, 1,'444 Market St', 'MyCity', 'CO', '81010',1),
(33, 1,'444 Market St', 'MyCity', 'CO', '81010',1);