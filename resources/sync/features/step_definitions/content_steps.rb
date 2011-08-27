Given /^the following contents:$/ do |contents|
  Content.delete_all
  contents.hashes.each do |content|
    Factory(:content,content)
  end
end

When /^I delete the (\d+)(?:st|nd|rd|th) content$/ do |pos|
  visit admin_contents_path
  within("div#contents div.content:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

Then /^I should see the following contents:$/ do |expected_contents_table|
  expected_contents_table.diff!(tableish('div#contents div.content', 'div'))
end
