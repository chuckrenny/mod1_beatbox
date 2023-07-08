class Node
    attr_accessor :data, :next_node

    def initialize(data, next_node = nil)
        @data = data
        @next_node = next_node
    end

end

class LinkedList
    attr_accessor :head
    
    def initialize
      @head = nil
    end
    
    def append(data)
        # if linked list is empty
        if @head.nil?    
            # create new node with given data and assign it to head                   
            @head = Node.new(data)

        else #start from the head node
            current = @head

            # while the next node isn't 'nil'
            while current.next_node
                # move to the next node
                current = current.next_node 
            end

            # if reached end of list (current.next_node is nil),
            # create a new node with the given data and make it the next_node of the current node
            current.next_node = Node.new(data)
        end
    end

    def count
        # start from the head node
        current = @head
        count = 0

        # if current isn't nil, increment count
        while current
            count += 1

            # updates current to the next node
            current = current.next_node
        end
        count
    end

    def to_string
        string = ''

        current = @head

        # iterate thru the linked list
        while current
            # add node data to string
            string = string + current.data + ' '
        
            # update current
            current = current.next_node
        end

        string.chop!
    end

    def prepend(data)
        # if linked list is empty
        if @head.nil?    
            # create new node with given data and assign it to head                   
            @head = Node.new(data)

        else #start from the head node
            old_head = @head
            @head = Node.new(data)
            @head.next_node = old_head
        end
    end

    def insert(index, data)
        if index == 0
            # Insert at the beginning of the list
            new_node = Node.new(data)
            new_node.next_node = @head
            @head = new_node
        else
            count = 0
            current = @head

            # current will be ahead of the new node inserted
            while count != index - 1
                # move to the next node
                current = current.next_node 
                count += 1
            end

            # create node
            new_node = Node.new(data)
            # point to the currents previous node
            new_node.next_node = current.next_node
            # currents next node will point at new node
            current.next_node = new_node
        end
    end

    def find(index, quantity)
        current = @head
        count = 0

        while count != index
            current = current.next_node
            count += 1
        end
        output = ''
        count = 0

        while count != quantity
            output = output + current.data + " "
            current = current.next_node
            count += 1
        end
        # remove any whitespace characters at end of string
        output.rstrip
    end

    def includes?(value)
        current = @head
        in_list = false

        # traverse the linkedlist while current != nil
        while current
            if current.data == value
                in_list = true
                break
            end
            current = current.next_node
        end
        in_list
    end
end
    