namespace :refinery do

  namespace :technologies do

    desc "Load technologies demo data"
    task :load_demo => :environment do
      demo_path = "#{Rails.root}/vendor/extensions/technologies/db/demo"

      YAML.load_file("#{demo_path}/data.yml").each do |attrs|
        next if Refinery::Technologies::Technology.where(title: attrs['title']).exists?

        img = Refinery::Image.new
        file = File.open("#{demo_path}/image/#{attrs['image']}")
        img.image = file
        img.save!
        file.close

        attrs.delete('image')
        attrs['image_id'] = img.id

        Refinery::Technologies::Technology.create!(attrs)
      end
    end

  end

end
