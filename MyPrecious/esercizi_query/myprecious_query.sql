-- Elencare il nome di tutte le opere realizzate tra il 1400 e il 1600 (estremi inclusi), ordinate in ordine cronologico.

select op.nome, op.anno_realizzazione
    from Opera as op 
    where (op.anno_realizzazione >= 1400)
        AND (op.anno_realizzazione <= 1600)
    order by op.anno_realizzazione;

-- Per ogni nazione, restituire il nome della nazione e il numero totale di città registrate nel database.

select count(c.id) as numero_citta, n.nome
    from Nazione as n, Città as c
    where n.nome = c.nazione 
    group by n.nome;

-- Restituire il nome e la data di nascita degli artisti nati in una città che appartiene alla regione 'Toscana'.

select ar.nome, ar.data_nascita 
	from Artista as ar, Città as c
	where ar.città_nascita = c.id
		AND c.regione = 'Toscana';

-- Calcolare il numero totale di opere associate alla corrente artistica 'Rinascimento'.

select count(o.id) as numero_opere 
	from Opera as o, CorrenteArtistica as ca, op_corr as opc
	where opc.opera = o.id
		AND opc.correnteartistica = ca.nome 
		AND ca.nome = 'Rinascimento';

-- piu semplicemente

select count(*)
from Opera
where correnteartistica = 'Rinascimento';

-- Artisti in Mostra: Elencare il nome degli artisti che hanno almeno un'opera esposta in una mostra di tipo 'Temporanea' che termina entro il '2027-12-31'.

select distinct ar.nome
    from Artista as ar, op_aut as oa, Espone as e, Temporanea as temp 
    where ar.id = oa.artista 
        AND oa.opera = e.opera 
        AND e.esposizione = temp.esposizione 
        AND temp.fine <= '2027-12-31';

-- Produttività per Città: Per ogni città di nascita, restituire il nome della città e il numero totale di opere realizzate dagli artisti nati in quella specifica città.

select c.nome as città, count(oa.opera) as numero_totale_opere 
from città as c, artista as a, op_aut as oa
where c.id = a.città_nascita 
    AND a.id = oa.artista 
group by c.id, c.nome;

-- Capolavori Italiani: Trovare l'id e il nome dell'opera più recente (anno di realizzazione più alto) tra quelle appartenenti alla categoria 'Pittura' e realizzate da artisti nati in 'Italia'.

SELECT O.id, O.nome, O.anno_realizzazione
FROM Opera O, op_aut OA, Artista A, Città C
WHERE O.id = OA.opera             -- Ponte Opera-Autore
  AND OA.artista = A.id           -- Ponte Autore-Artista
  AND A.città_nascita = C.id       -- Ponte Artista-Città
  AND O.categoria = 'Pittura'      -- Filtro Categoria
  AND C.nazione = 'Italia'         -- Filtro Nazione
  AND O.anno_realizzazione = (
      -- Subquery per trovare l'anno massimo SOLO per i dipinti italiani
      SELECT MAX(O2.anno_realizzazione)
      FROM Opera O2, op_aut OA2, Artista A2, Città C2
      WHERE O2.id = OA2.opera 
        AND OA2.artista = A2.id 
        AND A2.città_nascita = C2.id
        AND O2.categoria = 'Pittura'
        AND C2.nazione = 'Italia'
  );

-- Città d'Arte: Restituire il nome delle città che hanno dato i natali a più di 2 artisti presenti nel database.

