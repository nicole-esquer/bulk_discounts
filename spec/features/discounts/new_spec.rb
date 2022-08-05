require 'rails_helper'

RSpec.describe 'create new discounts' do
    before :each do
      @merchant1 = Merchant.create!(name: 'Hair Care')

      @discount10 = @merchant1.discounts.create!(percentage: 10, quantity: 10)
      @discount15 = @merchant1.discounts.create!(percentage: 15, quantity: 15)

      visit new_merchant_discounts_path(@merchant1)
   end

   
end