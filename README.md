# Scramble DB: Details about the Database Used with the Scrabble Application.

**Author: Jadesola Alade-Fa**

Developed over a series of four weeks and led by Josh Pia and guest instructors in the Nucamp bootcamp for Back End, SQL, and DevOps. Established to enhance familiarity with tools and languages used in the creation and management of databases.  

---

## API Reference Table

| URL      | HTTP Verb |
| :-----------: | :-----------: |
| _.base_url/games_ran/_   | GET       |
| _.base_url/games_ran/_   | POST       |
| _.base_url/games_ran/<run_id>_   | PUT       |
| _.base_url/games_ran/<run_id>_   | DELETE       |

---

## Retrospective Analysis  

**How did the project's design evolve over time?**  

 The concept for the project was inspired by the application that I created in the first course of the bootcamp. The application is a game called scramble and goal of the game is to spell words for points. The game is simple so it was determined that three tables was sufficient. The tables belong to a PostgreSQL database:  
* __levels__ - a table that holds the level names programmed into application (NOVICE and ADVANCED at the moment)

* __difficulties__ - a table that holds the application's programmed game difficulties; Associated attributes per difficulty is represented as field names: id, turn_count, multiplier, and level_id.

* __runs__  - a table holding randomly generated data where each record represents a player's: run-through id, name, score, level id, and difficulty id.  

**Did you choose to use an ORM or raw SQL? Why?**  

I chose to use the SQL Alchemy ORM to develop my project's backend. I made the decision because I wanted to challenge myself and learn something unfamiliar. I think picking up new technologies quickly is a valuable skill and I don't mind the practice. I learned just enough that I was able to create a minimal, but functioning back-end for my application. 

**What future improvements are in store, if any?**  

In the futue I plan to expland the endpoints my current back-end is capable of supporting. I would like my application to be able to perform PUT requests such that updates could be made to a run's score. Being ables to add (POST) and edit (PATCH) new or old levels and difficulties are also considerations for the future. 



