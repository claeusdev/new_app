class StoresController < ApplicationController
  before_action :authenticate_user!, except: :show

  def show
    @store = Store.find(params[:id])
    impressionist(@store)
    @review = Review.new
  end

  def new
  	@store = Store.new
  	@store.build_user
  end

  def create
  	@store = Store.new(store_params)
    @store.user_id = current_user.id
  	if @store.save
  		redirect_to store_dashboard_path(@store), notice: 'store created succesfully!'
  	else
  		render :new
  	end
  end


  private

  def store_params
  	params.require(:store).permit(:name, :about, :category_id)
  end
end
