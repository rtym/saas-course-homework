class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    
    attr_reader attr_name
    
    attr_reader attr_name + "_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(#{attr_name})
        @#{attr_name}_history = [nil] if @#{attr_name}_history.nil?
        @#{attr_name}_history += [#{attr_name}]
      end
    }
  end
end

class Foo
  attr_accessor_with_history :bar
end