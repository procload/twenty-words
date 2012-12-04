# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'wordnik'
require 'json'

Wordnik.configure do |config|
  config.api_key = 'c31b7aa617b80dfe43a0f04d96501c14c3c72d91b1f98655c'
end

%w(histrionics ingratiate sagacious apoplectic egress opprobrious abrogate magnanimous lugubrious corpulent efficacious incorrigible).each do |i|
  wordDef = Wordnik.word.get_definitions(i, :includeRelated => 'false', :limit => 1, :useCanonical => 'true', :includeTags => 'false')
  if Wordnik.word.get_examples(i, :includeDuplicates => 'false', :useCanonical => 'true', :limit => 1)
    example = Wordnik.word.get_examples(i, :includeDuplicates => 'false', :useCanonical => 'true', :limit => 1)
  elsif 
    example = 'no example'
  end
  p = Wordnik.word.get_text_pronunciations(i, :useCanonical => 'true', :typeFormat => 'ahd')
  Word.create([
    {
      name: "#{i}",
      definition: wordDef[0]['text'],
      example: example['text'],
      pos: wordDef[0]['partOfSpeech'],
      pronunciation: p[0]['raw']
    }
  ])
end