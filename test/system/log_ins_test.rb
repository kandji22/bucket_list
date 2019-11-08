require "application_system_test_case"

class LogInsTest < ApplicationSystemTestCase
  test 'creation d utilisateur' do
visit new_user_path
fill_in('Email',with: "kandji.k66@gmail.com")
click_on('log in')
assert_equal(User.all.length,1)
assert_equal(User.find(1).email,"kandji.k66@gmail.com")

end
test 'la connexion ne crée pas d utilisateur' do
  user=User.new(email: "kandji.k66@gmail.com")
  user.save!
  visit new_user_path
  fill_in('Email',with: user.email)
  click_on('log in')
  assert_equal(1,User.all.length)

end

end
