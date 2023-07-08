class Node
    attr_accessor :data, :next_node, :speech_rate, :speaker

    # puts `say -r 200 -v Boing #{input_words}`
    def initialize(data, next_node = nil)
        @data = data
        @next_node = next_node
        @speech_rate  = 200
        @speaker = 'Siri'
    end

end

class LinkedList
    attr_accessor :head
    
    def initialize
      @head = nil
    end
    
    def append(data)
        split_array = data.split(" ")

        # checks if input is valid, if not then remove
        split_array.select! { |element| valid.include?(element) }
    

        # if linked list is empty
        if @head.nil?    
            # create new node with given data and assign it to head                   
            @head = Node.new(data)

        else  #start from the head node
            current = @head

            
            # while the next node isn't 'nil'
            while current.next_node
                # move to the next node
                current = current.next_node 
            end

            split_array.each do |element| 
                  new_node = Node.new(element)
                  current.next_node = new_node
                  current = new_node
            end
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
      
        while current
          return true if current.data == value
          current = current.next_node
        end
      
        false
    end
      
    def pop 
        return nil if @head.nil?
  
        if @head.next_node.nil?
            last_node = @head.data
            @head = nil
            return last_node
        end
        
        current = @head
        
        while current.next_node.next_node
            current = current.next_node
        end
        
        last_node = current.next_node.data
        current.next_node = nil
        last_node

        # current = @head
        # count = 1

        # while count != self.count - 1
        #     current = current.next_node
        #     count += 1
        # end
        # last_node = current.next_node.data
        # current.next_node = nil
        # last_node
    end

    def rate(speed)
        @speech_rate = speed
    end

    def voice(chosen_speaker)
        @speaker = chosen_speaker
    end

    def play
        input_words = self.to_string

        puts `say -r #{@speech_rate} -v #{input_words}`
    end

    private
  
    def valid
        ["doop", "deep", "dop", "woo", "su", "mu", "wu", "hee", 
        "haw", "ding", "no", "mo", "ha", "plop", "tur", "ing",
        "tee", "dee", "bop", "la", "na", "who", "da", "best", 
        "we", "da", "best", "would", "win", "in", "a", "fight",
        "elon", "musk", "or", "our", "lizard", "overlord", "the", 
        "zuck", "er", "berkg", "you", "decide", "hello", "Epic",
        "Rap", "Battles", "of", "History"]
    end
end
    