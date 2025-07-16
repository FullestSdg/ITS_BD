-- 1. Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome ‘Pegasus’?

select nome, inizio, fine
from WP.progetto
where progetto.nome = 'Pegasus';

-- 2. Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno una attività nel progetto ‘Pegasus’, ordinati per cognome decrescente?

select persona 
from AttivitaProgetto.progetto
where progetto.nome = 'Pegasus'
order by persona.cognome;