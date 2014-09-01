Rails.application.routes.draw do
  get 'images/:image_datetime' => 'ramesh_images#show', as: 'show_image'

  root to: "welcome#index"
end
