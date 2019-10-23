require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  test 'create new idea' do
    visit ideas_new_path
    sleep(2.seconds)
    fill_in('title', with: 'ma premier test')
      sleep(2.seconds)
    fill_in('nbr d abonne', with: 30)
      sleep(2.seconds)
    fill_in('photo url', with: 'http://fpoimg.com/255x170')
      sleep(2.seconds)
    click_on('Create')
    sleep(2.seconds)
    visit acount_ideas_path
    sleep(2.seconds)
  end
end
