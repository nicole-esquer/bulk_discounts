class DiscountsController < ApplicationController
   def index
      @discounts = Discount.all
      @merchant = Merchant.find(params[:merchant_id])
   end  

   def show
   end

   def new
      @discount = Discount.new
      @merchant = Merchant.find(params[:merchant_id])
   end

   def create
      merchant = Merchant.find(params[:merchant_id])
      discount = merchant.discounts.create(discount_params)
      redirect_to merchant_discounts_path(merchant)
  end

private

  def discount_params
    params.require(:discount).permit(:quantity, :percentage)
  end
end