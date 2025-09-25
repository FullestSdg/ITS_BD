create table StatoOrdine (
    id serial primary key,
    nome stringa not null,

    unique(nome)
);

create table Nazione (
    nome stringa primary key
);

create table Regione (
    nome stringa not null,
    nazione sringa not null,

    primary key (nome, nazione),
    foreign key (nazione) references nazione(nome)
);

create table Citta (
    id serial primary key,
    nome stringa not null,
    regione stringa not null,
    nazione stringa not null,

    unique(nome, regione, nazione)
);

create table Direttore (
    cf CodiceFiscale primary key,
    nome stringa not null,
    cognome stringa not null,
    anni_servizio IntGEZ not null,
    data_nascita date not null,
    cit_nasc integer not null,

    foreign key (cit_nasc) references citta(id)
);

create table Dipartimento (
    nome stringa primary key,
    indirizzo Indirizzo not null,
    dip_dir CodiceFiscale not null,

    foreign key (dip_dir) references direttore(CodiceFiscale), 

    dip cit integer not null,
    foreign key(dip_cit) references citta(id)
);

create table Fornitore (
    partita_iva PartitaIVA primary key,
    ragione_sociale stringa not null,
    indirizzo Indirizzo not null,
    telefono Telefono not null,
    email Email not null,
    foreign key (cit_forn) references citta(id)
);

create table ordine (
    codice serial primary key,
    data_stipula date not null,
    imponibile RealGEZ not null,
    aliquota RealZO not null,
    descrizione stringa not null,
    dip_ord stringa not null, 
    
    foreign key (dip_ord) references dipartimento(nome),

    stat_ord stringa not null,
    foreign key (start_ord) references StatoOrdine(nome),

    fornitore PartitaIVA not null,

    foreign key(fornitore) references(Partita_iva)
);

