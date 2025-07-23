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

create type StatoOrdine as 
    enum ('in preparazione', 'inviato', 'da saldare', 'saldato');

create domain PartitaIVA as char(11);

create domain CodiceFiscale as char(16);