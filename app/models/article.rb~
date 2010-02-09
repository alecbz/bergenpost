class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :comments
  acts_as_ferret :fields => [:title, :body]

  # accepts_nested_attributes_for :comments, :allow_destroy => :true

  def popularity
    views*1 + comments.size*1
  end
end
