# 1. How many songs are there in the playlist “Grunge”?
SELECT COUNT(*) FROM chinook.playlist
WHERE playlist.Name = 'Grunge';

SELECT COUNT(*) FROM chinook.playlisttrack
WHERE PlaylistId = 16;

# 2. Show information about artists whose name includes the text “Jack” and about artists whose name includes the text “John”, but not the text “Martin”.