require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Cat < ActiveRecord::Base
  COLORS = %w(Black Brown Yellow White Orange Multicolor)

  validates :name, :sex, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ["M", "F"]

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    (Time.now.to_date - self.birth_date).to_i / 365
  end
end
