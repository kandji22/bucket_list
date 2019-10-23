require "application_system_test_case"

class SimpleNavigationsTest < ApplicationSystemTestCase

  test 'search term is displayed' do
    visit('/')
    assert page.has_content?('Bucket List')
    fill_in('q', with: 'Spain').send_keys(:enter)
    assert has_content?('Spain')
    assert current_url.include?('q=Spain')
  end


  test 'style guide navigation' do
    visit('/')
    sleep(5.seconds)
    click_on('Style Guide',match: :first)
    sleep(5.seconds)
    assert page.has_content?("Atoms")
    sleep(5.seconds)
    assert page.has_content?("Molecules")
    sleep(5.seconds)
    assert page.has_content?("Organisms")
    sleep(5.seconds)
    click_on('Molecules',match: :first)
    sleep(5.seconds)
    assert page.has_content?("Card")
    sleep(5.seconds)
    click_on('Organisms', match: :first)
    sleep(5.seconds)
    assert page.has_content?('Create goal')
    sleep(5.seconds)
    click_on('My Bucket List', match: :first)
    sleep(5.seconds)
    assert page.has_content?('Some ideas')


  end
end
