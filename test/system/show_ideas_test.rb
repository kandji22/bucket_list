require "application_system_test_case"

class ShowIdeasTest < ApplicationSystemTestCase
test 'test du fichier show' do
idea=Idea.new
idea.title='je suis le nouveau titre'
idea.done_count=96
idea.save!
visit (idea_path(idea))

assert has_content?('je suis le nouveau titre')
assert has_content?('96')
assert has_content?(idea.created_at.strftime("%d %b %y"))

click_on('Edit',match: :first)

assert current_url.include?('edit')
end
end
