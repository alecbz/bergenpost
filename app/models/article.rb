class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :category
  has_many :comments
  acts_as_ferret :fields => [:title, :body]

  def popularity
    views*1 + comments.size*1
  end
  
  def snippet
    html = false
    count = 0
    real_count = 0
    body.split('').each do |c|
      break if count >= 240
      if c == '<'
	html = true
	real_count += 1
      elsif c == '>'
	html = false
	real_count += 1
      else
	unless html
	  count += 1
	  real_count += 1
	end
      end
    end
    body[0..real_count]
  end
end
