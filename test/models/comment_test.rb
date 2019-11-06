require 'test_helper'

class CommentTest < ActiveSupport::TestCase
test "changer d'idée associé a un commentaire" do
  idea1=Idea.new(title:'alune')
  idea1.save
  comment1=Comment.new(body:"j adore cette idée ", idea: idea1, user: User.new)
  comment1.save
  idea2=Idea.new(title:'babacar')
  comment1.idea=idea2
  comment1.save
  assert_equal(comment1.idea,Idea.find(2))



end
end
