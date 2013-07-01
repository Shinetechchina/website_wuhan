Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :staffs do
    resources :staffs, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :staffs, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :staffs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
