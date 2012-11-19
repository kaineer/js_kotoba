# config/initializers/jst_handlebar.rb

require 'tilt'

class HandlebarTemplate < Tilt::Template
  def self.default_mime_type
    "application/javascript"
  end

  def self.engine_initialized?
    true
  end

  def initialize_engine
  end

  def prepare
  end

  def evaluate(scope, locals, &block)
    string = data.gsub("\\", "\\\\").gsub(/^\s+/m, "").gsub($/, "").gsub("\"", "\\\"");

    "Handlebars.compile(\"#{string}\")"
  end
end

JsKotoba::Application.assets.tap { |a|
  a.register_engine ".hbs", HandlebarTemplate
}
