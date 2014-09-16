xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "The Simple SOL"
    xml.description "A blog from the simple sol"
    xml.link root_url + "solblog"

    for blog in @feed_blogs
      xml.item do
        xml.title blog.title
        xml.description blog.body
        xml.pubDate blog.created_at.strftime "%D"
        xml.link root_url + "solblog?blog_id=" + blog.id.to_s
      end
    end
  end
end