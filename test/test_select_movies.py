import pytest
from src.select_movies import (selectmovies)

def test_catches_error_returns_message_if_incorrect_username():
    expected = 'Check username and/or database name.'
    result = selectmovies('northcoder', 'nc_flix')
    assert result == expected

def test_catches_error_returns_message_if_incorrect_database():
    expected = 'Check username and/or database name.'
    result = selectmovies('northcoders', 'nc_fli')
    assert result == expected

def test_returns_correct_keys_from_movies_table():
    returned_list = selectmovies('northcoders', 'nc_flix')
    expected = ['movie_id', 'title', 'release_date', 'rating', 'cost', 'classification']
    
    result = list(returned_list[0].keys())
    assert result == expected

def test_returns_expected_database_entry():
    returned_list = selectmovies('northcoders', 'nc_flix')
    expected = [
        {
            'movie_id': 24, 
            'title': 'A Fish Called Wanda', 'release_date': datetime.date(1988, 7, 7), 'rating': 7, 'cost': Decimal('1.43'), 'classification': None}, {'movie_id': 17, 'title': 'Back to the Future', 'release_date': datetime.date(1985, 7, 3), 'rating': 10, 'cost': Decimal('2.38'), 'classification': 'U'}, {'movie_id': 18, 'title': 'Back to the Future Part II', 'release_date': datetime.date(1989, 11, 22), 'rating': None, 'cost': Decimal('1.66'), 'classification': 'U'}]