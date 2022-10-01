# Welcome to Enigma! 

Enigma is a message encrypting and decrypting app. This project is a part of the Turing School of Software and Design Backend Program. Project requirements can be found here: [Turing Enigma Project](https://backend.turing.edu/module1/projects/enigma/index) 

## Setup 

This is a command line interface app. First, you will need to clone down this repo. Navigate to this project using the `cd enigma` command. To use the encryption, you will write a message in the message.txt file. Then you will run the ruby command and name the file your message is stored in for the program to read it, then the file you want the encrypted message to go to, like this: `ruby encrypt.rb  message.txt encrypted.txt`. If you do not list this all, you will get an error message that looks like this: 

`invalid input. Please enter the file your message is stored and the file you'd like to store your encrypted message in.`

Once your message has been encrypted, you will see it scrambled in the encrypted.txt file. The terminal will also tell you your randomly generated key and date that you will need to enter to decrypt your message. 

To decrypt the message, you will need to enter the ruby command along with the location of your encrypted message, the location to store your decrypted message, the key, and the date. The key will always be 5 digits and the date will always be 6 digits. Example: `ruby decrypt.rb encrypted.txt decrypted.txt 87092 102715` 
