class Topic < ActiveRecord::Base
  attr_accessible :forum_id, :title, :posts_count, :user_id, :body
  belongs_to :forum, :counter_cache => true
  belongs_to :user
  has_many :posts, :dependent=> :delete_all
  
  validates :title, :presence=>true,:length =>{:maximum=>100 }
  validates :body, :length =>{:maximum=>1000 }
end
