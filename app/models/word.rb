class Word < ActiveRecord::Base
  attr_accessible :definition, :name, :pos, :example
end
