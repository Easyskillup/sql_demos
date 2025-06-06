# Working With RDBMS and SQL

## Platform and Tools

- [Mysql](https://aiven.io/)
- [MySQL Client](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2)
- [Reading Material 1] (https://www.mysqltutorial.org/)

## Database

Organized collection of data.

## DBMS

Software which is fine tuned to efficently adn securely manage databases.

## Entity

A real world thing or an object whose data we are going to record in a database, eg: `Trainee` `Trainer`

## Attributes

Properties of entities which are actuallu getting recorded.

## Use Case: Harmony Music Studio

**Description**:

Harmony Music Studio records albums for various artists. Each `album` may consist of multiple `songs`. Songs are recorded in one of the `studio rooms`, and each recording involves `sound engineers`. The studio also rents out rooms for practice sessions to external musicians, who can book rooms for specific time slots.

### Core Requirements:

- Identify the `Entities` and `Attributes`
- Track artists and the albums they create.
- Track the songs in each album.
- Track studio rooms, and which room was used to record each song.
- Each song is recorded by one or more sound engineers.
- External musicians (not necessarily artists signed with the studio) can book a studio room for practice.
- Each booking has a start time, end time, and room assigned.

#### Entities and Attributes

| Entity     |                                                            Attributes |
| :--------- | --------------------------------------------------------------------: |
| Artist     |                                      id, name, genre, email, phone_no |
| Album      |                                        id, title, genre, release_date |
| Song       |                                       id, title, genre, album, artist |
| Musician   |                              id, name, genre, contant_info, specailty |
| StudioRoom |                                            room_id, equipment_details |
| Technician |                                       technician_id, name, speciality |
| Booking    | booking_id, start_time, end_time, technician, musicians, room, status |

#### Relationships

| Relationship              |                                   Description                                   |
| :------------------------ | :-----------------------------------------------------------------------------: |
| Artist - Album [1..N]     |                             One Artist many Albums                              |
| Album - Song [1..N]       |                              One Album many Songs                               |
| Song - StudioRoom [N..1]  |                      Many Songs recorded in one StudioRoom                      |
| Song - Engineer  [M..N]   | Many songs can be recorded by one engineer and one song can have many engineers |
| Musician - Booking [1..N] |                          One muscian and many booking                           |
