class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  acts_as_ferret

  accepts_nested_attributes_for :comments, :allow_destroy => :true
end
