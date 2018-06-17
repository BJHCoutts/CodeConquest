PASSWORD = "supersecret"

User.destroy_all
DrillGroup.destroy_all
Drill.destroy_all

admin_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD,
  admin: true,
  approved_student: false
)
10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD,
    admin: false,
    approved_student: [true, false].sample
  )
end

users = User.all
admins = users.where("admin = true")
approved_students = users.where("approved_student = false")
not_approved_students = users.where("approved_student = true")

puts Cowsay.say "Created total #{users.count} users", :tux
puts Cowsay.say "Created #{admins.count} admin users", :tux
puts Cowsay.say "Created #{approved_students.count} approved studnets", :tux
puts Cowsay.say "Created #{not_approved_students.count} not approved students", :tux

 
3.times.each do
  dg = DrillGroup.create(
      title: Faker::Simpsons.quote,
      description: Faker::Hacker.say_something_smart,
      difficulty: ["Beginner", "Intermediate", "Advanced"].sample,
      user: users.sample
  )
end



dgs = DrillGroup.all

100.times.each do
  questions = []
  answers = []
  10.times.each do 
    question = Faker::BackToTheFuture.quote
    
    questions << {
      title: question,
      options: [
        Faker::BackToTheFuture.character,
        Faker::Artist.name,
        Faker::Beer.hop,
        Faker::Beer.malts,
        Faker::Beer.name,
      ]
    }
    answers << ["0","1","2","3","4"].sample
  end
  d = Drill.create(
      title: Faker::Job.key_skill,
      description: Faker::MostInterestingManInTheWorld.quote,
      questions: questions,
      answers: answers,
      drill_group: dgs.sample
  )
end


d = Drill.all

puts Cowsay.say "Created #{dgs.count} drill groups", :frogs

puts Cowsay.say "Created #{d.count} drills", :daemon

puts "Login with #{admin_user.email} and password of #{PASSWORD}"