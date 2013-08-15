Refinery::Core::Engine.routes.append do
  namespace :services, :path => '' do
    # get '/services(/:id)' => 'services#index'

    namespace :admin, :path => 'refinery' do
      resources :services, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
