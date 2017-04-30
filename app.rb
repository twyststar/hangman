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

  erb(:game)
end
