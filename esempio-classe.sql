create table Studente (
	matricola integer not null,
	nome varchar not null,
	cognome varchar not null,
	nascita date, -- può essere null
	cf char(16) not null,
	
	primary key(matricola),
	unique(cf),
	unique(nome, cognome, nascita)
);

create table corso (
	codice integer primary key, -- implica il not null
	nome varchar not null
);

create table Esame (
    Studente integer not null,
    corso integer not null,
    voto integer not null 
        check(voto >= 18 and voto <= 30),
    lode boolean not null,

    check(lode = false or voto = 30),
    primary key(studente, corso),
    foreign key(studente)
        references studente(matricola),
    foreign key(corso)
        references corso(codice)  
);

insert into 
studente(matricola, nome, cognome, nascita, cf)
    values 
(1, 'Alice', 'Bianchi', '09-08-2002', 'AAABBB02G09H501L');

insert into 
studente(matricola, nome, cognome, cf)
    values 
(2, 'Biagio', 'Bruni', 'CCCBBB02G09H501L'),
(3, 'Biagio', 'Bruni', 'CCCDDD02G09H501L');

insert into 
studente(matricola, nome, cognome, nascita, cf)
    values 
(4, 'Biagio', 'Bruni', '10-04-1998', 'CCCFFF02G09H501L');