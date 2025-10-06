-- 1) Quanti sono gli strutturati di ogni fascia?

select Persona.posizione, count(posizione) as numero
    from Persona
    group by Persona.posizione;

-- 2) Quanti sono gli strutturati con stipendio >= 40000

select count(stipendio)
    from Persona 
    where stipendio >= 40000

