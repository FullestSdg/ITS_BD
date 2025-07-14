create type Strutturato as
    enum ('Ricercatore', 'Professore Associato', 'Professore Ordinario');

create type LavoroProgetto as 
    enum ('Ricerca e Sviluppo', 'Dimostrazione', 'Management', 'Altro');

create type LavoroNonProgettuale as
    enum ('Didattica', 'Ricerca', 'Missione', 'Incontro Dipartimentale', 'Incontro Accademico', 'Altro');

create type CausaAssenza as
    enum ('Chiusura Universitaria', 'Maternita', 'Malattia');

create domain PosInteger as integer 
    check (value >= 0);

create domain StringaM as varchar(100);

create domain NumeroOre as integer 
    check (value <= 8 and value >= 0 );

create domain Denaro as real 
    check (value >= 0);

create table Persona (
    id PosInteger primary key
    nome StringaM not null,
    cognome StringaM not null,
    posizione Strutturato not null,
    stipendio Denaro not null
);

create table Progetto (
    id PosInteger primary key,
    nome StringaM not null,
    inizio date not null
        check(inizio < fine),
    fine date not null,
    budget Denaro not null,

    unique nome
);

create table WP (
    progetto PosInteger primary key,
    id PosInteger primary key, 
    inizio date not null,
        check(inizio < fine)
    fine date not null,

    unique progetto
    unique nome 
    foreign key progetto references Progetto(id)
);

create table AttivitàProgetto(
    id PosInteger primary key,
    persona PosInteger not null,
    progetto PosInteger not null,
    wp PosInteger not null,
    giorno date  not null,
    tipo LavoroProgetto not null,
    oreDurata: NumeroOre not null,

    foreign key persona references Persona(id)
    foreign key (progetto, wp) references (progetto, id)
);

create table AttivitàNonProgettuale (
    id PosInteger primary key,
    persona PosInteger not null,
    tipo LavoroNonProgettuale not null,
    giorno date not null,
    oreDurata NumeroOre not null,

    foreign key persona references Persona(id)
);

create table Assenza (
    id PosInteger primary key,
    persona PosInteger not null,
    tipo CausaAssenza not null,
    giorno date not null,

    unique persona 
    unique giorno 

    foreign key persona references Persona(id)
);