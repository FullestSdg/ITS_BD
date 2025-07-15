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

-- Ma in teoria neanche esistono come dati (credo) | Anche se credo il mio metodo sia pur sempre sbagliato :/

-- 5. Quali sono i Progetti già terminati alla data odierna?

select fine 
from Progetto 
where progetto.fine <= current_date;

-- 6. Quali sono i nomi di tutti i Progetti ordinati in ordine crescente di data di inizio?

select nome, inizio
from Progetto 
order by progetto.inizio;

-- 7. Quali sono i nomi dei WP ordinati in ordine crescente (per nome)?

select nome, inizio 
from WP 
order by WP.inizio;

-- 8. Quali sono (distinte) le cause di assenza di tutti gli strutturati?

select distinct tipo 
from Assenza;

-- 9. Quali sono (distinte) le tipologie di attività di progetto di tutti gli strutturati? 

select distinct tipo 
from AttivitàProgetto; -- senza a accentata in caso

-- 10. Quali sono i giorni distinti nei quali del personale ha effettuato attività non progettuali di tipo ‘Didattica’? Dare il risultato in ordine crescente.

select distinct giorno 
from AttivitàNonProgettuale -- senza a accentata in caso
where AttivitàNonProgettuale.tipo = 'Didattica' -- senza a accentata in caso
order by AttivitàNonProgettuale.giorno; -- senza a accentata in caso