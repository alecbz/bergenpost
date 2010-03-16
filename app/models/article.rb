class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :comments
  
  acts_as_ferret :fields => [:title, :body]
  
  validates_presence_of :title, :body
  
  define_index do
    indexes body
    indexes title
  end

  def popularity
    views*1 + comments.size*1
  end
  
end
