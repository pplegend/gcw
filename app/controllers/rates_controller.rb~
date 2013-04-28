class RatesController < ApplicationController
  before_filter :authenticate_image, :only=> :create
    def index
    @image=image.find(params[:image_id])
    @rates = @image.rates

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rates }
    end
  end

  def create
    @image=Image.find(params[:image_id])
     
     if @rate=Rate.find_by_image_id_and_user_id(@image.id,params[:rate][:user_id])
	result=@rate.rate+1
	@rate.update_attributes(:rate=>result)
     else
	@rate=Rate.new(:rate=>1,:image_id=>params[:image_id],:user_id=>params[:rate][:user_id])
	@rate.save
     end
    respond_to do |format|
	@rate_sum=Rate.sum(:rate, :conditions=>{:image_id=>@image.id})
        format.js 
    end
  end

end
