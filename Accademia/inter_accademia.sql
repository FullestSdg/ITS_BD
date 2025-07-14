-- 1. Quali sono i cognomi distinti di tutti gli strutturati?

select distinct cognome 
from Persona;

-- Io ho fatto delle persone e infatti non sono molto sicuro di questa cosa

-- 2. Quali sono i Ricercatori (con nome e cognome)?

select nome, cognome
from Persona
where persona.posizione = 'Ricercatore';

-- 3. Quali sono i Professori Associati il cui cognome comincia con la lettera ‘V’? 

select nome, cognome 
from Persona 
where persona.posizione = 'Professore Associato'
AND cognome like 'V%';

-- 4. Quali sono i Professori (sia Associati che Ordinari) il cui cognome comincia con la lettera ‘V’?

select nome, cognome 
from Persona 
where persona.posizione = 'Professore Associato'
AND cognome like 'V%';

select nome, cognome 
from Persona 
where persona.posizione = 'Professore Ordinario'
AND cognome like 'V%';

-- Ma in teoria neanche esistono come dati (credo) | E' pure sempre sbagliato il mio metodo :/

-- 5. Quali sono i Progetti già terminati alla data odierna?

select fine 
from Progetto 
where progetto.fine <= current_date;

-- 6. Quali sono i nomi di tutti i Progetti ordinati in ordine crescente di data di inizio?


