module Coroutine
  module KennyDialoggins
    module Helpers
      
      # Returns a javascript tag containing the dialog initialization logic. The first argument
      # to this method is the dialog's <tt>id</tt>.  The id is required and should be unique.
      # Further options may be provided; those that are specific to the dialog are:
      #
      # * <tt>:class</tt> - a css class name that will be appended to the outermost div to facilitate multiple styles
      # * <tt>:before_show</tt> - a Javascript function that will be invoked before the dialog is shown
      # * <tt>:after_show</tt> - a Javascript function that will be invoked after the dialog has become visible
      # * <tt>:before_hide</tt> - a Javascript function that will be invoked before the dialog is hidden
      # * <tt>:after_hide</tt> - a Javascript function that will be invoked after the dialog has been hidden
      # * <tt>&block</tt> - HTML markup that will be automatically converted to render's inline option
      #
      # All remaining options are the same as the options available to ActionController::Base#render.  Please
      # see the documentation for ActionController::Base#render for further details.
      # 
      # ==== Example
      # 
      # # Generates: 
      # #
      # # <script type="text/javascript">
      # #   //<![CDATA[
      # #     KennyDialoggins.Dialog.instances['foo_dialog'] = new KennyDialoggins.Dialog('Hello, Foo!', {});
      # #   //]]>
      # # </script>
      # <%= render_dialog :foo_dialog, :partial => "foo" %>
      # 
      # In this case, a partial named "_foo.html.erb"--containing the string, "Hello, Foo!"--
      # is rendered into the dialog.
      # 
      # ==== Example
      # 
      # # Generates:
      # # <script type="text/javascript">
      # #   //<![CDATA[
      # #     KennyDialoggins.Dialog.instances['foo_dialog'] = new KennyDialoggins.Dialog('Hello, Foo!', {beforeShow:function() { alert('bar!') }});
      # #   //]]>
      # # </script>
      # <%= render_dialog :foo_dialog, :partial => "foo", :before_show => "function() { alert('bar!') }" %>
      # 
      # This case is similar to the previous case, except that an alert containing the string, "bar!" will
      # appear before the dialog is shown.
      #
      def render_dialog(id, options = {}, &block)
        options[:inline]    = capture(&block) if block_given?
        render_options      = extract_dialog_render_options(options)
        javascript_options  = dialog_options_to_js(extract_dialog_javascript_options(options))
        
        content = escape_javascript(render(render_options))
        
        raise "You must specify an id to register a dialog."    unless id
        raise "You must provide content to register a dialog."  unless content
        
        javascript_tag "KennyDialoggins.Dialog.instances['#{id.to_s}'] = new KennyDialoggins.Dialog('#{content}', #{javascript_options});"
      end
      
      
      # Returns a string of Javascript that will show the dialog identified by the supplied
      # dialog_id.  As an example of useage, this method might be called as the second argument
      # to ActionView::Helpers::JavaScriptHelper#link_to_function.
      #
      def show_dialog(dialog_id)
        "KennyDialoggins.Dialog.show('#{dialog_id.to_s}')"
      end
      
      
      # Returns a string of Javascript that will hide the dialog identified by the supplied
      # dialog_id.  As an example of useage, this method might be called as the second argument
      # to ActionView::Helpers::JavaScriptHelper#link_to_function.
      #
      def hide_dialog(dialog_id)
        "KennyDialoggins.Dialog.hide('#{dialog_id.to_s}')"
      end
      
      
      
      private
      
      # This method returns an array of javascript option keys supported by the accompanying
      # javascript library.
      #
      def dialog_javascript_option_keys
        [:class, :before_show, :after_show, :before_hide, :after_hide]
      end
      
      
      # This method converts ruby hashes using underscore notation to js strings using camelcase 
      # notation, which is more common in javascript.
      #
      def dialog_options_to_js(options={})
        js_kv_pairs = []
        sorted_keys = options.keys.map { |k| k.to_s }.sort.map { |s| s.to_sym }
          
        sorted_keys.each do |key|
          js_key   = key.to_s.camelcase(:lower)
          js_value = "null" 
          
          options[key] = options[key].to_s unless options[key].respond_to?(:empty?)
          
          unless options[key].empty?
            case key
              when :before_show, :after_show, :before_hide, :after_hide
                js_value = "#{options[key]}" 
              else
                js_value = "'#{options[key]}'" 
            end
          end
          
          js_kv_pairs << "'#{js_key}':#{js_value}"
        end
        
        "{#{js_kv_pairs.join(',')}}"
      end
      
      
      # This method returns a hash with javascript options. It also inspects the supplied options 
      # and adds defaults as necessary.
      #
      def extract_dialog_javascript_options(options)
        options.reject { |k,v| !dialog_javascript_option_keys.include?(k) }
      end
      
      
      # This method returns a hash with rendering options.
      #
      def extract_dialog_render_options(options)
        options.reject { |k,v| dialog_javascript_option_keys.include?(k) }
      end
      
    end
  end
end
