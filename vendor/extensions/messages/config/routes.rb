Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :messages do
    resources :messages, :path => '', :expect => [:update, :destroy]
  end

  # Admin routes
  namespace :messages, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :messages, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
