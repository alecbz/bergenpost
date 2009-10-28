class News < ActiveCouch::Base
  site 'http://localhost:5984'
  has :title
  has :content
  has :date
end