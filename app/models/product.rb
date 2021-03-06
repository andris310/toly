class Product < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :orders, through: :line_items
  has_many :coupons
  has_and_belongs_to_many :videos

  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  # validates :image, allow_blank: true, format: {
  #   with: %r{\.(gif|jpg|png)\Z}i,
  #   message: 'must be GIF, JPG or PNG image.'
  # }

  mount_uploader :image, PictureUploader

  def downloadable
    if self.category == '3'
      false
    elsif self.is_downloadable
      true
    else
      false
    end
  end

  def self.latest
    Product.order(:updated_at).last
  end

  private
  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end

end
