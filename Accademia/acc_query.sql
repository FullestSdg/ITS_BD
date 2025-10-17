-- 1) Quanti sono gli strutturati di ogni fascia?

select Persona.posizione, count(posizione) as numero
    from Persona
    group by Persona.posizione;

-- 2) Quanti sono gli strutturati con stipendio >= 40000

select count(stipendio)
    from Persona 
    where stipendio >= 40000;

-- 3) Quanti sono i progetti già finiti che superano il budget di 50000?

select count(budget)
    from Progetto
    where budget > 50000 and fine < CURRENT_TIMESTAMP;


-- 4) Qual è la media, il massimo e il minimo delle ore delle attività relative al progetto ‘Pegasus’?

select avg(oreDurata) as media_ore, max(oreDurata) as massimo_ore, min(oreDurata) as minimo_ore 
    from AttivitaProgetto, Progetto
    where AttivitaProgetto.progetto = Progetto.id and Progetto.nome = 'Pegasus';

-- 5) Quali sono le medie, i massimi e i minimi delle ore giornaliere dedicate al progetto ‘Pegasus’ da ogni singolo docente?

select avg(oreDurata) as media_ore, max(oreDurata) as massimo_ore, min(oreDurata) as minimo_ore 
    from Persona, Progetto, AttivitaProgetto 
    where AttivitaProgetto.persona = Persona.id and Progetto.nome = 'Pegasus';

-- 6) Qual è il numero totale di ore dedicate alla didattica da ogni docente?

select Persona.nome, sum(oreDurata) as numero_totale_ore
    from Persona, AttivitaNonProgettuale 
    where AttivitaNonProgettuale.persona = Persona.id and AttivitaNonProgettuale.tipo = 'Didattica'
    group by Persona.nome;

-- 7) Qual è la media, il massimo e il minimo degli stipendi dei ricercatori?

select avg(stipendio) as media_stipendio, max(stipendio) as max_stipendio, min(stipendio) as min_stipendio
    from Persona
    where Persona.posizione = 'Ricercatore';

-- 8) Quali sono le medie, i massimi e i minimi degli stipendi dei ricercatori, dei professori associati e dei professori ordinari?

select Persona.posizione, avg(stipendio) as media_stipendio, max(stipendio) as max_stipendio, min(stipendio) as min_stipendio
    from Persona 
    group by Persona.posizione
    order by Persona.posizione;

-- 9) Quante ore ‘Ginevra Riva’ ha dedicato ad ogni progetto nel quale ha lavorato?

select Progetto.nome, sum(oreDurata) as ore_dedicate
    from Persona, Progetto, AttivitaProgetto
    where AttivitaProgetto.persona = Persona.id and AttivitaProgetto.progetto = Progetto.id and Persona.nome = 'Ginevra' and Persona.cognome = 'Riva'
    group by Progetto.nome; 

