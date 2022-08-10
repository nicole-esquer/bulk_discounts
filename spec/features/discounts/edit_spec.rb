require 'rails_helper'

RSpec.describe 'discount edit' do
   xit 'can update a discount' do
      merchant1 = Merchant.create!(name: 'Hair Care')
      discount10 = merchant1.discounts.create!(percentage: 10, quantity: 10)
      
      visit merchant_discount_path(merchant1, discount10)

      fill_in 'Percentage', with: 30
      fill_in 'Quantity', with: 50

      click_on 'Update Discount'

      expect(current_path).to eq(merchant_discount_path(merchant1, discount10))
      expect(page).to have_content(30)
      expect(page).to have_content(30)
   end
end