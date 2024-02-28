SELECT p.*, s.*, sp.*
FROM person AS p
JOIN skill_person_mapping as sp ON p.personID = sp.personID
JOIN skill AS s ON s.skillID = sp.skillID
ORDER BY p.personID;