create type Indirizzo as (
    via varchar,
    civico varchar
);

create domain RealGEZ as real
    check (value >= 0);

create domain RealZO as real 
    check (value <= 1 and value >= 0);

create domain IntGEZ as integer 
    check (value >= 0);

create domain Email as varchar;

create domain Telefono as varchar;

create type StatoOrdineEnum as 
    enum ('in preparazione', 'inviato', 'da saldare', 'saldato');

create domain PartitaIVA as char(11);

create domain CodiceFiscale as char(16);

create table Nazione (
    nome varchar primary key
);

create table Regione (
    nome varchar not null,
    nazione varchar not null,

    primary key (nome, nazione),
    foreign key (nazione) references nazione(nome)
);

create table Citta (
    id integer primary key,
    nome varchar not null,
    regione varchar not null,
    nazione varchar not null,
    
    unique (nome, regione, nazione),
    foreign key (regione, nazione) references regione(nome, nazione)
);



create table Direttore (
    nome varchar not null,
    cognome varchar not null,
    cf CodiceFiscale primary key,
    anni_servizio IntGEZ not null,
    data_nascita date not null,
    citta integer not null,

    -- accorpa l'associazione cit_nasc
    foreign key (citta) references citta(id)
);

create table Dipartimento (
    nome varchar primary key,
    indirizzo Indirizzo not null,
    citta integer not null,
    direttore varchar not null,

    -- accorpa l'assocazione dip_cit
    foreign key (citta) references citta(id),

    -- accorpa l'assocazione dip_dir
    foreign key (direttore) references direttore(cf)
);

create table Fornitore (
    ragione_sociale varchar not null,
    partita_iva PartitaIVA primary key,
    indirizzo Indirizzo not null,
    telefono Telefono not null,
    email Email not null,
    citta integer not null,

    -- accorpa l'assocazione cit_forn
    foreign key (citta) references citta(id)
);

create table StatoOrdine (
    nome varchar primary key 
);

create table Ordine (
    id integer primary key,
    data_stipula date not null,
    imponibile RealGEZ not null,
    aliquota RealZO not null,
    descrizione varchar not null,
    dipartimento varchar not null,
    fornitore varchar not null,
    stato_ordine varchar not null,

    -- accorpa l'assocazione dip_ord
    foreign key (dipartimento) references dipartimento(nome),

    -- accorpa l'associazione forn_ord
    foreign key (fornitore) references fornitore(partita_iva),

    -- accorpa l'associazione stat_ord 
    foreign key (stato_ordine) references StatoOrdine(nome)
);
