namespace :json_load do
  desc "Read all JSON files into database"

  task all: :environment do
    Rake::Task['json_load:stores'].invoke
    Rake::Task['json_load:items'].invoke
  end
end
