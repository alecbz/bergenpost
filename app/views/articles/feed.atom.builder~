atom_feed do |feed|
  feed.title("The Bergen Post")
  feed.updated(@articles.first.created_at)
  
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title(article.title)
      entry.content(article.body, :type => 'html')
      entry.author { |author| author.name(article.author.name) }
    end
  end
end