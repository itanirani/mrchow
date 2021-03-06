class ReservationsController < ApplicationController
  def index
  	@reservations = Reservation.all
  end

  def new
  	@reservation = Reservation.new
  end

  def show
  	@reservation = Reservation.find(params[:id])
  end

  def edit
  	@reservation = Reservation.find(params[:id])
  end

  def create
  	@reservation = Reservation.new(reservation_params)

  	if @reservation.save
  		redirect_to reservation_path(@reservation)
  	else
  		render :new
  	end
  end

  def update
  	@reservation = Reservation.find(params[:id])

  	if @reservation.update_attributes(reservation_params)
  		redirect_to reservation_params(@reservation)
  	else
  		render :edit
  	end
  end

  def destroy
  	@reservation = Reservation.find(params[:id])
  	@reservation = Reservation.destroy
  	redirect_to reservations_path
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:restaurant_id, :group_size, :start)
  end
end
