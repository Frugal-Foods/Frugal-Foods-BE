namespace :json_load do
  desc 'Create User'
  task user: :environment do
    User.create!(email: 'awesomeuseremail@aol.com')

    ActiveRecord::Base.connection.reset_pk_sequence!('user')
  end
end
