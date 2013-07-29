namespace :refinery do
  namespace :services do

    desc "Load service demo data"
    task :load_demo => :environment do
      demo_path = "#{Rails.root}/vendor/extensions/services/db/demo"

      YAML.load_file("#{demo_path}/data.yml").each do |attrs|
        next if Refinery::Services::Service.where(title: attrs['title']).exists?
        Refinery::Services::Service.create!(attrs)
      end
    end

  end
end
