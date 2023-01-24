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