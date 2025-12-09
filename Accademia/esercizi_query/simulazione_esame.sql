-- 1. Elencare tutti i progetti la cui fine è successiva al
-- 2023-12-31.

select id progetto.nome as progetti_dopo_data
    from Progetto 
    where Progetto.fine > '2023-12-31';


-- 2. Contare il numero totale di persone per ciascuna posizione
-- (Ricercatore, Professore Associato, Professore Ordinario).

select Persona.posizione, count(posizione) as numero_totale
    from Persona
    group by Persona.posizione;

-- 3. Restituire gli id e i nomi delle persone che hanno almeno
-- un giorno di assenza per "Malattia"

select Persona.id, persona.nome 
    from Persona, Assenza
    where (Persona.id = Assenza.id) AND (Assenza.tipo = 'Malattia')
group by Persona.id, Persona.nome;

-- 4. Per ogni tipo di assenza, restituire il numero complessivo
-- di occorrenze.

select Assenza.tipo as tipo_assenza, count(*) as numero_assenze
    from Assenza
    group by Assenza.tipo;


-- 5. Calcolare lo stipendio massimo tra tutti i "Professori
-- Ordinari".

select --persona.posizione, 
        max(stipendio) as stipendio_massimo
    from Persona
    where Persona.posizione = 'Professore Ordinario'
    --group by Persona.posizione;

-- 6. Quali sono le attività e le ore spese dalla persona con id 1
-- nelle attività del progetto con id 4, ordinate in ordine
-- decrescente. Per ogni attività, restituire l’id, il tipo e il
-- numero di ore.

select Persona.id as persona, AttivitaProgetto.id as attività_id, AttivitaProgetto.oreDurata as numero_ore
    from AttivitaProgetto, Persona 
    where (Persona.id = 1) AND (AttivitaProgetto.id = 4)
    order by oreDurata desc;

-- 7. Quanti sono i giorni di assenza per tipo e per persona. Per
-- ogni persona e tipo di assenza, restituire nome, cognome,
-- tipo assenza e giorni totali.

select p.id as id_persona, p.nome, p.cognome, a.tipo as tipo_assenza, count(*)
    from Assenza a, Persona  p
    where a.persona = p.id
    group by p.id, p.nome, p.cognome, a.tipo;

-- 8. Restituire tutti i “Professori Ordinari” che hanno lo
-- stipendio massimo. Per ognuno, restituire id, nome e
-- cognome

select id, nome, cognome, stipendio
    from Persona
    where (posizione = 'Professore Ordinario') 
    AND Persona.stipendio = (
        select max(stipendio)
        from Persona
        where posizione = 'Professore Ordinario'
    );

-- OPPURE    

WITH mspo as (
    select max(stipendio) as max_stipendio
    from Persona
    where posizione = 'Professore Ordinario'
)

select * 
from persona p, mspo 
where p.stipendio = mspo.max_stipendio
AND
p.posizione = 'Professore Ordinario';

-- 9. Restituire la somma totale delle ore relative alle attività
-- progettuali svolte dalla persona con id = 3 e con durata
-- minore o uguale a 3 ore.

select Persona.id, sum(AttivitaProgetto.oreDurata) as somma_totale
    from Persona, AttivitaProgetto
    where (Persona.id = 3) AND (AttivitaProgetto.oreDurata <= 3)
    group by Persona.id;

-- 10. Restituire gli id e i nomi delle persone che non hanno
-- mai avuto assenze di tipo "Chiusura Universitaria"

select Persona.id as id_persona, Persona.nome as nome_persona
    from Persona, Assenza 
    where NOT EXISTS (Assenza.tipo = 'Chiusura Universitaria')
    group by Persona.id, Persona.nome, Persona.cognome;