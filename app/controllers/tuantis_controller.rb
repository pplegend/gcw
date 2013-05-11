class TuantisController < ApplicationController
  # GET /tuantis
  # GET /tuantis.json
  def index
    @tuantis = Tuanti.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tuantis }
    end
  end

  # GET /tuantis/1
  # GET /tuantis/1.json
  def show
    @tuanti = Tuanti.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tuanti }
    end
  end

  # GET /tuantis/new
  # GET /tuantis/new.json
  def new
    @tuanti = Tuanti.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tuanti }
    end
  end

  # GET /tuantis/1/edit
  def edit
    @tuanti = Tuanti.find(params[:id])
  end

  # POST /tuantis
  # POST /tuantis.json
  def create
    @tuanti = Tuanti.new(params[:tuanti])

    respond_to do |format|
      if @tuanti.save
        format.html { redirect_to @tuanti, notice: 'Tuanti was successfully created.' }
        format.json { render json: @tuanti, status: :created, location: @tuanti }
      else
        format.html { render action: "new" }
        format.json { render json: @tuanti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tuantis/1
  # PUT /tuantis/1.json
  def update
    @tuanti = Tuanti.find(params[:id])

    respond_to do |format|
      if @tuanti.update_attributes(params[:tuanti])
        format.html { redirect_to @tuanti, notice: 'Tuanti was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tuanti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuantis/1
  # DELETE /tuantis/1.json
  def destroy
    @tuanti = Tuanti.find(params[:id])
    @tuanti.destroy

    respond_to do |format|
      format.html { redirect_to tuantis_url }
      format.json { head :no_content }
    end
  end
end
