class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories, :reject_if => proc { |attributes| attributes['name'].blank? }

  def category_attributes=(category_attributes)
    self.category = Category.find_or_create_by(category: category_attributes[:name]) unless category_attributes[:name].blank?
  end
end
