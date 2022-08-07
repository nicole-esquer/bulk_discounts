require 'rails_helper'

RSpec.describe 'merchant discount show' do
   it 'has the quantity threshhold and percentage off' do
      @merchant1 = Merchant.create!(name: 'Hair Care')

      @discount10 = @merchant1.discounts.create!(percentage: 10, quantity: 10)

      visit merchant_discounts_path(@merchant1)

      expect(page).to have_content(@discount10.percentage)
      expect(page).to have_content(@discount10.quantity)

      save_and_open_page
   end
end