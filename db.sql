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

insert into users (name, email, passwd) values ('James','email@email.net','|2a|09|FXSDCCJ6a2KjSGA/HZ4jJuQzS4hXxUbhN.iQ7Ku7RTczVVEsk9x5S');

insert into contacts (user_id, fname, lname) values
(1,'Sean', 'Carroll'),
(1,'Daniel', 'Dennett'),
(1,'Richard', 'Dawkins'),
(1,'Carlo', 'Rovelli'),
(1,'Gladwell', 'Gladwell'),
(1,'Walter', 'Isaacson'),
(1,'Steven', 'Pinker'),
(1,'Christopher', 'Hitchens');

insert into contacts (user_id, fname, lname, note) values
(1,'James T.', 'Kirk', '<i>Star Trek: The Original Series</i><br>Captain<br>USS <i>Enterprise</i> (NCC-1701)'),
(1,'S''chn T''gai', 'Spock', '<i>Star Trek: The Original Series</i><br>First Officer and Science Officer<br>USS <i>Enterprise</i> (NCC-1701)'),
(1,'Leonard', 'McCoy', '<i>Star Trek: The Original Series</i><br>Chief Medical Officer<br>USS <i>Enterprise</i> (NCC-1701)'),
(1,'Montgomery', 'Scott', '<i>Star Trek: The Original Series</i><br>Second Officer and Chief Engineer<br>USS <i>Enterprise</i> (NCC-1701)'),
(1,'Jean-Luc', 'Picard', '<i>Star Trek: The Next Generation</i><br>Captain<br>USS <i>Enterprise</i> (NCC-1701-D)'),
(1,'William T.', 'Riker', '<i>Star Trek: The Next Generation</i><br>Commander<br>USS <i>Enterprise</i> (NCC-1701-D)'),
(1,'Geordi', 'La Forge', '<i>Star Trek: The Next Generation</i><br>Lieutenant Commander<br>USS <i>Enterprise</i> (NCC-1701-D)'),
(1,'Benjamin', 'Sisko', '<i>Star Trek: Deep Space Nine</i><br>Commanding Officer, Commander<br><i>Deep Space Nine</i>'),
(1,'Julian', 'Bashir', '<i>Star Trek: Deep Space Nine</i><br>Chief Medical Officer, Lieutenant<br><i>Deep Space Nine</i>'),
(1,'Jadzia', 'Dax', '<i>Star Trek: Deep Space Nine</i><br>Chief Science Officer, Lieutenant<br><i>Deep Space Nine</i>'),
(1,'Miles', 'O''Brien', '<i>Star Trek: Deep Space Nine</i><br>Chief Operations Officer, Senior Chief Petty Officer<br><i>Deep Space Nine</i>');

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

insert into contacts (user_id, fname, lname, note) values
(1,'Joseph Marie', 'Jacquard', '(1752–1834) Developed the Jacquard Loom a mechanical loom that used punched cards to control the design.'),
(1,'Charles', 'Babbage', '(1791-1871) Developed the first mechanical computer, the Difference Engine. His Analytical Engine was a general-purpose computer programmed using punch cards.'),
(1,'Ada ', 'Lovelace', '(1815-1852) English mathematician who published the first algorithm intended to be performed by Babbage''s Analytical Engine.'),
(1,'Herman', 'Hollerith', '(1860-1929) German-American statistician, inventor, and businessman who developed an electromechanical tabulating machine for punched cards to assist in summarizing information and, later, in accounting. His company became International Business Machines (IBM).'),
(1,'Grace', 'Hopper', '(1906-1992) American computer scientist and United States Navy rear admiral. She was the first to devise the theory of machine-independent programming languages, and the FLOW-MATIC programming language she created using this theory was later extended to create COBOL.'),
(1,'Konrad', 'Zuse', '(1910-1995) German civil engineer, pioneering computer scientist, inventor and businessman. He developed the world''s first programmable computer in 1941.'),
(1,'Alan', 'Turing', '(1912-1954) English mathematician, computer scientist, logician, cryptanalyst, philosopher, and theoretical biologist. He was highly influential in the development of theoretical computer science, providing a formalisation of the concepts of algorithm and computation with the Turing machine, which can be considered a model of a general-purpose computer.\n\nDuring WW II, he worked for the Government Code and Cypher School (GC&CS) at Bletchley Park, Britain''s codebreaking centre that produced Ultra intelligence. For a time he led Hut 8, the section that was responsible for German naval cryptanalysis. Here, he devised a number of techniques for speeding the breaking of German ciphers, including improvements to the pre-war Polish bombe method, an electromechanical machine that could find settings for the Enigma machine. Turing played a crucial role in cracking intercepted coded messages that enabled the Allies to defeat the Axis powers in many crucial engagements, including the Battle of the Atlantic.'),
(1,'John', 'von Neumann', '(1903-1957) Hungarian-American mathematician, physicist, computer scientist, engineer and polymath. An early contribution to computer science was the concept of the von Neumann architecture where a computer could have a simple, fixed structure, yet be able to execute any kind of computation given properly programmed control without the need for hardware modification.'),
(1,'Kathleen', 'Booth', '(1922-) British computer pioneer who developed teh first assembly language.'),
(1,'Dennis', 'Ritchie', '(1941-2011) American computer scientist best known for developing the C programming language. He had proviosly worked with Ken Thompson to develop the Unix operating system and B programming language.'),
(1,'Paul', 'Allen', '(1953-2018) He co-founded Microsoft Corporation with childhood friend Bill Gates in 1975.'),
(1,'Bill', 'Gates', '(1955-) He co-founded Microsoft Corporation with childhood friend Paul Allen in 1975.'),
(1,'Steve', 'Jobs', '(1955-2011) He co-founded Apple Computer  Company with Steve Wozniak in 1976.'),
(1,'Steve', 'Wozniak', '(1950-) He co-founded Apple Computer  Company with Steve Jobs in 1976.'),
(1,'Timothy', 'Berners-Lee', '(1955-) An English computer scientist best known as the inventor of the World Wide Web.');

insert into contacts (user_id, fname, lname) values
(1,'Isaac', 'Asimov'),
(1,'Arthur C.', 'Clarke'),
(1,'Robert A.', 'Heinlein'),
(1,'George R.R.', 'Martin'),
(1,'Lee', 'Child'),
(1,'Douglas', 'Adams'),
(1,'Kurt', 'Vonnegut'),
(1,'Michael', 'Crichton');

update contacts set note = E'Research professor in the Walter Burke Institute for Theoretical Physics in the California Institute of Technology (Caltech) Department of Physics. He specializes in quantum mechanics, gravity, and cosmology.<ul><li>The Big Picture: On the Origins of Life, Meaning, and the Universe Itself, 2016</li></ul>' where lname='Carroll';

update contacts set note = E'University Professor and Austin B. Fletcher Professor of Philosophy, and Director of the Center for Cognitive Studies at Tufts University.\n\nBooks<ul><li>Consciousness Explained, 1992</li><li>Darwin''s Dangerous Idea: Evolution and the Meaning of Life, 1995</li></ul>' where lname='Dennett';

update contacts set note = E'Canadian-American cognitive psychologist, psycholinguist, popular science author and public intellectual. He is the Johnstone Family Professor of Psychology at Harvard University\n\nBooks<ul><li>Enlightenment: The Case for Reason, Science, Humanism, and Progress, 2018</li></ul>' where lname='Pinker';

update contacts set note = E'British-American author, journalist, orator and columnist.\n\nThe dictum "What can be asserted without evidence can also be dismissed without evidence" has become known as Hitchens'' razor.\n\nBooks<ul><li>God Is Not Great: How Religion Poisons Everything, 2007</li></ul>' where lname='Hitchens';

update contacts set note = E'British evolutionary biologist and author. Emeritus fellow of New College, Oxford\n\nBooks<ul><li>The Selfish Gene, 1976</li><li>The Blind Watchmaker, 1986</li><li>Unweaving the Rainbow: Science, Delusion, and the Appetite for Wonder, 1998</li><li>The Ancestor''s Tale: A Pilgrimage to the Dawn of Evolution, 2004</li><li>The God Delusion, 2006</li></ul>' where lname='Dawkins';


update contacts set note = E'American author, journalist, and professor at Tulane University.\n\nBooks<ul><li>Einstein: His Life and Universe, 2007</li><li>Steve Jobs, 2011</li><li>The Code Breaker: Jennifer Doudna, Gene Editing, and the Future of the Human Race, 2021</li></ul>' where lname='Isaacson';

update contacts set note = E'English-born Canadian journalist, author, and public speaker.\n\nBooks<ul><li>The Tipping Point: How Little Things Can Make a Big Difference, 2000</li><li>Blink, 2005</li><li>Outliers, 2008</li><li>What the Dog Saw, 2009</li><li>The Bomber Mafia: A Dream, a Temptation, and the Longest Night of the Second World War, 2021</li></ul>' where lname='Gladwell';

-- update contacts set note = E'<ul><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>' where lname='';

update contacts set note = E'Bacon ipsum dolor amet bresaola pork boudin chicken burgdoggen shank spare ribs drumstick fatback short loin cupim prosciutto. Pork short loin burgdoggen, capicola kielbasa alcatra pork belly ground round ball tip. Corned beef frankfurter tongue shoulder ball tip, chuck sirloin turducken. T-bone tenderloin drumstick filet mignon biltong brisket flank cow porchetta prosciutto salami ham hock rump ham. Salami turkey hamburger, short loin sausage short ribs t-bone sirloin pig. Pork belly turducken ribeye drumstick, picanha meatloaf doner t-bone pig burgdoggen landjaeger.Tongue ham chuck pork chop pancetta hamburger alcatra. Shank hamburger chuck, capicola ground round jowl ham hock brisket beef shoulder prosciutto drumstick chislic ham venison. Short ribs ham drumstick bresaola bacon, flank turducken fatback shankle pork chop pastrami. Bresaola frankfurter pig alcatra, bacon tail capicola rump beef ribs pastrami. Shank ground round doner landjaeger, sirloin tri-tip shoulder buffalo swine pancetta ham prosciutto t-bone. Tongue venison pig, hamburger corned beef filet mignon beef ribs jerky kevin.\n\nBrisket beef hamburger, tenderloin shank pork ham hock chicken. Salami turducken beef ribs, drumstick burgdoggen ribeye chicken shoulder tail capicola. Leberkas fatback t-bone, chicken swine beef short ribs cupim chislic burgdoggen doner prosciutto beef ribs. Beef ribs ground round salami kevin, prosciutto short ribs meatball venison pastrami boudin. Shank chicken jowl cupim alcatra.\n\nStrip steak hamburger alcatra boudin ground round pork belly bresaola salami short ribs tail brisket. Meatball kielbasa sirloin chicken spare ribs brisket. Bacon meatloaf beef, spare ribs tenderloin tail turducken bresaola rump sausage swine. Tri-tip ball tip biltong ham hock brisket picanha jerky burgdoggen turducken porchetta kevin. Frankfurter salami drumstick, leberkas porchetta shoulder meatloaf venison ham swine. Picanha prosciutto ground round, brisket bresaola leberkas shankle meatloaf spare ribs pancetta swine burgdoggen t-bone.\n\nHamburger landjaeger tenderloin ham hock brisket. Ribeye jowl burgdoggen shank meatloaf sirloin pancetta pork chop pastrami chicken ground round cow hamburger pork belly. Picanha pork loin fatback shoulder pancetta. Cow filet mignon prosciutto sausage frankfurter tongue biltong, short ribs turducken shoulder ham pork pastrami capicola boudin. Pancetta jerky fatback, strip steak burgdoggen short loin pork tri-tip shankle ham t-bone pastrami buffalo cupim. Ham pork chop ball tip drumstick.' where lname='Kirk';

update contacts set note = E'<b>Early Novels</b><ul><li>Red Planet, 1949</li><li>Between Planets, 1951</li><li>The Puppet Masters, 1951</li><li>Time for the Stars, 1956</li><li>Starship Troopers, 1959</li></ul><br><b>Middle Novels</b><ul><li>Stranger in a Strange Land, 1961</li><li>The Moon Is a Harsh Mistress, 1966</li><li>I Will Fear No Evil, 1970</li><li>Time Enough for Love, 1973</li></ul><br><b>Late Novels</b><ul><li>The Number of the Beast, 1980</li><li>Friday, 1982</li><li>To Sail Beyond the Sunset, 1987</li></ul>' where lname='Heinlein';

insert into phones (contact_id, type_id, phone, sort) values
(1, 3,'626-395-6830',1),
(2, 3,'617-627-3297',1);

insert into emails (contact_id, type_id, email, sort) values
(1, 2,'seancarroll@gmail.com',1),
(2, 2,'daniel.dennett@tufts.edu',1);

insert into addresses (contact_id, type_id, addr1, addr2, city, state, zip, sort) values
(1, 2,'1200 E California Blvd', '', 'Pasadena', 'CA', '91125',1),
(2, 2,'Center for Cognitive Studies', '115 Miner Hall', 'Medford', 'MA', '02155',1);