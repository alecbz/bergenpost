class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  acts_as_ferret :fields => [:title, :body]

  # accepts_nested_attributes_for :comments, :allow_destroy => :true
end
