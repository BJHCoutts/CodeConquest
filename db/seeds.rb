PASSWORD = "supersecret"

User.destroy_all
DrillGroup.destroy_all
Drill.destroy_all
Question.destroy_all
Transcript.destroy_all

admin_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD,
  admin: true,
  is_approved: false
)
30.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD,
    admin: false,
    is_approved: [true, false].sample,
  )
end

users = User.all
admins = users.where("admin = true")
approved_students = users.where(is_approved: false)
not_approved_students = users.where(is_approved: true)

puts Cowsay.say "Created total #{users.count} users", :tux
puts Cowsay.say "Created #{admins.count} admin users", :tux
puts Cowsay.say "Created #{approved_students.count} approved studnets", :tux
puts Cowsay.say "Created #{not_approved_students.count} not approved students", :tux

 
10.times.each do
  dg = DrillGroup.create(
      title: Faker::Simpsons.quote,
      description: Faker::Hacker.say_something_smart,
      user: users.sample
  )
end



dgs = DrillGroup.all

20.times.each do
  d = Drill.create(
    title: Faker::Job.key_skill,
    description: Faker::MostInterestingManInTheWorld.quote,
    difficulty: ["Beginner", "Intermediate", "Advanced"].sample,
    drill_group: dgs.sample
  )
end

drills = Drill.all

200.times.each do
  options = [
    Faker::BackToTheFuture.character,
    Faker::Artist.name,
    Faker::Beer.hop,
    Faker::Beer.malts,
    Faker::Beer.name
  ]

  q = Question.create(
    body: Faker::BackToTheFuture.quote,
    options: options,
    answer: options.sample,
    point: (1..50).to_a.sample,
    drill: drills.sample
  )
end

drills.each do |drill|
  users.shuffle[0..2].each do |user|
    qs = drill.questions 

    t = Transcript.create(
      user: user, 
      drill: drill, 
      student_score: (1..100).to_a.sample,
      full_mark: (100..120).to_a.sample,
    )

    qs.each do |q|
      Record.create(
        user: user,
        question: q,
        drill: q.drill,
        transcript: t,
        student_answer: (0..4).to_a.sample,
        is_correct: [true, false].sample
      )
    end
  end
end
q = Question.all
t = Transcript.all
r = Record.all 

puts Cowsay.say "Created #{dgs.count} drill groups", :frogs

puts Cowsay.say "Created #{drills.count} drills", :daemon

puts Cowsay.say "Created #{q.count} questions", :daemon

puts Cowsay.say "Created #{t.count} transcripts", :daemon

puts Cowsay.say "Created #{r .count} records", :frogs

puts "Login with #{admin_user.email} and password of #{PASSWORD}"