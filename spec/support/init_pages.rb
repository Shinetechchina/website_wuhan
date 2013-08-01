module InitPages
  def self.included(spec)
    spec.class_eval do
      #TODO will add Pages
      #unless Refinery::Page.count > 0
      #  let(:home_page){ create :home_page }
      #  let(:clients_page){ create :clients_page }
      #  let(:technologies_page){ create :technologies_page }
      #  let(:services_page){ create :services_page }
      #  let(:staffs_page){ create :staffs_page }
      #  let(:blog_page){ create :blog_page }

      #  before :each do
      #    binding.pry
      #    home_page
      #    clients_page
      #    technologies_page
      #    services_page
      #    staffs_page
      #    blog_page
      #  end
      #end
    end
  end
end
