require './lib/enigma'
require './lib/generator_module'
require './lib/key'
require './lib/offset'


enigma = Enigma.new

if ARGV.count != 2
  puts "invalid input. Please enter the file your message is stored and \n" +
  "the file you'd like to store your encrypted message in."

  # refactor note: this only catches if there's 2 args, not if the args are message.txt and encrypted.txt
else
    # Ruby allowed to read file
  message = File.open(ARGV[0], "r")
    # Ruby reads the message file
  message_contents = message.read
    # move to next part unrelated to reading file
  message.close
    # call the encrypt method to translate message to encrypted_message
  encrypted_message = enigma.encrypt(message_contents)
    # write the contents of that encrypted_message message to the second file
  File.write(ARGV[1], encrypted_message[:encryption])
  puts "created an encrypted file #{ARGV[1]} with your message."
  puts "your key is #{encrypted_message[:key]}."
  puts "date is #{encrypted_message[:date]}"
end
