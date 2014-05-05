Cyclone::Application.routes.draw do

  # кастомные урлы на страницы
  get 'facilities' => 'pages#show', id: 'facilities/index'

  # автоматические правила урлов
  get '/*id' => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'

end
