require "application_system_test_case"

class IdeaCommentsTest < ApplicationSystemTestCase
test "Ajouter un commentaire a une idée" do
idea=Idea.new(title:"voici le titre")
idea.save
visit(idea_path(idea))
fill_in("Body",with: "voila un commentaire").send_keys(:enter)
assert_equal current_path,idea_path(idea)

end
end
