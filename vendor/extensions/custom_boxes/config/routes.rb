Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :custom_boxes do
    resources :custom_boxes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :custom_boxes, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :custom_boxes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
