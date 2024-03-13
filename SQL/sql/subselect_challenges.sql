# Schreibe eine Abfrage, um alle Mitarbeiter zurückzugeben, die mehr verdienen als der Durchschnittslohn aller Mitarbeiter.
SELECT * FROM Mitarbeiter m WHERE m.Gehalt > (SELECT AVG(Gehalt) FROM Mitarbeiter);

#Finde alle Produkte, die teurer sind als der Durchschnittspreis aller Produkte.
SELECT * FROM Produkte p WHERE p.Preis > (SELECT AVG(Preis) FROM Produkte);

#Schreibe eine Abfrage, um alle Kunden zurückzugeben, die mindestens eine Bestellung aufgegeben haben.
SELECT * FROM Kunden WHERE KundenID IN (SELECT DISTINCT KundenID FROM Bestellungen);

#Finde alle Mitarbeiter, deren Gehalt höher ist als das Durchschnittsgehalt der Mitarbeiter in ihrer Abteilung.
SELECT ma.* FROM Mitarbeiter ma WHERE ma.Gehalt > (SELECT AVG(md.Gehalt) FROM Mitarbeiter md WHERE md.AbteilungID = ma.AbteilungID);

#Erstelle eine Abfrage, um die Anzahl der Bestellungen für jeden Kunden zu ermitteln.
SELECT k.*, ab.anzahl FROM Kunden k LEFT JOIN (SELECT b.KundenID, COUNT(*) as anzahl FROM Bestellungen b GROUP BY b.KundenID) AS ab ON k.KundenID = ab.KundenID;

#Finde die durchschnittliche Anzahl von Bestellungen pro Kunde.
SELECT AVG(Anzahl_Bestellungen) AS Durchschnittliche_Anzahl_Bestellungen
FROM (
SELECT k.*, COUNT(b.BestellungenID) AS Anzahl_Bestellungen
FROM Kunden k
LEFT JOIN Bestellungen b ON k.KundenID = b.KundenID
GROUP BY k.KundenID
) AS Subquery;

#Schreibe eine Abfrage, um alle Abteilungen zurückzugeben, in denen die Anzahl der Mitarbeiter größer ist als der Durchschnitt der Anzahl der Mitarbeiter pro Abteilung.
SELECT AbteilungID
FROM Mitarbeiter
GROUP BY AbteilungID
HAVING COUNT(MitarbeiterID) > (
	SELECT AVG(Mitarbeiter_Anzahl) 
	FROM (
		SELECT COUNT(MitarbeiterID) AS Mitarbeiter_Anzahl 
		FROM Mitarbeiter 
		GROUP BY AbteilungID
	) AS Subquery
);

#Finde alle Kunden, die mehr als eine Bestellung aufgegeben haben.
SELECT k.*, sub.order_count from Kunden k RIGHT JOIN (SELECT b.KundenID, COUNT(b.BestellungenID) AS order_count FROM Bestellungen b GROUP BY b.KundenID) AS sub ON k.KundenID = sub.KundenID WHERE sub.order_count > 1;

#Schreibe eine Abfrage, um alle Mitarbeiter zurückzugeben, die ein Gehalt haben, das höher ist als (das Gehalt des Mitarbeiters mit der niedrigsten Mitarbeiter-ID).
SELECT * from Mitarbeiter m WHERE m.Gehalt > (SELECT m2.Gehalt FROM Mitarbeiter m2 WHERE m2.MitarbeiterID = (SELECT MIN(m3.MitarbeiterID) FROM Mitarbeiter m3));

#Finde alle Kunden, die mehr Bestellungen aufgegeben haben als der durchschnittliche Wert der ( Anzahl der Bestellungen pro Kunde.)
#SELECT AVG(bestell_wert) FROM (SELECT b.KundenID, SUM(p.Preis * b.Menge) AS bestell_wert FROM Bestellungen b LEFT JOIN Produkte p ON p.ProduktID = b.ProduktID GROUP BY b.KundenID) AS sub WHERE sub.bestell_wert > ;
SELECT AVG(sub1.anzahl) AS average FROM (SELECT COUNT(*) AS anzahl FROM Bestellungen b1 GROUP BY b1.KundenID) AS sub1


Subselects mit EXISTS und NOT EXISTS
#Finde alle Kunden, die mindestens eine Bestellung aufgegeben haben.
#Finde alle Mitarbeiter, die keine Bestellungen bearbeitet haben.
Subselects mit IN und NOT IN
#Schreibe eine Abfrage, um alle Produkte zurückzugeben, die in einer bestimmten Kategorie liegen.
#Finde alle Kunden, die Bestellungen für bestimmte Produkte aufgegeben haben.
