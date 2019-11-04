require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test 'the first empty Idea created is first in the list' do
     first_idea = Idea.new
     first_idea.title='je me nomme lune'
     first_idea.save!
     second_idea = Idea.new
     second_idea.title='je me nomme lune'
     second_idea.save!
     assert_equal(first_idea, Idea.all.first)
   end
   test 'the first complete Idea created is first in the list' do
    first_idea = Idea.new
    first_idea.title = 'Cycle the length of the United Kingdom'
    first_idea.photo_url = 'http://mybucketlist.ch/an_image.jpg'
    first_idea.done_count = 12
    first_idea.save!
    second_idea = Idea.new
    second_idea.title = 'Visit Japan'
    second_idea.photo_url = 'http://mybucketlist.ch/second_image.jpg'
    second_idea.done_count = 3
    second_idea.save!
    assert_equal(first_idea, Idea.all.first)
  end
  test 'updated_at is changed after updating title' do
   idea = Idea.new
   idea.title = 'Visit Marrakech'
   idea.save!
   first_updated_at = idea.updated_at
   idea.title = 'Visit the market in Marrakech'
   idea.save!
   refute_equal(idea.updated_at, first_updated_at)
 end
 test 'updated_at is changed after updating done_count' do
  idea = Idea.new
  idea.title='je me nomme lune'
  idea.done_count =33
  idea.save!
  first_updated_at = idea.updated_at
  idea.done_count =44
  idea.save!
  refute_equal(idea.updated_at, first_updated_at)
end
test 'updated_at is changed after updating photo_url' do
 idea = Idea.new
 idea.title='je me nomme lune'
 idea.photo_url ='http://fpoimg.com/255x170'
 idea.save!
 first_updated_at = idea.updated_at
 idea.photo_url ='http://fpoimg.com/255x1702'
 idea.save!
 refute_equal(idea.updated_at, first_updated_at)
end

test 'Un résultat correspondant' do
  idea=Idea.new
  idea.title='Empire State Building'
  idea.done_count=50
  idea.photo_url='http://fpoimg.com/255x170'
  idea.save!
  assert_equal Idea.search('Empire').length,1

end
test 'Aucun résultat correspondant' do
  idea=Idea.new
  idea.title='Empire State Building'
  idea.done_count=50
  idea.photo_url='http://fpoimg.com/255x170'
  idea.save!
  assert_empty(Idea.search('snorkelling'))

end
test 'Deux résultats correspondants' do
  idea=Idea.new
  idea.title='Placez-vous au sommet du pyramide'
  idea.done_count=90
  idea.photo_url='http://fpoimg.com/255x170'
  idea.save!
  idea2 =Idea.new
  idea2.title='Debout sur une pyramide'
  idea2.done_count=50
  idea2.photo_url='http://fpoimg.com/255x170'
  idea2.save!
  assert_equal Idea.search('pyramide').length, 2
end
test 'Aucun enregistrement d idée n existe' do
assert_equal(Idea.most_recent.length,0)
end
test 'Deux enregistrements d idées existent.' do
idea=Idea.new
idea.title='Placez-vous au sommet du pyramide'
  idea.save!
  idea2=Idea.new
  idea2.title='Place-vou au sommet du pyramide'
    idea2.save!
assert_equal(Idea.most_recent.length,2)
assert_equal(Idea.most_recent.first.title,'Place-vou au sommet du pyramide')
end
test 'Six enregistrements d idées existent' do
6.times do |i|
  idea =Idea.new
  idea.title ="titre #{i + 1}"
  idea.save!
end
assert_equal(Idea.most_recent.first.title,'titre 6')
end
test 'Only description match' do
  idea2=Idea.new
  idea2.title='Surfing in Portugal'
  idea2.migration='See what Atlantic coast waves are like'
    idea2.save!
    assert_equal(Idea.search('coast').length,1)
end
test 'Description et titre du match' do
idea1=Idea.new
idea1.title='Randonnée de nuit en Suisse'
idea1.migration='Séjour dans un refuge suisse à la montagne'
  idea1.save!
  idea2=Idea.new
  idea2.title='Randonnée dans les montagne en Italie'
  idea2.migration='Voir les Dolomites et les Alpes italiennes'
    idea2.save!
    assert_equal(Idea.search('montagne').length,2)
  end
  test 'Definition d un titre trop long' do
    idea1=Idea.new
    idea1.title='Randonnée de nuit en Suisse Randonnée de nuit en Suisse Randonnée de nuit en Suisse Randonnée de nuit en Suisse Randonnée de nuit en Suisse Randonnée de nuit en Suisse'
    assert_equal(idea1.valid?,false)  
  end
end
