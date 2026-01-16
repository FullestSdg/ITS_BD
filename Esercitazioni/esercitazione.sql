-- DOMINI DI TIPO BASE

create domain IntGEZ as integer 
    check (value >= 0);

-- TABELLE

create table Falesia(
    nome varchar(100) primary key
);

create table Grado(
    nome varchar(100) primary key,
    valore IntGEZ not null
);

create table Via(
    nome varchar(100) not null,
    n IntGEZ not null,

    -- Associazione con Grado
    grado varchar(100) not null,
    foreign key(grado) references Grado(nome),

    -- Associazione con Falesia
    falesia varchar(100) not null,
    foreign key (falesia) references Falesia(nome),

    primary key (nome, falesia)

    -- v. inclu. (nome, falesia) occorre in crea(nome_via, falesia)
);

create table Utente(
    username varchar primary key
);

create table Chiodatore(
    utente varchar primary key, 

    foreign key (utente) references Utente(username),

    x varchar not null,
    unique(x) -- modella {id2} nel diagramma
);

create table Arrampicatore(
    utente varchar primary key, 

    foreign key (utente) references Utente(username),

    nome varchar, -- non c'è 'not null' perchè era [0..1]
    cognome varchar -- non c'è 'not null' perchè era [0..1]
);

create table Crea(
    nome_via varchar(100) not null,
    falesia varchar(100) not null,

    foreign key (nome_via, falesia) references Via(nome, falesia)

    chiodatore varchar not null,
    foreign key (chiodatore) references Chiodatore(utente)

    primary key (nome_via, falesia, chiodatore)
);

create table Salita(
    id integer primary key,
    data date not null,
        nome_via varchar(100) not null,
    falesia varchar(100) not null,

    foreign key (nome_via, falesia) references Via(nome, falesia),

    arrampicatore varchar not null,
    foreign key (arrampicatore) references arrampicatore(utente)  
);