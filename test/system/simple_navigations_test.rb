require "application_system_test_case"

class SimpleNavigationsTest < ApplicationSystemTestCase
  test 'style guide navigation' do
    visit('/')
    assert page.has_content?('Bucket List')
    fill_in('q', with: 'Spain').send_keys(:enter)
    assert has_content?('Spain')
    assert current_url.include?('q=Spain')
  end
end
