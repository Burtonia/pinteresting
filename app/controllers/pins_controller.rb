class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]


  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = Pin.new # current_user.pins.build did not work
  end

  def edit
  end

  def create # Create Action
    @pin = Pin.new(pin_params) 

    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    else
      render :new
    end
  end

  def update # Update Action
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    else
      render :edit
    end
  end

  def destroy # Destroy Action
    @pin.destroy
      redirect_to pins_url, notice: 'Pin was successfully destroyed.'
  end

  private

    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
