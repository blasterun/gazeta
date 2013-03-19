class Category < ActiveRecord::Base
  attr_accessible :description, :img_url, :title
  validates :title, :description, :presence => true, :length => { :minimum => 3}
  has_many :articles
end
