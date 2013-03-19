class Comment < ActiveRecord::Base
  attr_accessible :body, :title
  validates :title, :body, :presence => true, :length => { :minimum => 3}
  belongs_to :article
end
