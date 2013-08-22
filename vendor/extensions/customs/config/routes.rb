Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :customs do
    resources :customs, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :customs, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :customs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
