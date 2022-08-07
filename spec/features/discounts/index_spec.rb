require 'rails_helper'

RSpec.describe 'discounts index page' do
   before :each do
      @merchant1 = Merchant.create!(name: 'Hair Care')

      @discount10 = @merchant1.discounts.create!(percentage: 10, quantity: 10)
      @discount15 = @merchant1.discounts.create!(percentage: 15, quantity: 15)

      visit merchant_discounts_path(@merchant1)
   end

   it 'shows all bulk discounts including percentage discount and quantity thresholds' do
      expect(page).to have_content(@discount10.quantity)
      expect(page).to have_content(@discount10.percentage)
   end

   xit 'has link to discount show page' do
      click_on('See more information about Discount')

      expect(current_path).to eq("/merchant/#{@merchant1}/discounts/#{@discount10}")
    end

   xit 'has a link to create a new discount' do
      click_on('Create New Discount')
   
      expect(current_path).to eq(new_merchant_discount_path(@merchant1))

      fill_in(:quantity, with: 30)
      fill_in(:percentage, with: 30)

      click_on 'Create New Discount'

      expect(page).to have_content('30%')
      expect(page).to have_content(30)
   end

   it 'has a link to delete a discount' do
      @discount100 = @merchant1.discounts.create!(percentage: 100, quantity: 1)

      click_on "Delete Discount", match: :first
      
      expect(page).to_not have_content(@discount100.percentage)
      expect(page).to_not have_content(@discount100.quantity)
      expect(current_page).to eq(merchant_discounts_path(@merchant1))
   end
end