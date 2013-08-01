FactoryGirl.define do
  factory :refinery_page, class: Refinery::Page do
    show_in_menu 'true'
    link_url ''
    skip_to_first_child false
    view_template 'blank'
    layout_template 'blank'
  end

  factory :home_page, parent: :refinery_page do
    slug 'home'
  end

  factory :clients_page, parent: :refinery_page do
    slug 'clients'
  end

  factory :technologies_page, parent: :refinery_page do
    slug 'technologies'
  end

  factory :services_page, parent: :refinery_page do
    slug 'services'
  end

  factory :staffs_page, parent: :refinery_page do
    slug 'staffs'
  end

  factory :blog_page, parent: :refinery_page do
    slug 'blog'
  end

end
