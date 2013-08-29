Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :modals do
    resources :modals, :path => '', :only => [:index] do
      collection do
        get 'show_by_path'
      end
    end
  end

  # Admin routes
  namespace :modals, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :modals, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
