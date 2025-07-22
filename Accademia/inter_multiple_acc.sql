-- 1. Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome ‘Pegasus’?

select nome, inizio, fine
from WP.progetto
where progetto.nome = 'Pegasus';


-- versione giusta sotto

select *
from progetto p, wp 
where wp.progetto = p.id
    and p.nome = 'Pegasus';

-- 2. Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno una attività nel progetto ‘Pegasus’, ordinati per cognome decrescente?

select pers.nome, pers.cognome, pers.posizione
from persona pers, progetto prog, attivitaprogetto ap
where ap.persona = pers.id 
    and ap.progetto = prog.id;
    and prog.nome = 'Pegasus'
order by pers.cognome desc;

-- 3. Quali sono il nome, il cognome e la posizione degli strutturati che hanno più di una attività nel progetto ‘Pegasus’ ?

select distinct pers.nome, pers.cognome, pers.posizione
from persona pers, progetto prog, attivitaprogetto ap1, attivitaprogetto ap2
where prog.nome = 'Pegasus'
    and ap1.persona = pers.id
    and ap2.persona = pers.id
    and ap1.progetto = prog.id 
    and ap2.progetto = prog.id
    and ap1.id <> ap2.id;

-- 8. Quali sono il nome e il cognome degli strutturati che nello stesso giorno hanno sia attività progettuali che attività non progettuali?

select distinct p.nome, p.cognome
from persona p, attivitaprogetto ap, attivitanonprogettuale anp;
where ap.giorno = anp.giorno 
    and ap.persona = p.id 
    and anp.persona = p.id;