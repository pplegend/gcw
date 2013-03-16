class Post < ActiveRecord::Base
  attr_accessible :body, :topic_id, :user_id
  belongs_to :topic, :counter_cache =>true
  belongs_to :user, :counter_cache => true
end
