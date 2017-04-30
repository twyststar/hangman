require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("hangman", {:type => :feature}) do
  it("accept a new hangman word") do
    visit('/')
    fill_in('word', :with => "hello")
    click_on('Play')
    expect(page).to have_content("_ _ _ _ _")
  end
end
describe("hangman", {:type => :feature}) do
  it("accept and display a letter guess") do
    visit('/')
    fill_in('word', :with => "hello")
    click_on('Play')
    fill_in('letter', :with => 'h')
    click_on('Guess')
    expect(page).to have_content("h _ _ _ _")
  end
end
