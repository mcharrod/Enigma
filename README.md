# Self assessment for Enigma project

This project is a part of the Turing School of Software and Design 2110 Mod1 Backend Program. Project requirements can be found here: [Turing Enigma Project](https://backend.turing.edu/module1/projects/enigma/index)

## Functionality - self-assessed score: 3

My project implements an encrypt method, a decrypt method, as well as a command line interface as per the expectations. I did not create a cracking method, so the functionality is about a 3.

## Object Oriented Programming - self-assessed score: 4

I outsourced some methods for generating keys, dates, and putting those together in a module so that my enigma class as well as each generator's corresponding class would have access to these methods rather than having to repeat the code. In addition, I created a rotater module to outsource the encryption and decryption components.

I did my best to make sure each class was a reasonable length and only was responsible for the things related to that class, so I believe this is an above expectations delivery for 4 points. I have an understanding of the differences between inheritance and modules and believe that creating the modules I did for their corresponding functions was a logical decision.

## Ruby Conventions and Mechanics - self-assessed score: 2.5

Every method is tested with 100% coverage according to the [SimpleCov Coverage Report](file:///Users/katy/Documents/turing/1mod/projects/enigma/coverage/index.html#_AllFiles). Each part of the Enigma process is utilized and functions as expected, but specs were not committed ahead of files. For this, I would give myself a 2.5.
