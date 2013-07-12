Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :customers do
    resources :customers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :customers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :customers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
