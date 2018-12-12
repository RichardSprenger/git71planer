CREATE TABLE Benutzer (
	id_Benutzer SERIAL PRIMARY KEY,
	benutzer_vorname varchar(32) not null,
	benutzer_nachname varchar(32) not null,
	/*1 = Schüler, 2 = Lehrer, 3 = Admin*/
	benutzer_rechte bigint not null unsigned
);

CREATE TABLE Fach (
	id_Fach SERIAL PRIMARY KEY,
	fach_id_benutzer bigint unsigned not null,
	fach_name varchar(32),
	FOREIGN KEY (fach_id_benutzer) REFERENCES Benutzer (id_Benutzer)
);

CREATE TABLE Aufgabe (
	id_Aufgabe SERIAL PRIMARY KEY,
	/*1 = Buch, 2 = Arbeitsbaltt, 3 = PDF, 4 = Arbeitsheft, 5 = Tafel, 6 = Sonstiges*/
	aufgabe_medium bigint not null unsigned,
	aufgabe_seite bigint unsigned,
	aufgabe_nummer bigint unsigned,
	aufgabe_beschreibung TEXT,
	aufgabe_datum date not null,
	aufgabe_id_fach bigint not null unsigned, 
	FOREIGN KEY (aufgabe_id_fach) REFERENCES Fach (id_fach) 
);

CREATE TABLE AufgabeBenutzer (
	ab_id_aufgabe SERIAL,
	ab_id_benutzer SERIAL,
	ab_zeit bigint unsigned,
	PRIMARY KEY (ab_id_aufgabe, ab_id_benutzer),
	FOREIGN KEY (ab_id_aufgabe) REFERENCES Aufgabe (id_Aufgabe),
	FOREIGN KEY (ab_id_benutzer) REFERENCES Benutzer (id_Benutzer)
);