# Movie Database Project

## ER Diagram

```mermaid
erDiagram
    USER {
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
    FILE {
        int id PK
        string file_name
        string mime_type
        string key
        string url
        datetime created_at
        datetime updated_at
    }
    MOVIE {
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
    GENRE {
        int id PK
        string name
    }
    MOVIEGENRE {
        int movie_id FK
        int genre_id FK
    }
    CHARACTER {
        int id PK
        string name
        text description
        enum role
        int movie_id FK
        int actor_id FK
        datetime created_at
        datetime updated_at
    }
    PERSON {
        int id PK
        string first_name
        string last_name
        text biography
        date date_of_birth
        enum gender
        int country_id FK
        int primary_photo_id FK
        datetime created_at
        datetime updated_at
    }
    PERSONPHOTO {
        int person_id FK
        int photo_id FK
    }
    COUNTRY {
        int id PK
        string name
    }
    FAVORITEMOVIE {
        int user_id FK
        int movie_id FK
    }
    
    USER ||--o{ FILE : "avatar"
    MOVIE ||--o{ FILE : "poster"
    MOVIE ||--o{ COUNTRY : "produced in"
    MOVIE ||--o{ PERSON : "directed by"
    MOVIE ||--o{ MOVIEGENRE : "has"
    MOVIEGENRE ||--o{ GENRE : "classified as"
    CHARACTER ||--o{ MOVIE : "appears in"
    CHARACTER ||--o{ PERSON : "played by"
    PERSON ||--o{ COUNTRY : "born in"
    PERSON ||--o{ FILE : "has"
    PERSONPHOTO ||--o{ FILE : "includes"
    PERSONPHOTO ||--o{ PERSON : "has"
    FAVORITEMOVIE ||--o{ USER : "favorited by"
    FAVORITEMOVIE ||--o{ MOVIE : "includes"
