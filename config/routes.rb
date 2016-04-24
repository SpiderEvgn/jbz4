Rails.application.routes.draw do


  namespace :wechat do

    get 'boards/jbz_hotfilm'  # 最外层左下角“热映”界面，显示所有最近三天热映影片列表
    get 'boards/jbz_cinema'   # 最外层中底部“影院”界面，显示所有影院

    namespace :maizuo do
      get 'cinemas/index'
      get 'films/index'
      get 'cinematickets/index'
      get 'foretells/index'
      get 'hallseats/index'
      get 'reviews/index'
    end

    namespace :jbzlocal do
      resources :hotfilms, only: [:show]   # 显示单部电影的详细信息
      resources :cinemas, only: [:index, :show]  # 显示所有影院，列出某院在映影片列表
      resources :foretellfilms, only: [:show]  # 电影 －》 影片 －》 排期
      resources :foretellcinemas, only: [:show]  # 影片 －》 电影 －》 排期
    end

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'wechat/boards#jbz_hotfilm'  # 热映影片列表

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
