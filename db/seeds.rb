# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

sample_meetups = [
  { name: 'Swimming Lessons', description: 'For your health', location: 'The middle ocean', date: '2017/04/29', time: '5:00PM', picture: 'https://s-media-cache-ak0.pinimg.com/originals/0c/ea/89/0cea8922ba106b10dccc8c8013ae4d7e.jpg'},
  { name: 'The Abstracts Council', description: 'For your mind and soul', location: 'Cerebellum', date: '2017/04/05', time: '12:00PM', picture: 'http://vignette2.wikia.nocookie.net/starwars/images/4/44/Councilrots.jpg/revision/latest?cb=20090915231817' }
]

sample_meetups.each do |meetup_data|
  meetup = Meetup.new(meetup_data)
  meetup.save
end
