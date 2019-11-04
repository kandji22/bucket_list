require "application_system_test_case"

class EditsTest < ApplicationSystemTestCase
test 'test sur edit/idea' do
idea=Idea.new
idea.title='moi lune'
idea.done_count=2
idea.photo_url='http://fpoimg.com/255x170'
idea.save!
visit  edit_idea_path(idea)

fill_in('Title',with:'mon new titre')
fill_in('Done count',with:90)

click_on('Update Idea')

click_on('mon new titre')
assert page.has_content?('mon new titre')
assert page.has_content?(90)

end
test 'test d erreur de validation' do
visit new_idea_path
fill_in('Done count',with: 40)
fill_in('Photo url',with: 'http://fpoimg.com/255x170')
click_on('Create Idea')
assert page.has_content?("Title can't be blank")
end
test 'test de titre trop long dans update' do
  idea=Idea.new
  idea.title='moi lune'
  idea.done_count=2
  idea.photo_url='http://fpoimg.com/255x170'
  idea.migration='j adore ceci'
  idea.save!
  visit  edit_idea_path(idea)
  fill_in('Title',with:'test de titre trop long dans updatetest de titre trop long dans updatetest de titre trop long dans update')
  click_on("Update Idea")
  assert page.has_content?("Title is too long (maximum is 75 characters)")

end
end
