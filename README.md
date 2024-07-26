# Movie Database Project

## Project Setup

### 1. Start the containers:
```
docker-compose up
```
**Note that the PostgreSQL database will be available on port `5433`.**

### 2. Create the tables in the database:
Execute the SQL statements in the create_tables.sql file.

### 3. Seed the database with initial data:
Execute the SQL statements in the seed_data.sql file.

### 4. To reset the database (if needed), drop the existing data:
Execute the SQL statements in the drop_data.sql file.

## ER Diagram

```mermaid
erDiagram
    c[Country] {
        int id PK
        string name
    }

    f[File] {
        int id PK
        string file_name
        string mime_type
        string file_key
        string url
        datetime created_at
        datetime updated_at
    }

    p[Person] {
        int id PK
        string first_name
        string last_name
        text biography
        date date_of_birth
        gender_type gender
        int country_id FK
        int primary_photo_id FK
        datetime created_at
        datetime updated_at
    }

    pp[PersonPhotos] {
        int id PK
        int person_id FK
        int photo_id FK
        datetime created_at
        datetime updated_at
    }

    m[Movie] {
        int id PK
        string title
        text description
        decimal budget
        date release_date
        int duration
        int country_id FK
        int director_id FK
        int poster_id FK
        datetime created_at
        datetime updated_at
    }

    g[Genre] {
        int id PK
        string name
    }

    mg[MovieGenres] {
        int movie_id FK
        int genre_id FK
    }

    ch[Character] {
        int id PK
        string name
        text description
        character_role role
        int movie_id FK
        int actor_id FK
        datetime created_at
        datetime updated_at
    }

    ua[UserAccount] {
        int id PK
        string username
        string first_name
        string last_name
        string email
        string password
        int avatar_id FK
        datetime created_at
        datetime updated_at
    }

    fm[FavoriteMovie] {
        int user_id FK
        int movie_id FK
    }

    c ||--o{ p : "has"
    f ||--o{ p : "has"
    p ||--o{ pp : "has"
    p ||--o{ ch : "acts in"
    m ||--o{ p : "directed by"
    m ||--o{ mg : "has"
    g ||--o{ mg : "includes"
    ch ||--o{ m : "belongs to"
    ua ||--o{ fm : "favorites"
    m ||--o{ fm : "favorited by"
