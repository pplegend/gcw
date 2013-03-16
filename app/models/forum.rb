class Forum < ActiveRecord::Base
  attr_accessible :description, :name, :topics_count
  has_many :topics, :dependent=> :delete_all
  has_many :posts, :through=> :topics

  validates :name, :presence=>true,:length =>{:maximum=>250 }
  validates :description, :length =>{:maximum=>1000 }
end
