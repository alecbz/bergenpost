class Comment < ActiveRecord::Base
  belongs_to :article
  
  # validates_presence_of :body #doesn't work either, brings you to a weird error page regardless of whether or not the body is there
end
