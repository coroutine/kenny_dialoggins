module Coroutine
  module KennyDialoggins
    module Helpers
      
      # Returns a javascript tag containing the dialog initialization logic. The first argument
      # to this method is the dialog's <tt>id</tt>.  The id is required and should be unique.
      # Further options may be provided; those that are specific to the dialog are:
      #
      # * <tt>:before_show</tt> - a Javascript function that will be invoked before the dialog is shown
      # * <tt>:after_show</tt> - a Javascript function that will be invoked after the dialog has become visible
      # * <tt>:before_hide</tt> - a Javascript function that will be invoked before the dialog is hidden
      # * <tt>:after_hide</tt> - a Javascript function that will be invoked after the dialog has been hidden
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
      # appear before the dialog is shown
      def render_dialog(id, options={})
        dialog_options  = [:before_show, :after_show, :before_hide, :after_hide].inject({}) do |result, key|
          result[key]   = options.delete(key) if options[key]
          result
        end

        content = escape_javascript render(options)
        javascript_tag "KennyDialoggins.Dialog.instances['#{id.to_s}'] = new KennyDialoggins.Dialog('#{content}', #{dialog_options_to_js dialog_options});"
      end
      
      # Returns a string of Javascript that will show the dialog identified by the supplied
      # dialog_id.  As an example of useage, this method might be called as the second argument
      # to ActionView::Helpers::JavaScriptHelper#link_to_function.
      def show_dialog(dialog_id)
        "KennyDialoggins.Dialog.show('#{dialog_id.to_s}')"
      end
      
      # Returns a string of Javascript that will hide the dialog identified by the supplied
      # dialog_id.  As an example of useage, this method might be called as the second argument
      # to ActionView::Helpers::JavaScriptHelper#link_to_function.
      def hide_dialog(dialog_id)
        "KennyDialoggins.Dialog.hide('#{dialog_id.to_s}')"
      end
      
      private

      def dialog_options_to_js(options={})
        js_kv_pairs = []
        options.each do |key, value|
          js_kv_pairs << "#{key.to_s.camelize(:lower)}:#{value || 'null'}"
        end
        "{#{js_kv_pairs.join(',')}}"
      end
      
    end
  end
end
