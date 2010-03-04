require "kenny_dialoggins"

ActionView::Base.module_eval { include Coroutine::KennyDialoggins::Helpers }