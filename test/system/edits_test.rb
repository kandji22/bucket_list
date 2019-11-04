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

click_on('Create')

click_on('mon new titre')
assert page.has_content?('mon new titre')
assert page.has_content?(90)

end
end
