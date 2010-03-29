#---------------------------------------------------------
# Requirements
#---------------------------------------------------------

# all generic stuff required by test helper
require "test/test_helper"



#---------------------------------------------------------
# Class Definitions
#---------------------------------------------------------

class TestView < ActionView::Base
  def dialog_options_to_js_proxy(options)
    dialog_options_to_js(options)
  end
end



#---------------------------------------------------------
# Tests
#---------------------------------------------------------

class KennyDialogginsHelpersTest < ActionView::TestCase
  
  # build a test view object
  def setup
    @view = TestView.new
  end
  
  
  # verify methods were mixed in properly
  def test_composition
    assert @view.respond_to?(:render_dialog,        false)
    assert @view.respond_to?(:show_dialog,          false)
    assert @view.respond_to?(:hide_dialog,          false)
    assert @view.respond_to?(:dialog_options_to_js, true)
  end
  
  
  # verify render returns proper script tag and content
  # (just testing simple text example here)
  def test_render_dialog
    text      = "Who wants to play volleyball on a court with a four-foot net?"
    expected  = "<script type=\"text/javascript\">\n" \
                "//<![CDATA[\n" \
                "KennyDialoggins.Dialog.instances['danger_zone'] = new KennyDialoggins.Dialog('" + text + "', {});\n" \
                "//]]>\n" \
                "</script>"
    actual    = @view.render_dialog(:danger_zone, :text => text)
    
    assert_equal expected, actual
  end
  
  
  # verify show dialog returns proper javascript command.
  def test_show_dialog
    expected  = "KennyDialoggins.Dialog.show('danger_zone')"
    actual    = @view.show_dialog(:danger_zone)
    
    assert_equal expected, actual
  end
  
  
  # verify hide dialog returns proper javascript command.
  def test_hide_dialog
    expected  = "KennyDialoggins.Dialog.hide('danger_zone')"
    actual    = @view.hide_dialog(:danger_zone)
    
    assert_equal expected, actual
  end
  
  
  # verify private function converts ruby hash to javascript hash properly.
  def test_dialog_options_to_js
    options = { 
                :before_show => "function{ alert('hello, world!'); }", 
                :after_show => "function{ alert('goodbye, world!'); }"
              }
    
    expected  = "{beforeShow:#{options[:before_show]},afterShow:#{options[:after_show]}}"
    actual    = @view.dialog_options_to_js_proxy(options)

    assert_equal expected, actual
  end
  
end