class Article < ActiveRecord::Base
  attr_accessible :body, :title, :category_id, :tag_list
  validates :title, :body, :presence => true, :length => { :minimum => 3}
  has_many :comments, :dependent=> :destroy 
  belongs_to :category
  acts_as_taggable
  
end
