namespace :db do |variable|
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'

    Word.populate 20 do |w|
      w.name = Populator.words(1).titleize
      w.definition = Populator.sentences(2..3)
      w.example = Populator.sentences(1)
      w.pos = Populator.words(1)
      w.pronunciation = Populator.words(1)
    end

  end
end