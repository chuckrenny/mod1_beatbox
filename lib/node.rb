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


    