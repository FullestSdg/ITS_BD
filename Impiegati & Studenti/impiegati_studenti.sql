create domain CodiceFiscale as char(16);

create domain IntGZ as integer 
    check (value > 0);

create domain RealGZ as real
    check (value > 0);

create domain IntGEZ as integer 
    check (value >= 0);

create domain Stringa as varchar; -- L'ho fatto solo per PosizioneMilitare dato che per sbaglio non l'ho cambiato


create table Persona (
    nome varchar not null,
    cognome varchar not null,
    cf CodiceFiscale primary key,
    nascita date not null
);

create table Uomo (

);

create table Donna (
    maternita IntGEZ not null
);

create table PosizioneMilitare (
    nome Stringa primary key
);

create table Impiegato (

);

create table Studente (

);

create table Direttore (

);

create table Segretario (

);

create table Progettista (

);

create table Reponsabile (

);

create table Progetto (
    nome varchar not null,
    id integer primary key
);
