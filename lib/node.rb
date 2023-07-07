class Node
    attr_accessor :data, :next_node

    def initialize(data)
        @data = data
        @next_node = nil
    end

end

class LinkedList
    attr_accessor :head
    
    def initialize
      @head = nil
    end
    
    def append(data)
        new_node = Node.new(data)
    
        if @head.nil?
            @head = new_node
        else
            current = @head
            current = current.next_node while current.next_node
            current.next_node = new_node
        end
    end
    
end
    