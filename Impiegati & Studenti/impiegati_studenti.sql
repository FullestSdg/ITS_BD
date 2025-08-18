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
    cf CodiceFiscale primary key,

    foreign key (cf) references Persona(cf)

);

create table Donna (
    maternita IntGEZ not null,
    cf CodiceFiscale primary key,

    foreign key (cf) references Persona(cf)
);

create table PosizioneMilitare (
    nome Stringa primary key,

    foreign key (nome) references Uomo(cf)
);

create table Impiegato (
    cf CodiceFiscale primary key,
    stipendio RealGZ not null,

    foreign key (cf) references Persona(cf)
);

create table Studente (
    cf CodiceFiscale primary key,
    matricola IntGZ not null,

    foreign key (cf) references Persona(cf)
);

create table Direttore (
    cf CodiceFiscale primary key,
    stipendio RealGZ not null,

    foreign key (cf) references Persona(cf),
    foreign key (stipendio) references Impiegato(stipendio)
);

create table Segretario (
    cf CodiceFiscale primary key,
    stipendio RealGZ not null,

    foreign key (cf) references Persona(cf),
    foreign key (stipendio) references Impiegato(stipendio)
);

create table Progettista (
    cf CodiceFiscale primary key,
    stipendio RealGZ not null,

    foreign key (cf) references Persona(cf),
    foreign key (stipendio) references Impiegato(stipendio)
);

create table Reponsabile (
    cf CodiceFiscale primary key,
    stipendio RealGZ not null,

    foreign key (cf) references Persona(cf),
    foreign key (stipendio) references Impiegato(stipendio)
);

create table Progetto (
    nome varchar not null,
    id integer primary key

    foreign key (id) references Responsabile(cf)
); 
