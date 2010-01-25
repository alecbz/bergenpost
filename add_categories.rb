#not sure where the best place to put this file is
["academies","teachers","letters","reader-central","anti-gossip"].each do |c|
  cat = Category.new
  cat.name = c
  cat.save
end
