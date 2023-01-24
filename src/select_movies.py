import pg8000.native as pg

def selectmovies(username, database):
    
    try:
        conn = pg.Connection(username, database=database)
    except:
        return 'Check username and/or database name.'
    movie_dictionaries = []
    result = conn.run('SELECT * FROM movies')    
    
    titles = [ meta_data['name'] for meta_data in conn.columns]
    print(result, '<<<<<titles')
    for row in result:
            movie_dictionaries.append(
                {
                titles[0] : row[0],
                titles[1] : row[1],
                titles[2] : row[2],
                titles[3] : row[3],
                titles[4] : row[4],
                titles[5] : row[5]
                }
                )
    return movie_dictionaries

selectmovies('northcoders', 'nc_flix')
# print(sorted(selectmovies('northcoders', 'nc_flix'), key=lambda d: d['title']))