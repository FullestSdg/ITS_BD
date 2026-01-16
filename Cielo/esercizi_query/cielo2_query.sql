-- 1. Quante sono le compagnie che operano (sia in arrivo che in partenza) nei diversi aeroporti?

select count(nome) as numero_compagnie
from Compagnia

-- 2. Quanti sono i voli che partono dall’aeroporto ‘HTR’ e hanno una durata di almeno 100 minuti?

select count(partenza) as numero_voli_partenza
from ArrPart, Volo 
    where ArrPart.partenza = 'HTR' and Volo.durataMinuti >= 100;

-- 3. Quanti sono gli aeroporti sui quali opera la compagnia ‘Apitalia’, per ogni nazione nella quale opera?

select LuogoAeroporto.nazione, count(nazione) as numero_aeroporti
from LuogoAeroporto, Compagnia 
    where Compagnia.nome = 'Apitalia'
group by LuogoAeroporto.nazione;

-- 4. Qual è la media, il massimo e il minimo della durata dei voli effettuati dalla compagnia ‘MagicFly’?

select avg(durataMinuti) as media_durata_volo, max(durataMinuti) as massimo_durata_volo, min(durataMinuti) as minimo_durata_volo
from Compagnia, Volo 
    where Volo.comp = Compagnia.nome and Compagnia.nome = 'MagicFly';

-- 5. Qual è l’anno di fondazione della compagnia più vecchia che opera in ognuno degli aeroporti?

select LuogoAeroporto.aeroporto, min(annoFondaz) as compagnia_piu_vecchia
from Compagnia, LuogoAeroporto
group by LuogoAeroporto.aeroporto; -- non sono sicuro se giusta 

-- 6. Quante sono le nazioni (diverse) raggiungibili da ogni nazione tramite uno o più voli?

select LuogoAeroporto.nazione, count(nazione) as numero_voli
from LuogoAeroporto, Volo, ArrPart 
    where Volo.codice = ArrPart.codice and LuogoAeroporto.aeroporto = ArrPart.arrivo 
group by LuogoAeroporto.nazione;

-- 7. Qual è la durata media dei voli che partono da ognuno degli aeroporti?

select ArrPart.partenza, avg(durataMinuti) as media_voli
from Volo, ArrPart
    where Volo.codice = ArrPart.codice and Volo.comp = ArrPart.comp
group by ArrPart.partenza; 

-- 8. Qual è la durata complessiva dei voli operati da ognuna delle compagnie fondate a partire dal 1950?

select Compagnia.nome, sum(durataMinuti) as durata_complessiva
from Volo, ArrPart, Compagnia
    where Volo.comp = Compagnia.nome and Compagnia.annofondaz > 1950
group by Compagnia.nome;