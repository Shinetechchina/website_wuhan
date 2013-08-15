Refinery::Core::Engine.routes.append do
  namespace :staffs, :path => '' do
    # get '/staff(/:id)' => 'staffs#index'

    namespace :admin, :path => 'refinery' do
      resources :staffs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end
end
