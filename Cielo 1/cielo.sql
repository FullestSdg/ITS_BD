begin transaction;

set constraint all deferred;

create domain PosInteger as integer
    default 0
    check (value >= 0);

create domain StringaM as varchar(100);

create domain CodIATA as char(3);

create table Compagnia (
    nome StringaM not null,
    annoFondaz PosInteger,

    primary key (nome)
);

create table Volo (
    codice PosInteger not null,
    comp StringaM not null,
    durataMinuti PosInteger not null,

    primary key (codice, comp),
    foreign key (comp) references Compagnia(nome),

    -- Posticipo la definizione della foreign key (codice, comp) verso ArrPart per evitare errori
);

-- foreign key di volo posticipata per evitare errori
alter table volo add constraint volo_arrpart_fk
foreign key (codice, comp) references ArrPart(codice, comp) deferrable;

create table Aeroporto (
    codice CodIATA not null,
    nome StringaM not null,

    -- posticipo la definizione della FK verso luogoaeroporto,
    -- che ancora non esiste

    primary key (codice)
);


create table LuogoAeroporto (
    aeroporto CodIATA not null,
    città StringaM not null,
    nazione StringaM not null,

    primary key (aeroporto),
    foreign key (aeroporto) references Aeroporto(codice) deferrable on delete cascade
);

alter table Aeroporto add constraint aeroporto_luogoaeroporto_fk
foreign key (codice) references LuogoAeroporto(aeroporto) deferrable on delete cascade;

create table ArrPart (
    codice PosInteger not null,
    comp StringaM not null,
    arrivo CodIATA not null,
    partenza CodIATA not null,

    primary key (codice, comp),
    foreign key (codice, comp) references Volo(codice, comp),
    foreign key (partenza) references Aeroporto(codice),
    foreign key (arrivo) references  Aeroporto(codice)
);

commit;







