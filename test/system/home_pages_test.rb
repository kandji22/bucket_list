require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  test 'home_page'do
  idea=Idea.new
  idea.title='Placez-vous au sommet du pyramide'
    idea.save!
    idea2=Idea.new
    idea2.title='Place-vou '
      idea2.save!
      idea2=Idea.new
      idea2.title=' sommet du pyramide'
        idea2.save!
        idea2=Idea.new
        idea2.title=' sommet '
          idea2.save!
          visit("/")
        
          assert_equal(Idea.most_recent.length,3)
        end
end
