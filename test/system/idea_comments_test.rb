require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
test "Ajouter un commentaire a une idée" do
  user=User.new(email: "lune.kandji@hotmail.fr")
  user.save!
  idea=Idea.new(title:"voici le titre")
  idea.save
  visit new_user_path
  fill_in("Email",with: user.email)
  click_on("log in")
visit(idea_path(idea))

fill_in("Add a comment",with: "voila un commentaire")
click_on('Post')
assert_equal page.current_path,idea_path(idea)
assert page.has_content?("voila un commentaire")

end
test 'il n ya pa de commentaire si n ya pas de login' do
  idea=Idea.new(title:'voici un titre')
  idea.save!
  visit idea_path(idea)
  sleep(2.seconds)
  refute page.has_content?('Add a Comment')

end
end
