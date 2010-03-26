# external gems
require "action_pack"


# helpers
require File.dirname(__FILE__) + "/kenny_dialoggins/helpers"


# add action view extensions
ActionView::Base.module_eval { include Coroutine::KennyDialoggins::Helpers }