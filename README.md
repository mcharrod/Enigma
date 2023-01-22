# Welcome to Enigma! 

Enigma is a message encrypting and decrypting app. This project is a part of the Turing School of Software and Design Backend Program. Project requirements can be found here: [Turing Enigma Project](https://backend.turing.edu/module1/projects/enigma/index) 

## Setup 

This is a command line interface app. First, you will need to clone down this repo. Navigate to this project using the `cd enigma` command. To use the encryption, you will write a message in the message.txt file. You can open up your text editor to do this, or you can do it from the terminal using the `echo "your message here" >> message.txt` command. Then, you will run `ruby encrypt.rb  message.txt encrypted.txt`. If you do not list this all, you will get an error message that looks like this: 

`invalid input. Please enter the file your message is stored and the file you'd like to store your encrypted message in.`

Now, what is happening with this command? First, you're calling ruby to tell the project to start it's process. You're calling encrypt.rb to run the algorithm for scrambling or encrypting your message, passing the folder with your message in it as an argument, and telling it the location you want it to be stored in.

Once your message has been encrypted, you will see it scrambled in the encrypted.txt file. The terminal will also tell you your randomly generated key and date that you will need to enter to decrypt your message. 

To decrypt the message, you will need to enter the ruby command along with the location of your encrypted message, the location to store your decrypted message, the key, and the date. To avoid confusion, the key will always be 5 digits and the date will always be 6 digits. Your command will look something like this: `ruby decrypt.rb encrypted.txt decrypted.txt 87092 102715` 

You will be see in the decrypted.txt that your message has been retrieved, and decrypted! If you want to see the computations I've used, the logic is stored in the encrypt.rb and the decrypt.rb files. 
