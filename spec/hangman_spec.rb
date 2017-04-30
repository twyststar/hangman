require('rspec')
require('hangman')
require('pry')

describe(Hangman) do
  describe('initialize') do
    it('returns new hangman word') do
      test_word = Hangman.new('hello')
      expect(test_word.word).to(eq(['h', 'e', 'l', 'l', 'o']))
    end
    it('returns new hangman blank answer field') do
      test_word2 = Hangman.new('hello')
      expect(test_word2.answer).to(eq(['_', '_', '_', '_', '_']))
    end
  end
  describe('letter_check') do
    it('fills hangman blank answer field with correctly guessed letter') do
      test_word3 = Hangman.new('hello')
      expect(test_word3.letter_check('l')).to(eq(['_', '_', 'l', 'l', '_']))
    end
  end
  describe('letter_check') do
    it('returns input in wrong answer field with incorrectly guessed letter') do
      test_word4 = Hangman.new('hello')
      expect(test_word4.letter_check('q')).to(eq(['q']))
    end
  end
  describe('win_check') do
    it('returns true if all letters have been guessed') do
      test_word5 = Hangman.new('hel')
      test_word5.letter_check('h')
      test_word5.letter_check('e')
      test_word5.letter_check('l')
      expect(test_word5.win_check?()).to(eq(true))
    end
  end

  describe('save') do
    it('saves a instance of hangman to the class') do
      test_word4 = Hangman.new('hello')
      test_word4.save()
      expect(Hangman.all()).to(eq([test_word4]))
    end
  end

end
