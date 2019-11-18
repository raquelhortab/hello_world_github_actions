class FavouriteFoodsController < ApplicationController
  # GET /favourite_foods
  # GET /favourite_foods.json
  def index
    @favourite_foods = FavouriteFood.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favourite_foods }
    end
  end

  # GET /favourite_foods/1
  # GET /favourite_foods/1.json
  def show
    @favourite_food = FavouriteFood.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favourite_food }
    end
  end

  # GET /favourite_foods/new
  # GET /favourite_foods/new.json
  def new
    @favourite_food = FavouriteFood.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favourite_food }
    end
  end

  # GET /favourite_foods/1/edit
  def edit
    @favourite_food = FavouriteFood.find(params[:id])
  end

  # POST /favourite_foods
  # POST /favourite_foods.json
  def create
    @favourite_food = FavouriteFood.new(params[:favourite_food])

    respond_to do |format|
      if @favourite_food.save
        format.html { redirect_to @favourite_food, notice: 'Favourite food was successfully created.' }
        format.json { render json: @favourite_food, status: :created, location: @favourite_food }
      else
        format.html { render action: "new" }
        format.json { render json: @favourite_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favourite_foods/1
  # PUT /favourite_foods/1.json
  def update
    @favourite_food = FavouriteFood.find(params[:id])

    respond_to do |format|
      if @favourite_food.update_attributes(params[:favourite_food])
        format.html { redirect_to @favourite_food, notice: 'Favourite food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favourite_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourite_foods/1
  # DELETE /favourite_foods/1.json
  def destroy
    @favourite_food = FavouriteFood.find(params[:id])
    @favourite_food.destroy

    respond_to do |format|
      format.html { redirect_to favourite_foods_url }
      format.json { head :no_content }
    end
  end
end
