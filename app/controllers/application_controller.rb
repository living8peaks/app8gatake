class ApplicationController < ActionController::Base
  def hello
    render html: 'hello, 8gatake farm!!'
  end
end
