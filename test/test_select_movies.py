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
