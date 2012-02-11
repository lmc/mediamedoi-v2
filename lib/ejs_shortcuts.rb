module EjsShortcuts
  module String
    def ejsv
      gsub(/\:(\w+)/,'<%= \\1 %>').html_safe
    end
  end

  module Symbol
    def ejsv
      "<%= #{to_s} %>".html_safe
    end
  end
end

String.send :include, EjsShortcuts::String
Symbol.send :include, EjsShortcuts::Symbol
