import pg8000.native as pg



def selectmovies(username, database):
    
    try:
        conn = pg.Connection(username, database=database)
    except:
        return 'Check username and/or database name.'

    

