class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  enum status: [:cancelled, 'in progress', :completed]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def merchant_total_revenue(merchant_id)
    invoice_items
      .joins(:item)
      .where('items.merchant_id = ?', merchant_id)
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
  
  def discounted_revenue
    discounted = invoice_items.sum('(invoice_items.quantity * invoice_items.discount * invoice_items.unit_price) / 100')
    total_revenue - discounted
  end

 def merchant_discounted_revenue(merchant_id)
    discounted = invoice_items.joins(:item)
                .where('items.merchant_id = ?', merchant_id)
                .sum('(invoice_items.quantity * invoice_items.discount * invoice_items.unit_price) / 100')

    merchant_total_revenue(merchant_id) - discounted
  end
end
