SELECT m.sub
FROM (
	SELECT id1 AS target_id, id2 AS friend_id
	FROM ridi_5 AS r
	WHERE id1 = "nanee"
	UNION
	SELECT id2 AS target_id, id1 AS friend_id
	FROM ridi_5 AS r2
	WHERE id2 = "nanee"
) AS t
JOIN (
	SELECT t.mutual, t.sub
	FROM (
		SELECT id1 AS mutual, id2 AS sub
		FROM ridi_5 AS r
		WHERE id1 <> "nanee" AND id2 <> "nanee"
		UNION
		SELECT id2 AS mutual, id1 AS subv
		FROM ridi_5 AS r2
		WHERE id2 <> "nanee" AND id1 <> "nanee"
	) AS t
) AS m ON m.mutual=t.friend_id
GROUP BY m.sub
ORDER BY COUNT(m.sub) DESC, m.sub
LIMIT 1;