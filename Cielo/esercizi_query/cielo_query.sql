-- Interrogazioni

-- 1. Quali sono i voli (codice e nome della compagnia) la cui durata supera le 3 ore?

select codice, comp
from Volo
where durataMinuti > 180;

-- 2. Quali sono le compagnie che hanno voli che superano le 3 ore?

select comp 
from Volo 
where durataMinuti > 180;

-- 3. Quali sono i voli (codice e nome della compagnia) che partono dall’aeroporto con codice ‘CIA’?

select codice, comp 
from ArrPart
where ArrPart.partenza = 'CIA';

-- 4. Quali sono le compagnie che hanno voli che arrivano all’aeroporto con codice ‘FCO’?

select comp 
from ArrPart
where ArrPart.arrivo = 'FCO';

-- 5. Quali sono i voli (codice e nome della compagnia) che partono dall’aeroporto ‘FCO’ e arrivano all’aeroporto ‘JFK’?

select codice, comp 
from ArrPart 
where ArrPart.partenza = 'FCO' 
    and ArrPart.arrivo = 'JFK';

-- 6. Quali sono le compagnie che hanno voli che partono dall’aeroporto ‘FCO’ e atterrano all’aeroporto ‘JFK’?

select comp 
from ArrPart 
where ArrPart.partenza = 'FCO' 
    and ArrPart.arrivo = 'JFK';

-- 7. Quali sono i nomi delle compagnie che hanno voli diretti dalla città di ‘Roma’ alla città di ‘New York’?

select distinct comp
from ArrPart ap, luogoaeroporto lap, luogoaeroporto laa 
where lap.aeroporto = ap.partenza 
    and laa.aeroporto = ap.arrivo
    and lap.citta = 'Roma'
    and laa.citta = 'New York'

-- 8. Quali sono gli aeroporti (con codice IATA, nome e luogo) nei quali partono voli della compagnia di nome ‘MagicFly’?




-- 9. Quali sono i voli che partono da un qualunque aeroporto della città di ‘Roma’ e atterrano ad un qualunque aeroporto della città di ‘New York’? Restituire: codice del volo, nome della compagnia, e aeroporti di partenza e arrivo.


-- 11

select * 
from ArrPart ao, compagnia c 
where ap.comp = c.nom 
    and c.annoFondaz is not null;