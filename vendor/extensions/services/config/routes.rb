Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :services do
    resources :services, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :services, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :services, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
