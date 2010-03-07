#create categories
[["academies","Academies"],["teachers","Teachers"],["letters","Letters"],["reader-central","Reader Central"],["anti-gossip","Anti Gossip"]].each do |c|
  cat = Category.new
  cat.name = c[0]
  cat.display_name = c[1]
  cat.save
end
