class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]


  def index
    @pins = Pin.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 25)
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create # Create Action
    @pin = current_user.pins.build(pin_params) 
    if
      @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
    #else
    #  render :new
    end
  end

  def update # Update Action
    if
      @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
    #else
    #  render :edit
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
