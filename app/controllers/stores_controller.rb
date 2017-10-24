class StoresController < ApplicationController
  def show
  end

  def new
  	@store = Store.new
  	@store.build_user
  end

  def create
  	@store = Store.new(store_params)
  	if @store.save
  		redirect_to store_dashboard_path(@store), notice: 'store created succesfully!'
  	else
  		render :new
  	end
  end


  private

  def store_params
  	params.require(:store).permit(:name, :about, user_attributes: [:first_name, :last_name, :email, :password, :password_confirmation, :country])
  end
end
