require 'rails_helper'

RSpec.describe 'merchant discount show' do
   xit 'has the quantity threshhold and percentage off' do
      merchant1 = Merchant.create!(name: 'Hair Care')

      @discount10 = @merchant1.discounts.create!(percentage: 10, quantity: 10)

      expect(page).to have_content("Quantity Threshhold: #{discount.quantity}")
      expect(page).to have_content("Percentage Off: #{discount.percentage}%")
   end
end