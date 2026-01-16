-- 1. Quali sono le persone con stipendio di al massimo 40000
-- euro

select nome, cognome
    from Persona 
    where stipendio <= 40000;

-- 2. Quali sono i ricercatori che lavorano ad almeno un
-- progetto e hanno uno stipendio di al massimo 40000

select pe.nome, pe.cognome
    from Persona as pe, Progetto as pr
    where (pe.id = pr.id) 
        AND (pe.posizione = 'Ricercatore') 
        AND (pe.stipendio <= 40000);

-- 3. Qual è il budget totale dei progetti nel db 

select sum(Progetto.budget) as somma_budget
    from Progetto;

-- 4. Qual è il budget totale dei progetti a cui lavora ogni
-- persona. Per ogni persona restituire nome, cognome e
-- budget totale dei progetti nei quali è coinvolto.

select pe.nome, pe.cognome, sum(DISTINCT pr.budget) as somma_budget 
    from Persona as pe, AttivitaProgetto as ap, Progetto as pr 
    where pe.id = ap.persona 
        AND (ap.progetto = pr.id)
    group by pe.nome, pe.cognome;

-- 5. Qual è il numero di progetti a cui partecipa ogni
-- professore ordinario. Per ogni professore ordinario,
-- restituire nome, cognome, numero di progetti nei quali è
-- coinvolto

select count(Progetto) as numero_prog , pe.nome, pe.cognome 
    from Persona as pe, Progetto as pr, AttivitaProgetto as ap
    where pe.id = ap.persona 
        AND (ap.progetto = pr.id)
        AND pe.posizione = 'Professore Ordinario'
    group by pe.nome, pe.cognome;

-- 6. Qual è il numero di assenze per malattia di ogni
-- professore associato. Per ogni professore associato,
-- restituire nume, cognome e numero di assenze per
-- malattia

select count(a) as numero_assenze, pe.nome, pe.cognome 
    from Persona as pe, Assenza as a
    where a.persona = pe.id 
    group by pe.nome, pe.cognome;

-- 7. Qual è il numero totale di ore, per ogni persona, dedicate
-- al progetto con id ‘5’. Per ogni persona che lavora al
-- progetto, restituire nome, cognome e numero di ore totali
-- dedicate ad attività progettuali relative al progetto   

select sum(ap.oreDurata) as ore_totali, pe.nome, pe.cognome
    from Persona as pe, AttivitaProgetto as ap
    where (pe.id = ap.persona)
        AND ap.progetto = 1
    group by pe.id, pe.nome , pe.cognome;

-- 8. Qual è il numero medio di ore delle attività progettuali
-- svolte da ogni persona. Per ogni persona, restituire nome,
-- cognome e numero medio di ore delle sue attività
-- progettuali (in qualsivoglia progetto)

select avg(ap.OreDurata) as media_ore, pe.nome, pe.cognome 
    from Persona as pe, AttivitaProgetto as ap 
    where (pe.id = ap.persona)
    group by pe.nome, pe.cognome;
