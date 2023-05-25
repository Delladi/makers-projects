sequenceDiagram
    participant t as terminal
    participant app as Main program (app.rb)
    participant ar as BookRepository class <br /> (in lib/book_repository.rb)
    participant db_conn as DatabaseConnection class <br /> (in lib/database_connection.rb)
    participant db as Postgres database

    Note left of t: Flow of time <br />⬇ <br /> ⬇ <br /> ⬇ 

    t->>app: Runs `ruby app.rb`
    app->>db_conn: Opens connection to database calling method `connect` on DatabaseConnection
    db_conn->>db_conn: Opens database connection using PG and stores the connection
    app->>ar: Calls method `all` on BookRepository
    ar->>db_conn: Sends SQL query by calling method `exec_params` on DatabaseConnection
    db_conn->>db: Sends query to database via the open database connection
    db->>db_conn: Returns an array of hashes, one for each row of the Books table

    db_conn->>ar: Returns an array of hashes, one for each row of the books table
    loop 
        ar->>ar: Loops through array and creates an Books object for every row
    end
    ar->>app: Returns array of Books objects
    app->>t: Prints list of Books to terminal

# https://mermaid.live/edit#pako:eNqdlM-O0zAQxl9l5NMiFfYeoR7YFVwWKO010nbiTBuDY4exs1Ct9szL8FQ8CeM6acK2SIic7OTzb775Ez8q7WtShQr0tSen6dbgnrEtHcjTIUejTYcuQgQMEIlb49Cef8auS4L3aBx07BMDruTlK65eXFBzEr_x_suaOh9M9HwAbTEEeF0xXC_hSjjWVNeVaO75JLqMq6t77Z1LzFuMWGGgG9mTjsa7y9x60B0PZuHf2Am78iHumQKM50qXpR98JLC0i-B3EAt4a_2349K0NMT89fPHGP3ZcoTEl8ul1KqAde8CbLmvDpBrt80C2YhkSLOAjx2JbnIO0Z-MgUZrjdtDS7HxNWwH2RZEd16dzB_I5zEm6hSsDwm_egfoagjSFSlLbOaSuWnkAm7EUjgZks3RzJ_tH87w3MOGXB1g8-kOZDhlQqQsz7Oj76TvpV_Yhn_OcARn6Lx2DwaPqXhJ_lLuI2tuck2xZykVyvwx4yF1v8HQUFiIIYKdZyDUDfAwGcJPqUvRsLKnQZoMpor9D7SaQxPSet9BXp5qm-B38j61jH2_bwZ-6qVmwkjHoNmgrz5L3jnYQ6qVRMs8qd-sYXl2R8uj3zkjzEdCfpMVGxeD_IkhTlLpxHTBqIVqZYOmltvpMR0vlWTZUqkKWda0w97GUpXuSaTYR785OK2KyD0tVN9J98bLTBU7tIGefgPykrXL
