# frozen_string_literal: true

require 'sassc-rails'

module TwbsSassRails
  class Engine < ::Rails::Engine
    initializer 'TwbsSassRails precompile hook', group: :all do |app|
      app.config.assets.precompile += %w[respond.js]
    end
  end
end
