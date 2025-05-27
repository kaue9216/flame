class FiresController < ApplicationController

  def index
    @fires = Fire.all
  end

  def show
    @fire = Fire.find(params[:id])
    @images  = [ "yellow.gif", "circle.gif", "spok.gif", "banana.gif"]
    @random_no = rand(4)
    @random_image = @images[@random_no]
  end

  def edit
    @fire = Fire.find(params[:id])
  end

  def update
    @fire = Fire.find(params[:id])
    if @fire.update(fire_params)
      redirect_to @fire, notice: "Fire was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @fire = Fire.new
  end

  def create
    @fire = Fire.new(fire_params)

    if @fire.save
      redirect_to @fire, notice: "Fire was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @fire = Fire.find(params[:id])
    @fire.destroy
    redirect_to root_path
  end

  private

  def fire_params
    params.require(:fire).permit(:maker, :model, :date)
  end
end
