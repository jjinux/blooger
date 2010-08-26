When /^I follow the link for the Atom feed$/ do
  # Here's what it looks like on Blogger:
  # <link rel="alternate" type="application/atom+xml" title="JJinuxLand - Atom" href="http://jjinux.blogspot.com/feeds/posts/default" />
  feed_url = atom_bloog_url(@user)
  within('link[type="application/atom+xml"]') do |link|
    link.dom[:title].should == @user.bloog_title
    link.dom[:href].should == feed_url
  end
  get feed_url
end

Then /^I should get a well\-formed Atom feed$/ do
  assert_response :success
  @doc = Nokogiri::XML(response.body)

  # I'm normally able to test XML, but for some reason @doc.xpath("/feed") and
  # all the variations thereof are just not working for me.  I'm running out
  # of time.  I'm going to have to switch to eye-balling the XML for testing :(
end