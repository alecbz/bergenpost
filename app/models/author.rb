class Author < ActiveRecord::Base
  has_many(:articles)
  
  def to_s
    fname + " " + lname
  end
end
