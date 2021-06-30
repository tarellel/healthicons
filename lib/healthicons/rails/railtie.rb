# frozen_string_literal: true

require 'rails/railtie'

module Healthicons
  module Rails
    class Railtie < ::Rails::Railtie
      # @note
      #   https://api.rubyonrails.org/classes/ActiveSupport/LazyLoadHooks.html
      #   https://simonecarletti.com/blog/2011/04/understanding-ruby-and-rails-lazy-load-hooks/
      initializer 'healthicons.view_helpers' do
        ActiveSupport.on_load(:action_view) do
          include ViewHelpers
        end
      end
    end
  end
end
