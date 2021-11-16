require './lib/enigma'
require './lib/generator_module'
require './lib/key'
require './lib/offset'

enigma = Enigma.new

if ARGV.count != 2
  puts "invalid input"
else
    # Ruby allowed to read file
  message = File.open(ARGV[0], "r")
    # Ruby reads the message file
  message_contents = message.read
    # move to next part unrelated to reading file
  message.close
    # call the encrypt method to translate message to gibberish
  gibberish = enigma.encrypt(message_contents, "02715", "102715")
    # write the contents of that gibberish message to the second file
  File.write(ARGV[1], gibberish[:encryption])
  puts "created a 'secure file' #{ARGV[1]} with your 'encrypted message'."
  puts "your key is #{enigma.key.key}."
  puts "your offset is #{enigma.offset.date}"
end
