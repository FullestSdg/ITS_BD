-- 1. Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome ‘Pegasus’?

select nome, inizio, fine
from WP.progetto
where progetto.nome = 'Pegasus';

-- 2. Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno una attività nel progetto ‘Pegasus’, ordinati per cognome decrescente?

select distinct p.nome, p.cognome, p.posizione
from Persona as p, Progetto as pr, AttivitaProgetto as a1, AttivitaProgetto as a2
where pr.id = a2.progetto and a1.persona = p.id and a2.persona = p.id and a1.progetto = pr.id and a1.id <> a2.id and pr.nome = 'Pegasus';

-- 3. Quali sono il nome, il cognome e la posizione degli strutturati che hanno più di una attività nel progetto ‘Pegasus’?

select distinct p.nome, p.cognome, p.posizione
from Persona as p, Progetto as pr, AttivitaProgetto as ap
where pr.nome = 'Pegasus'

-- Mi sono arreso, chiedo scusa :(

