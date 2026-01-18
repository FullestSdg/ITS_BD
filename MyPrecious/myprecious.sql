create domain Stringa as varchar;

create domain RealGEZ as real
    check (value >= 0);

create table Città(
    nome Stringa not null,
    regione Stringa not null,
    nazione Stringa not null,
    id integer not null,

    unique(id),
    primary key (nome, regione, nazione),

    foreign key (regione, nazione) references Regione(nome, nazione)
);

create table Regione(
    nome Stringa not null,
    nazione Stringa not null,

    primary key (nome, nazione),
    
    foreign key (nazione) references to Nazione(nome)
);

create table Nazione(
    nome Stringa primary key
);

create table Artista(
    id integer primary key,
    nome Stringa not null,
    data_nascita date not null,
    data_morte date,
    città_nascita integer not null,

    foreign key (città_nascita) references to Città(id),

    check (data_morte is null or data_nascita < data_morte)
);

create table Tecnica(
    nome Stringa primary key
);

create table Categoria(
    nome Stringa primary key
);

create table CorrenteArtistica(
    nome Stringa primary key
);

create table Opera(
    id integer primary key,
    nome Stringa not null,
    anno_realizzazione integer not null,
    tecnica integer not null,
    categoria integer not null,
    correnteartistica integer not null,

    foreign key (tecnica) references to Tecnica(nome)
    foreign key (categoria) references to Categoria(nome)
);

create table op_aut(
    opera integer not null,

    foreign key (opera) references to Opera(id),

    artista integer not null,

    foreign key (artista) references to Artista(id),

    primary key (opera, artista)
);

create table op_corr(
    opera integer not null,

    foreign key (opera) references to Opera(id),

    correnteartistica not null,

    foreign key (correnteartistica) references to CorrenteArtistica(nome),

    primary key (opera, correnteartistica)
);

create table Esposizione(
    id integer primary key,
    nome Stringa not null,
    inizio date not null,
);

create table Espone(
    inizio date  not null,
    fine date,

    check (fine is null or inizio <= fine)

    opera intenger not null,

    foreign key (opera) references to Opera(id),

    esposizione integer not null,

    foreign key (esposizione) references to Esposizione(id),

    primary key(opera, esposizione)
);

create table Permanente(
    esposizione integer primary key,

    foreign key (esposizione) references to Esposizione(id)
);

create table Temporanea(
    tema Stringa not null,
    fine date not null,
    prezzo RealGEZ not null,

    esposizione integer primary key,

    foreign key (esposizione) references to Esposizione(id)
);

create table temp_scelta(
    temporanea integer not null,

    foreign key (temporanea) references to Temporanea(esposizione),

    extendedaccess integer not null,

    foreign key (extendedaccess) references to ExtendedAccess(biglietto),

    primary key(temporanea, extendedaccess)
);

create table Biglietto(
    id integer primary key,
    istante_acquisto timestamp not null,
    data_validità date not null,
    tariffa stringa not null,
    
    foreign key (tariffa) references to Tariffa(nome)
);

create table Tariffa(
    nome Stringa primary key,
    prezzo_base RealGEZ not null,

);

create table ExtendedAccess(
    biglietto integer primary key,

    foreign key (biglietto) references to Biglietto(id)
);

create table Standard(
    biglietto integer primary key,

    foreign key (biglietto) references to Biglietto(id)
);



-- LE ASSOCIAZIONI TIPO TEMP_SCELTA VA CREATA LA TABELLA PERCHE'
-- HANNO I VINCOLI DI MOLTEPLICITA' CON *

-- LE FOREIGN KEY VANNO CREATE DENTRO LA TABELLA COLLEGATA CON
-- VINCOLO DI MOLTEPLICITA' 1..1

-- LE SOTTOCLASSI DISJOINT, COMPLETE DIVENTANO ASSOCIAZIONI A
-- CLASSI CON VINCOLI 0..1 VERSO LE SOTTOCLASSI E 1..1 {ID}
-- VERSO LA SUPERCLASSE

