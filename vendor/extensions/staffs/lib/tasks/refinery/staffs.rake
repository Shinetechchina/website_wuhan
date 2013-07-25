namespace :refinery do
  namespace :staffs do

    desc "Load technologies demo data"
    task :load_demo => :environment do
      demo_path = "#{Rails.root}/vendor/extensions/staffs/db/demo"

      YAML.load_file("#{demo_path}/data.yml").each do |attrs|
        next if Refinery::Staffs::Staff.where(name: attrs['name']).exists?
        next if Refinery::Staffs::Staff.where(number: attrs['number']).exists?

        img = Refinery::Image.new
        file = File.open("#{demo_path}/image/#{attrs['image']}")
        img.image = file
        img.save!
        file.close

        attrs.delete('image')
        attrs['image_id'] = img.id

        Refinery::Staffs::Staff.create!(attrs)
      end
    end

  end
end
