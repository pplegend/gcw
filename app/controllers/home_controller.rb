class HomeController < ApplicationController
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end
end
