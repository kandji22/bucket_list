require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
test "Ajouter un commentaire a une idée" do
idea=Idea.new(title:"voici le titre")
idea.save
visit(idea_path(idea))
fill_in("Body",with: "voila un commentaire")
click_on('Post')
assert_equal page.current_path,idea_path(idea)
assert page.has_content?("voila un commentaire")

end
end
