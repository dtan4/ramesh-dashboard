Rails.application.routes.draw do
  get 'images/list' => 'ramesh_images#list', as: 'list_image'
  get 'images/:image_datetime' => 'ramesh_images#show', as: 'show_image'

  root to: "welcome#index"
end
