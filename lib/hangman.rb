class Hangman
  @@words = []

  define_method(:initialize) do |word|
    @word = word.split("")
    @id = @@words.length()+1
    @answer = []
    @wrong = []
    @answer = self.blanked()
  end

  define_method(:save)do
    @@words.push(self)
  end
  define_singleton_method(:all)do
    @@words
  end
  define_method(:blanked) do
    @word.each() do |letter|
      @answer.push("_")
    end
    @answer
  end

  define_method(:word) do
    @word
  end
  define_method(:answer) do
    @answer
  end
  define_method(:id) do
    @id
  end
  define_method(:win_check?) do
    @answer == @word
  end

  define_method(:letter_check) do |input|
    i=0

    if @word.include?(input)
      @word.each() do |letter|
        if letter == input
          @answer[i] = input
          i = i.+(1)
        else
          i = i.+(1)
        end
      end
      @answer
    else
      @wrong.push(input)
    end
  end



end
