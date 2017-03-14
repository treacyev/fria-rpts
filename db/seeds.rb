# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Announcement.create(title: 'Start of Submission Period', text: 'We are accepting proposal submissions as of today!', isDraft: false)
# Announcement.create(title: 'Scheduled maintenance: 05/13/1996', text: 'We will be performing a scheduled maintenance on the specified date', isDraft: false)
# Announcement.create(title: 'Deadline for final report submissions', text: 'Reminder for the requirement of final report', isDraft: false)
# Announcement.create(title: 'End of Submission Period', text: 'Proposal submission will be closed', isDraft:false)
# Announcement.create(title: 'Results', text: 'Results will be released next week friday', isDraft:false)

Researcher.create(first_name: 'Com', last_name: 'Pyutierre', department: 'MMM', rank: 'Assistant Instructor', contact_number: '9123456789', email: 'mail1@example.com', password: "password", password_confirmation: "password") 
Researcher.create(first_name: 'Palma', last_name: 'Haul', department: 'CoE', rank: 'Professor', contact_number: '9333867460', email: 'mail2@example.com', password: "password", password_confirmation: "password")
Admin.create(first_name: 'Mang', last_name: 'Melchor', department: 'CE', rank: 'Instructor', contact_number: '9835583620', email: 'mail3@example.com', password: "password", password_confirmation: "password")
CommitteeHead.create(first_name: 'Romulo', last_name: 'Hall', department: 'ECE', rank: 'Instructor', contact_number: '9653778294', email: 'mail4@example.com', password: "password", password_confirmation: "password")
CommitteeMember.create(first_name: 'Alfred', last_name: 'Vargas', department: 'CS', rank: '', contact_number: '9768465839', email: 'mail5@example.com', password: "password", password_confirmation: "password")

Proposal.create(title: 'Fire Resistant Paper', principalResearcher: 'Com Pyutierre', coresearchers: 'Thomas Edison', rdCost: '123', objectives: 'Make a fire resistant paper', expectedOutputs: 'Fire Resistant Paper', description: 'none', weeklyHours: '5', endorsement: false, listAgency: false, attachment: 'att1', status: 'pending')
Proposal.create(title: 'World Peace', principalResearcher: 'Com Pyutierre', coresearchers: 'Mahatma Gandhi', rdCost: '123', objectives: 'Attain inner peace', expectedOutputs: 'World Peace', description: 'none', weeklyHours: '6', endorsement: false, listAgency: false, attachment: 'att1', status: 'pending')
Proposal.create(title: 'Portable Death Ray', principalResearcher: 'Com Pyutierre', coresearchers: 'Nikola Tesla', rdCost: '123', objectives: 'Make killing a breeze', expectedOutputs: 'Handheld killing device', description: 'none', weeklyHours: '', endorsement: false, listAgency: false, attachment: 'att1', status: 'pending')
Proposal.create(title: 'Quantum Computing', principalResearcher: 'Palma Haul', coresearchers: 'Albert Einstein', rdCost: '123', objectives: 'I really dont know', expectedOutputs: 'May magbabasa kaya nito?', description: 'none', weeklyHours: '9', endorsement: false, listAgency: false, attachment: 'att1', status: 'pending')
Proposal.create(title: 'Blackholes', principalResearcher: 'Palma Haul', coresearchers: 'Stephen Hawking', rdCost: '123', objectives: 'Understanding that hole', expectedOutputs: 'Blackhole?', description: 'none', weeklyHours: '7', endorsement: false, listAgency: false, attachment: 'att1', status: 'pending')
Proposal.create(title: 'Teleportation Ports', principalResearcher: 'Palma Haul', coresearchers: 'Neil Degrasse Tyson', rdCost: '123', objectives: 'Faster travel', expectedOutputs: 'Teleportation Device', description: 'none', weeklyHours: '3', endorsement: false, listAgency: false, attachment: 'att1', status: 'pending')

Review.create(attachment: 'att1', isDraft:false)
Review.create(attachment: 'att1', isDraft:false)
Review.create(attachment: 'att1', isDraft:false)
Review.create(attachment: 'att1', isDraft:false)
Review.create(attachment: 'att1', isDraft:false)
Review.create(attachment: 'att1', isDraft:false)
