# See public/sample.xml for a sample feed that I got from Blogger.  I stripped
# out a bunch of stuff from it that we don't need and then translated it into
# the below.

xml.instruct!
xml.instruct!("xml-stylesheet", {:href => "http://www.blogger.com/styles/atom.css", :type => "text/css"})
xml.feed({"xmlns" => "http://www.w3.org/2005/Atom"}) do
  xml.id("tag:blooger,2010:user-#{@bloog.id}")
  xml.updated(@bloog.posts ? @bloog.posts.first.updated_at.xmlschema : Time.now.xmlschema)
  xml.title(@bloog.bloog_title, :type => "text")
  xml.link(:rel  => 'http://schemas.google.com/g/2005#feed',
           :type => 'application/atom+xml',
           :href => atom_bloog_url(@bloog))
  xml.link(:rel => 'alternate', :type => 'text/html', :href => bloog_url(@bloog))
  xml.author do
    xml.name(@bloog.username)
  end
  xml.generator("Blooger", :version => '1.0', :url => root_url)
  @bloog.posts.each do |post|
    xml.entry do
      xml.id("tag:blooger,2010:user-#{@bloog.id}.post-#{post.id}")
      xml.published(post.created_at.xmlschema)
      xml.updated(post.updated_at.xmlschema)
      xml.title(post.title, :type => 'text')
      xml.content(post.body, :type => "html")
      xml.author do
        xml.name(@bloog.username)
      end
    end
  end
end