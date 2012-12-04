namespace :db do |variable|
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'wordnik'

    Wordnik.configure do |config|
        config.api_key = 'c31b7aa617b80dfe43a0f04d96501c14c3c72d91b1f98655c'
    end

    %w(one two three).populate 20 do |w|

    end

    ['hysterical', 'histrionics', 'bashful', 'brave', 'cunning', 'guile'].populate 20 do |w|

      w.name = Populator.words(1).titleize
      w.definition = Wordnik.word.get_definitions('hysterical', :includeRelated => 'false', :useCanonical => 'false', :includeTags => 'false')
      w.example = Wordnik.word.get_top_example('hysterical', :useCanonical => 'false')
      w.pos = Populator.words(1)
      w.pronunciation = Populator.words(1)
    end

  end
end