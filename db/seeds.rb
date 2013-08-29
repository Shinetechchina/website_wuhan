# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Staffs extension
Refinery::Staffs::Engine.load_seed

# Added by Refinery CMS Services extension
Refinery::Services::Engine.load_seed

# Added by Refinery CMS References extension
Refinery::References::Engine.load_seed

# Added by Refinery CMS Technologies extension
Refinery::Technologies::Engine.load_seed

# Added by Refinery CMS Clients extension
Refinery::Shinetech::Engine.load_seed

# Added by Refinery CMS Messages extension
Refinery::Messages::Engine.load_seed

# Added by Refinery CMS Customs extension
Refinery::Customs::Engine.load_seed

# Added by Refinery CMS Modals extension
Refinery::Modals::Engine.load_seed
