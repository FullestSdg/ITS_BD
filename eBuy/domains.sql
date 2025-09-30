create domain Stringa as varchar; 

create domain Voto as integer
	check (value between 0 and 5);

create domain RealGZ as real 
    check (value > 0);

create domain RealGEZ as real
    check (value >= 0);

create domain IntGEZ as integer 
    check (value >= 0);

create domain IntGE2 as integer 
    check (value >= 2);

create domain URL as text; -- https://stackoverflow.com/questions/219569/best-database-field-type-for-a-url

