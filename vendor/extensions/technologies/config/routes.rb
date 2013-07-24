Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :technologies do
    resources :technologies, :path => '', :only => :index
  end

  # Admin routes
  namespace :technologies, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :technologies, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
