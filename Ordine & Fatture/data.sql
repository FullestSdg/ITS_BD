insert into StatoOrdine(nome)
values 
('In preparazione'),
('Inviato');

insert into StatoOrdine(id, nome)
values
(3, 'Da saldare'),
(4, 'Saldato');

insert into Nazione(nome)
values
('n1'),
('n2');

insert into Regione (nome, nazione)
values 
('Nord', 'A'),
('Est', 'B'),
('Sud', 'A'),
('Sud', 'B');

insert into Citta (nome, regione, nazione)
values 
('X', 'Nord', 'A'),
('Y', 'Est', 'B'),
('W', 'Sud', 'A'),
('Z', 'Sud', 'B');

insert into Direttore (cf, nome, cognome, anni_servizio, data_nascita, cit_nascita)
values 
('AAABBB67D19H501U', 'Franco', 'Cascio', 4, current_date - interval '32 year', 3);
