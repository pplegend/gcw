class MusicCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :musics
end
