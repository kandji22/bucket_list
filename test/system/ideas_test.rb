require "application_system_test_case"

class IdeasTest < ApplicationSystemTestCase
  test 'create new idea' do
    visit ideas_new_path
    fill_in('title', with: 'ma premier test')
    fill_in('nbr d abonne', with: 30)
    fill_in('photo url', with: 'http://fpoimg.com/255x170')
    click_on('Create')
    assert page.has_content?('ma premier test')
  end
  test ' Ideas records' do
    idea1=Idea.new
    idea1.title='titre enregistrer avans le test'
    idea1.done_count=25
    idea1.photo_url='http://fpoimg.com/255x170'
    idea1.save!
    idea2=Idea.new
    idea2.title='titre2 enregistrer avans le test2'
    idea2.done_count=50
    idea2.photo_url='http://fpoimg.com/255x170'
    idea2.save!
    visit acount_ideas_path
    assert page.has_content?('ma premier test')

  end
end
