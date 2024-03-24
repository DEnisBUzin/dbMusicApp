create table if not exists Artist(
	id serial primary key,
	name_artist varchar(30) not null
);

create table if not exists Genre(
	id serial primary key,
	name_genre varchar(30) not null
);

create table if not exists Album(
	id serial primary key,
	album_name varchar(50) not null,
	year_reliz integer not null,
	check(year_reliz>1900)
);

create table if not exists ArtistGenre(
	artist_id integer references Artist(id),
	genre_id integer references Genre(id),
	constraint ArtGen primary key (artist_id, genre_id)
);

create table if not exists ArtistAlbum(
	artist_id integer references Artist(id),
	album_id integer references Album(id),
	constraint ArtAlb primary key (artist_id, album_id)
);

create table if not exists Track(
	id serial primary key,
	track_time integer not null,
	track_name varchar(20) not null,
	album_id integer references Album(id)
		
);

create table if not exists Playlist(
	id serial primary key,
	name_list varchar(50),
	year_list integer,
	check(year_list>1900)
);

create table if not exists TrackList(
	track_id integer references Track(id),
	list_id integer references Playlist(id),
	constraint TrLst primary key (track_id, list_id)
);


