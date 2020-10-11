-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-10-10 23:55:35.206

-- tables
-- Table: godziny
CREATE TABLE firma.godziny (
    id_godziny Serial  NOT NULL,
    data date  NOT NULL,
    liczba_godzin int  NOT NULL,
    numer_tygodnia int  NOT NULL,
    numer_miesiaca int  NOT NULL,
    id_pracownika Serial  NOT NULL,
    CONSTRAINT godziny_pk PRIMARY KEY (id_godziny)
);

CREATE INDEX godziny_idx_1 on firma.godziny (liczba_godzin ASC);

-- Table: pensja_stanowisko
CREATE TABLE firma.pensja_stanowisko (
    id_pensji Serial  NOT NULL,
    stanowisko varchar(255)  NOT NULL,
    kwota Float  NOT NULL,
    CONSTRAINT pensja_stanowisko_pk PRIMARY KEY (id_pensji)
);

CREATE INDEX pensja_stanowisko_idx_1 on firma.pensja_stanowisko (kwota ASC);

-- Table: pracownicy
CREATE TABLE firma.pracownicy (
    id_pracownika Serial  NOT NULL,
    imie varchar(255)  NOT NULL,
    nazwisko varchar(255)  NOT NULL,
    adres varchar(255)  NOT NULL,
    telefon varchar(255)  NOT NULL,
    CONSTRAINT pracownicy_pk PRIMARY KEY (id_pracownika)
);

-- Table: premia
CREATE TABLE firma.premia (
    id_premii Serial  NOT NULL,
    rodzaj varchar(255)  NOT NULL,
    kwota int  NOT NULL,
    CONSTRAINT premia_pk PRIMARY KEY (id_premii)
);

CREATE INDEX premia_idx_1 on firma.premia (kwota ASC);

-- Table: producenci
CREATE TABLE sklep.producenci (
    id_producenta Serial  NOT NULL,
    nazwa_produktu Varchar(255)  NOT NULL,
    mail Varchar(255)  NOT NULL,
    telefon Varchar(255)  NOT NULL,
    CONSTRAINT producenci_pk PRIMARY KEY (id_producenta)
);

CREATE INDEX producenci_idx_1 on sklep.producenci (nazwa_produktu ASC);

-- Table: produkty
CREATE TABLE sklep.produkty (
    id_produktu Serial  NOT NULL,
    nazwa_produktu Varchar(255)  NOT NULL,
    Cena int  NOT NULL,
    id_producenta int  NOT NULL,
    CONSTRAINT produkty_pk PRIMARY KEY (id_produktu)
);

CREATE INDEX produkty_idx_1 on sklep.produkty (Cena ASC);

-- Table: wynagrodzenie
CREATE TABLE firma.wynagrodzenie (
    id_wynagrodzenia Serial  NOT NULL,
    data date  NOT NULL,
    id_pracownika Serial  NOT NULL,
    id_premii int  NOT NULL,
    id_pensji int  NOT NULL,
    id_godziny int  NOT NULL,
    CONSTRAINT wynagrodzenie_pk PRIMARY KEY (id_wynagrodzenia)
);

-- Table: zamowienia
CREATE TABLE sklep.zamowienia (
    id_zamowienia Serial  NOT NULL,
    ilosc int  NOT NULL,
    id_produktu int  NOT NULL,
    CONSTRAINT zamowienia_pk PRIMARY KEY (id_zamowienia)
);

CREATE INDEX zamowienia_idx_1 on sklep.zamowienia (ilosc ASC);

-- foreign keys
-- Reference: godziny_pracownicy (table: godziny)
ALTER TABLE firma.godziny ADD CONSTRAINT godziny_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES firma.pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: produkty_producenci (table: produkty)
ALTER TABLE sklep.produkty ADD CONSTRAINT produkty_producenci
    FOREIGN KEY (id_producenta)
    REFERENCES sklep.producenci (id_producenta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_godziny (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_godziny
    FOREIGN KEY (id_godziny)
    REFERENCES firma.godziny (id_godziny)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_pensja_stanowisko (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_pensja_stanowisko
    FOREIGN KEY (id_pensji)
    REFERENCES firma.pensja_stanowisko (id_pensji)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_pracownicy (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_pracownicy
    FOREIGN KEY (id_pracownika)
    REFERENCES firma.pracownicy (id_pracownika)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: wynagrodzenie_premia (table: wynagrodzenie)
ALTER TABLE firma.wynagrodzenie ADD CONSTRAINT wynagrodzenie_premia
    FOREIGN KEY (id_premii)
    REFERENCES firma.premia (id_premii)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: zamowienia_produkty (table: zamowienia)
ALTER TABLE sklep.zamowienia ADD CONSTRAINT zamowienia_produkty
    FOREIGN KEY (id_produktu)
    REFERENCES sklep.produkty (id_produktu)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

