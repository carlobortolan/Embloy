# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require 'benchmark'

users = []
jobs = []
applications = []

#=> CREATE USERS
elapsed_user = Benchmark.measure do
  10.times do
    begin
      name_f = Faker::Name.first_name
      name_l = Faker::Name.last_name
      address_full = Faker::Address
      user = User.new(
        first_name: name_f,
        last_name: name_l,
        email: name_f + name_l + "@embloy.com",
        password: Faker::Alphanumeric.alpha(number: 10),
        longitude: Faker::Number.decimal,
        latitude: Faker::Number.decimal,
        country_code: address_full.country_code,
        postal_code: address_full.postcode,
        city: address_full.city,
        address: address_full.street_address,
        date_of_birth: DateTime.parse(Time.at(rand * Time.now.to_i).to_s),
        created_at: Faker::Date.to_s,
        updated_at: Faker::Date.to_s,
        activity_status: [0, 1].sample,
        view_count: rand(1100)
      )
      users.push(user)
    rescue Exception => exception
      puts exception.message
    end
  end
  puts "FINISHED CREATING USERS"
end
puts "Created 10 Users in #{elapsed_user.real} seconds."
User.import(users)

#=> CREATE JOBS POSTGRESQL
elapsed_job = Benchmark.measure do
  5000.times do
    begin
      address_full = Faker::Address
      job = Job.new(
        job_type: Faker::Job.field,
        job_status: 0,
        status: 'public',
        user_id: (Faker::Number.number % 800) + 1,
        duration: Faker::Number.number(digits: 4),
        code_lang: address_full.country_code,
        title: Faker::Job.title,
        position: Faker::Job.position,
        description: Faker::GreekPhilosophers.quote,
        key_skills: Faker::Job.key_skill,
        salary: Faker::Number.decimal,
        currency: Faker::Currency.name,
        image_url: "DE",
        start_slot: DateTime.parse(Time.at(rand * Time.now.to_i).to_s),
        longitude: Faker::Number.decimal,
        latitude: Faker::Number.decimal,
        country_code: address_full.country_code,
        postal_code: address_full.postcode,
        city: address_full.city,
        address: address_full.street_address,
        view_count: rand(1100),
        created_at: Faker::Date.to_s,
        updated_at: Faker::Date.to_s,
      )
      jobs.push(job)
    rescue Exception => exception
      puts exception.message
    end
  end
  puts "FINISHED CREATING JOBS"
end
puts "Created 5000 Jobs in #{elapsed_job.real} seconds."
Job.import(jobs)

# => CREATE APPLICATIONS
# elapsed_application = Benchmark.measure do
#   1000.times do
#     begin
#       response = [Faker::Quote.yoda, nil].sample
#       a_id = (Faker::Number.number % 800) + 1
#       j_id = (Faker::Number.number % 800) + 1
#       if Application.find_by(user_id: a_id, job_id: j_id).nil?
#         application = Application.new(
#           user_id: a_id,
#           job_id: j_id,
#           application_text: "Dear #{Faker::GreekPhilosophers.name}, I am writing to express my interest in #{Faker::Job.position} that was advertised on embloy.com. I am a highly #{Faker::Adjective.positive} and #{Faker::Adjective.positive} with #{rand(max = 30)} years of experience in #{Faker::Job.field}. As you will see from my attached resume, I have a strong track record of #{Faker::Marketing.buzzwords}, #{Faker::Marketing.buzzwords} as well as #{Faker::Marketing.buzzwords}. I believe that my skills and experience make me an ideal candidate for the position and I am excited about the opportunity to contribute to your company and its goals. #{Faker::GreekPhilosophers.quote}. Thank you for considering my application. I look forward to hearing from you soon.",
#           application_documents: Faker::Internet.url,
#           response: response,
#           applied_at: DateTime.now,
#           status: response.nil? ? 0 : ([-1, 1].sample)
#         )
#         applications.push(application)
#       end
#     rescue Exception => exception
#       puts exception.message
#     end
#   end
#   puts "FINISHED CREATING APPLICATIONS"
# end
# Application.import(applications)
# puts "Created 1000 Applications in #{elapsed_application.real} seconds."
