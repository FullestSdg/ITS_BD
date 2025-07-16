create domain RealGEZ as real 
    check (value >= 0);

create domain Stringa as varchar;

create type Indirizzo as (
    via Stringa,
    civico Stringa
); 

create table Impiegato(
    id integer primary key,
    nome Stringa not null,
    cognome Stringa not null,
    nascita date not null,
    stipendio RealGEZ not null 
);

create table Dipartimento(
    id integer primary key,
    nome Stringa not null,
    indirizzo Indirizzo
);

create table Progetto(
    id integer primary key,
    nome Stringa not null,
    budget RealGEZ not null
);

create table NumeroTelefono(
    telefono Stringa primary key
);