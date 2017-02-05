Game Name: 2048
Language: Jack
Platform: Hack
Author: Mohammad Ghaffari
Date: February 1st, 2017
*******************************************************
Project 9: High Level Language
Course Name: Build a Modern Computer from First Principles: Nand to Tetris Part II (project-centered course)
From: Coursera.org
Instructor: Professor Shimon Schocken
*******************************************************
VM Files:
    Board.vm
    Game.vm
    GUI.vm
    Main.vm
    Merge.vm
    Seed.vm
*******************************************************    
How to run:
    Load the whole folder containing all the 6 .vm files in the Hack VM Emulator,
    and run the program with "No Animation" option seleted.
    For better performance let the built-in OS files be used by NOT copying the
    provided OS files to the game folder (by default named 2048)

Note: I tried to compile and translate the game to machine code but the game is
      too large for the CPU emulator and it complains about it and doesn't run it.
      So the only option would be to use VMEmulator to run the game.
*******************************************************
User Input:
    Esc: quits the game
    Enter: starts the game
    Arrow Keys: moves the tiles towards the border of the grid that
                the arrow key is pointing to: UP, RIGHT, DOWN, LEFT
*******************************************************
Rules and Mechanics of the Game:
    - The aim of the game is to merge same valued tiles together by merging them
    through moving the tiles to the four up, right, down and left directions.
    - So if two neighbor tiles share the same value and are next to each other
    they are merged after the move resulting in a single tile equal to the sum
    of those values and leaving one tile empty.
    - If a tile has already been merged during a move, it cannot be merged with the
    remaining tiles of the current move.
    - After a successful move, in which the board values have changed disregarding
    if a merge has happened or not, if there still exists at least one empty tile
    then a new random value is added to one of the empty tiles with the 12.5%
    probability of being the number 4 and the remaining probability of 87.5% of
    being the number 2
    - If there is no more moves available the game is over
    - The score is the sum of all the merged tiles together

    
