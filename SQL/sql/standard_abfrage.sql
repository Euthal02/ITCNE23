SELECT p.*,s.*
FROM skill AS s, skill_person_mapping AS sp, person AS p
WHERE p.personID = sp.personID
AND s.skillID = sp.skillID
ORDER BY p.vorname DESC, s.skillname;