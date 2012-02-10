class String
  def ejsv
    "<%= #{self} %>".html_safe
  end
end

class Symbol
  def ejsv
    "<%= #{self} %>".html_safe
  end
end