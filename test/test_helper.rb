#----------------------------------------------------------
# Requirements
#----------------------------------------------------------

# rails stuff
require "rubygems"
require "active_support"
require "active_support/test_case"
require "action_controller"
require "action_controller/test_case"
require "action_view"
require "action_view/test_case"
require "test/unit"

# the plugin itself
require "#{File.dirname(__FILE__)}/../init"