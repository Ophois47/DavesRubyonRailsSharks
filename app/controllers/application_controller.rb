class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: 'David', password: 'sharks', except: [:index, :show]
end
