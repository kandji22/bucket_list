require "application_system_test_case"

class ShowIdeasTest < ApplicationSystemTestCase
test 'test du fichier show' do
idea=Idea.new
idea.title='je suis le nouveau titre'
idea.done_count=96
idea.save!
visit (show_ideas_path(idea))
  sleep(5.seconds)
assert has_content?('je suis le nouveau titre')
assert has_content?('96')
assert has_content?(idea.created_at.strftime("%d %b %y"))
  sleep(5.seconds)
click_on('Edit',match: :first)
  sleep(5.seconds)
assert current_url.include?('edit')
end
end
