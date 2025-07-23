SELECT id, title, reproductions
FROM videos
ORDER BY reproductions DESC
LIMIT 5;
SELECT p.id, p.name, p.date_creation
FROM playlists p
WHERE p.email_user = 'laura@example.com'
AND p.state = 'public';
SELECT vl.email_user, u.name_user, vl.date
FROM video_likes vl
JOIN users u ON vl.email_user = u.email
WHERE vl.id_video = 1
AND vl.class = 'like';
SELECT c.text, c.date, u.name_user
FROM comments c
JOIN users u ON c.email_user = u.email
WHERE c.id_video = 1
ORDER BY c.date DESC
LIMIT 5;
SELECT 
    ch.name AS canal,
    COUNT(CASE WHEN vl.class = 'like' THEN 1 END) AS total_likes,
    COUNT(CASE WHEN vl.class = 'dislike' THEN 1 END) AS total_dislikes
FROM channels ch
JOIN users u ON ch.email_user = u.email
JOIN videos v ON v.email_user = u.email
LEFT JOIN video_likes vl ON vl.id_video = v.id
WHERE ch.id = 1
GROUP BY ch.name;
SELECT DISTINCT p1.email_user AS usuario_1, p2.email_user AS usuario_2, pv1.id_video
FROM playlist_videos pv1
JOIN playlists p1 ON pv1.id_playlist = p1.id
JOIN playlist_videos pv2 ON pv1.id_video = pv2.id_video
JOIN playlists p2 ON pv2.id_playlist = p2.id
WHERE p1.email_user <> p2.email_user;