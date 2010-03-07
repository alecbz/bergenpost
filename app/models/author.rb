class Author < ActiveRecord::Base
  has_many :articles
  
  def name
    fname + " " + lname
  end
  
  def to_s
    fname + " " + lname
  end
end
