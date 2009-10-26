class Article < ActiveRecord::Base
  belongs_to(:author)
  has_many(:comments)

#  accepts_nested_attributes_for :comments, :allow_destroy => :true ,  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
