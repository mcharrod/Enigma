require './lib/enigma'
require './lib/generator_module'
require './lib/key'
require './lib/offset'

enigma = Enigma.new
enigma.encrypt("hello world", "87092", "102715")



if ARGV.count != 4
  puts "invalid input. Please enter your encrypted message file, the file you'd like to store your " +
  "decrypted message, the key, and date."
else
  key  = ARGV[2]
  date = ARGV[3]
  message = File.open(ARGV[0], "r")
  message_contents = message.read
  message.close
  plain_text = enigma.decrypt(message_contents, key, date)
  File.write(ARGV[1], plain_text[:decryption])
  puts "created file #{ARGV[1]} with your decrypted message with the key #{plain_text[:key]} and the date #{plain_text[:date]}"
end
