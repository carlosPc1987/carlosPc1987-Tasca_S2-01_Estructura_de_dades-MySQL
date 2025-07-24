-- 1️-Top 5 most-watched videos
SELECT id, title, reproductions
FROM Videos
ORDER BY reproductions DESC
LIMIT 5;
-- Shows the five videos with the highest view counts. Great for "trending" features.

-- 2️-Public playlists created by a specific user
SELECT p.id, p.name, p.date_creation
FROM Playlists p
WHERE p.email_user = 'laura@example.com'
  AND p.state = 'public';
-- Filters Laura's playlists that are visible to others.

-- 3️-Likes received for a specific video
SELECT vl.email_user, u.name_user, vl.date
FROM VideoLikes vl
JOIN Users u ON vl.email_user = u.email
WHERE vl.id_video = 1
  AND vl.class = 'like';
-- Lists the users who liked video ID 1, with timestamps.

-- 4️-Latest 5 comments on a video
SELECT c.text, c.date, u.name_user
FROM Comments c
JOIN Users u ON c.email_user = u.email
WHERE c.id_video = 1
ORDER BY c.date DESC
LIMIT 5;
-- Useful for showing recent engagement under a video.

-- 5️-Total likes/dislikes received by a channel
SELECT 
    ch.name AS channel,
    COUNT(CASE WHEN vl.class = 'like' THEN 1 END) AS total_likes,
    COUNT(CASE WHEN vl.class = 'dislike' THEN 1 END) AS total_dislikes
FROM Channels ch
JOIN Users u ON ch.email_user = u.email
JOIN Videos v ON v.email_user = u.email
LEFT JOIN VideoLikes vl ON vl.id_video = v.id
WHERE ch.id = 1
GROUP BY ch.name;
-- Aggregates reactions from all videos published by the channel owner.

-- 6️-Users sharing the same video across their playlists
SELECT DISTINCT p1.email_user AS user_1, p2.email_user AS user_2, pv1.id_video
FROM PlaylistVideos pv1
JOIN Playlists p1 ON pv1.id_playlist = p1.id
JOIN PlaylistVideos pv2 ON pv1.id_video = pv2.id_video
JOIN Playlists p2 ON pv2.id_playlist = p2.id
WHERE p1.email_user <> p2.email_user;
-- Detects when different users have saved the same video in their