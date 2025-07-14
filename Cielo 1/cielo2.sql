begin transaction;
set constraint all deferred;

insert into luogoaeroporto (aeroporto, città, nazione) values 
    ('FCO', 'Fiumicino', 'Italia')
insert into Aeroporto (codice, nome) values ('FCO', 'Aeroporto Leonardo da Vinci');

insert into luogoaeroporto(aeroporto, città, nazione) values 
('FCO', 'Roma', 'Italia'),
('MXP', 'Roma', 'Italia');

insert into compagnia (nome, annofondaz)
values 
('WizardAir',2006),
('Apitalia', 1987);

insert into volo (codice, comp, durataMinuti)
values 
(101, 'WizardAir', 55),
(102, 'Apitalia', 50);

insert into arrpart (codice,comp, partenza, arrivo)
values 
(101, 'WizardAir', 'FCO', 'MXP')
(102, 'Apitalia', 'FCO', 'MXP')

commit;