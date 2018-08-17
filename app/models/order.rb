class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def send_confirmation_email
    OrderMailer.order_summary(self).deliver_now
  end
end
