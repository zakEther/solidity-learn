// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract learnStructs {
    struct Movie {
        string title;
        string director;
        uint movieId;
    }

    Movie movie;
    Movie comedy; 
    
    function setMovie() public {
        movie = Movie('Blade Runner', 'Ridley Scott', 1);
    }

    function getMovieId() public view returns (uint) {
        return movie.movieId;
    }

    function setUserMovie(
        string memory _title, 
        string memory _director, 
        uint _movieId) public returns (bool) {
            _title = comedy.title;
            _director = comedy.director;
            _movieId = comedy.movieId;
            return true;
    }

    mapping(uint => Movie) movie;
    
    struct Movie {
        string title;
        string director;
    }

    function addMovie(uint id, string memory title, string memory director) public {
        movie[id] = Movie(title, director); 
    }

}

