class Rate < ActiveRecord::Base
  attr_accessible :image_id, :rate, :user_id
  belongs_to :image
  belongs_to :user
  validate :user_can_rate_after_one_day

  before_save :default_values
  
  def default_values
    self.rate ||=0
  end

  protected
   def user_can_rate_after_one_day
	
	r=Rate.find_by_image_id_and_user_id(image_id, user_id)
	if( r!=nil and (Time.now  < (r.updated_at + 1.day)))
	  self.errors.add(:rate,"you can only vote once per day")
	end
  end
end


