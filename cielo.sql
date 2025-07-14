create domain PosInteger as integer
    default 0
    check (value >= 0);

create domain StringaM as varchar(100);

create domain CodIATA as char(3);

create table Volo (
    codice PosInteger not null,
    comp StringaM not null,
    durataMinuti PosInteger,

    primary key (codice, comp),
    foreign key (comp) references Compagnia(nome),
    foreign key (codice, comp) references ArrPart(codice, comp)
);

create table ArrPart (
    codice PosInteger not null,
    comp StringaM not null,
    arrivo CodIATA,
    partenza CodIATA,

    primary key (codice, comp),
    foreign key (codice, comp) references Volo(codice, comp),
    foreign key (arrivo) references Aeroporto(codice),
    foreign key (partenza) references Aeroporto(codice )
);

create table Aeroporto (
    codice CodIATA not null,
    nome StringaM,

    primary key (codice),
    foreign key (codice) references LuogoAeroporto(aeroporto)
);

create table LuogoAeroporto (
    aeroporto CodIATA not null,
    città StringaM,
    nazione StringaM,

    primary key (aeroporto),
    foreign key (aeroporto) references Aeroporto(codice)
);

create table Compagnia (
    nome StringaM not null,
    annoFondaz PosInteger null,

    primary key (nome)
);


-- Interrogazioni

-- 1 
select codice, comp
from Volo
where durataMinuti > 180;

-- 2
select comp 
from Volo 
where durataMinuti > 180;






