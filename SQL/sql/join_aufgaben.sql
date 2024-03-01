#Zahlen, welche in der Einer- und Zweier-Tabelle vorkommen
SELECT * FROM Einer e
JOIN Zweier z ON e.wert = z.wert;

#Zahlen, welche in der Zweier- und Dreier-Tabelle vorkommen
SELECT * FROM Zweier z
JOIN Dreier d ON z.wert = d.wert;

#Zahlen, welche in der Einer- und Dreier-Tabelle vorkommen
SELECT * FROM Einer e
JOIN Dreier d ON e.wert = d.wert;

#Zahlen, welche ausschliesslich in der Einer-Tabelle vorkommen
SELECT * FROM Einer e
LEFT JOIN Zweier z ON e.wert = z.wert
LEFT JOIN Dreier d ON e.wert = d.wert
WHERE z.wert IS NULL AND d.wert IS NULL;

#Zahlen, welche ausschliesslich in der Zweier-Tabelle vorkommen
SELECT * FROM Zweier z
LEFT JOIN Einer e ON z.wert = e.wert
LEFT JOIN Dreier d ON z.wert = d.wert
WHERE e.wert IS NULL AND d.wert IS NULL;

#Zahlen, welche ausschliesslich in der Dreier-Tabelle vorkommen
SELECT * FROM Dreier d
LEFT JOIN Einer e ON d.wert = e.wert
LEFT JOIN Zweier z ON d.wert = z.wert
WHERE e.wert IS NULL AND z.wert IS NULL;

#Zahlen, welche in der Einer, nicht aber in der Zweier-Tabelle vorkommen
SELECT * FROM Einer e
LEFT JOIN Zweier z ON e.wert = z.wert
WHERE z.wert IS NULL;

#Zahlen, welche in der Zweier, nicht aber in der Dreier-Tabelle vorkommen
SELECT * FROM Zweier z
LEFT JOIN Dreier d ON z.wert = d.wert
WHERE d.wert IS NULL;

#Zahlen, welche in der Dreier, nicht aber in der Einer-Tabelle vorkommen
SELECT * FROM Dreier d
LEFT JOIN Einer e ON d.wert = e.wert
WHERE e.wert IS NULL;

#Zahlen, welche in der Einer, nicht aber in der Zweier- und nicht in der Dreier-Tabelle vorkommen
SELECT * FROM Dreier d
LEFT JOIN Einer e ON d.wert = e.wert
LEFT JOIN Zweier z ON d.wert = z.wert
WHERE e.wert IS NULL AND z.wert IS NULL;

#Alle Zahlen, welche in den drei Tabellen insgesamt vorkommen
SELECT * FROM Einer e
UNION
SELECT * FROM Zweier z
UNION
SELECT * FROM Dreier d
ORDER BY wert;

