require "application_system_test_case"

class SearchesTest < ApplicationSystemTestCase
  test 'Description et titre du match' do
  idea1=Idea.new
  idea1.title='Go cycling across Europe'
  idea1.migration='An amazing way to see lots of Europe'
    idea1.save!
    idea2=Idea.new
    idea2.title='Visit Provence'
    idea2.migration='Go to vineyards, go cycling up Mont Ventoux, see the fields of lavende'
      idea2.save!
      idea3=Idea.new
      idea3.title='Overnight hike in Switzerland'
      idea3.migration='Stay in a Swiss refuge in the mountains'
        idea3.save!
      visit('/')
      fill_in('q',with:'cycling').send_keys(:enter)
      assert page.has_content?('Go cycling across Europe')
        assert page.has_content?('Visit Provence')
        refute page.has_content?('Overnight hike in Switzerland')

    end
end
