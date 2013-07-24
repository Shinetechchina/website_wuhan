namespace :refinery do
  namespace :clients do

    desc "Load client demo data."
    task :load_demo => :environment do
      demo_path = "#{Rails.root}/vendor/extensions/clients/db/demo"

      YAML.load_file("#{demo_path}/data.yml").each do |attrs|
        next if Refinery::Shinetech::Client.where(name: attrs['name']).exists?

        img = Refinery::Image.new
        file = File.open("#{demo_path}/logo/#{attrs['logo']}")
        img.image = file
        img.save!
        file.close

        attrs.delete('logo')
        attrs['logo_id'] = img.id

        Refinery::Shinetech::Client.create!(attrs)
      end
    end

  end
end
