require('pry')
require('launchy')
require('sinatra')
require('sinatra/reloader')
require('./lib/hangman')
also_reload('./**/*.rb')

get('/') do
  erb(:index)
end

post('/word_input') do
  @word = params.fetch('word')
  @hangman = Hangman.new(@word)
  @hangman.save()
  @answer = @hangman.answer()
  @wrong = @hangman.wrong()
  erb(:game)
end

post('/letter_input') do
  @id = params.fetch('word_id')
  @hangman = Hangman.find(@id.to_i)
  @word = @hangman.word()
  @letter = params.fetch('letter')
  @hangman.letter_check(@letter)
  @answer = @hangman.answer()
  @wrong = @hangman.wrong()
  erb(:game)
end
