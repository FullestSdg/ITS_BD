create table Categoria (
    nome Stringa primary key,
    super Stringa, -- non è not null perchè può non avere una super-categoria

    foreign key (super) references categoria(nome),
    check (super is null or nome <> super)
);

create table MetodoDiPagamento (
    nome Stringa primary key,
);

create table Utente (
    username Stringa primary key,
    registrazione timestamp not null,
);

create table Privato (
    username Stringa primary key,

    foreign key (username) references utente(username)
);

create table VenditoreProf (
    username Stringa primary key,
    vetrina URL not null,

    foreign key (username) references utente(username)
);

create table Met_post (
    postoggetto integer not null,
    metodo Stringa not null,

    foreign key (postggetto) references postoggetto(id),
    foreign key (metodo) references metododipagamento(nome),

    primary key (postggetto, metodo)
);

create table PostOggetto (
    id serial primary key,
    descrizione Stringa not null,
    pubblicazione timestamp not null,
    ha_feedback boolean not null,
    voto Voto,
    commento Stringa,
    istante_feedback timestamp,

    unique (id, pubblica) -- chiave non minimale, server per la foreign key da postoggettonuovo

    -- vincoli di ennupla che implementano [V.PostOggetto.feedback]
    check (ha_feedback = true and voto is not null and istante_feedback is not null) or (ha_feedback = false and voto is null and istante_feedback is null and commento is null),

    pubblica Stringa not null,

    foreign key (pubblica) references utente(username)

    categoria Stringa not null,

    foreign key (categoria) references categoria(nome)
);

create table PostOggettoNuovo (
    postoggetto integer not null,

    foreign key (postoggetto, pubblica_nuovo) references postggetto(id, pubblica),

    anni_garanzia IntGE2 not null,
    pubblica_nuovo Stringa not null,

    foreign key (pubblica_nuovo) references venditoreprof(username),
);

create table PostOggettoUsato (
    postoggetto integer not null,
    anni_garanzia IntGEZ not null,
    condizione Condizione not null,

    foreign key (postoggetto) references postoggetto(id)
);

create table PostOggettoCompraloSubito (
    postoggetto integer not null,
    prezzo RealGZ not null,
    acquirente Stringa, -- accorpa l'associazione 'acquirente'
    istante_acquisto timestamp,
    check (
        (acquirente is null and istante_acquisto is null) or (acquirente is not null and istante_acquisto is not null)
    ),

    foreign key (acquirente) references privato(username)

    foreign key (postoggetto) references postoggetto(id)
);

create table PostOggettoAsta (
    postoggetto integer not null,
    prezzo_base RealGEZ not null,
    prezzo_base RealGZ not null,

    foreign key (postoggetto) references postoggetto(id)
);

create table Bid (
    codice serial primary key,
    privato Stringa not null,

    foreign key (privato) references privato(utente),

    asta integer not null,

    foreign key (asta) references postoggettoasta(postoggetto),

    istante timestamp not null,
    unique (asta, istante)
);
