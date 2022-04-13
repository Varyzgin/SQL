SELECT students.first_name, students.last_name, avgm.avgmark,
	(
	SELECT first_name || ' ' || last_name
		FROM lectors
		WHERE students.mentor = lectors.idlector
	) 
	AS mentor_name
	FROM students LEFT JOIN 
		(
		SELECT idstudent, AVG(mark) AS avgmark
			FROM marks
			WHERE mark IN (3, 4, 5)
			GROUP BY idstudent
		) 
		AS avgm ON students.idstudent = avgm.idstudent -- ON students.idstudent = avgm.idstudent 
	WHERE students.idstudent IN                          -- все равно что USING(idstudent)
		(                                              -- если idstudent одинаковое название в разных табл.
		SELECT idstudent
			FROM marks
			WHERE idcredits = '303'
		)
;