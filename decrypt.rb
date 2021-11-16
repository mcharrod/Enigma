require './lib/enigma'
require './lib/generator_module'
require './lib/key'
require './lib/offset'

enigma = Enigma.new
enigma.encrypt("hello world", "02715", "040895")



if ARGV.count != 4
  puts "invalid input"
else
  puts "Enter your encrypted message file, the file you'd like to store your" + "\n"
   "decrypted message, the key, and date." 
  date = ARGV[3]
  key  = ARGV[2]
  message = File.open(ARGV[0], "r")
  message_contents = message.read
  message.close
  plain_text = enigma.decrypt(message_contents, key, date)
  File.write(ARGV[1], plain_text[:decryption])
  puts "created file #{ARGV[1]} with your decrypted message with the key #{enigma.key.key} and the date #{enigma.offset.date}"
end
