require 'pry'
require 'rspec'
require './lib/node'
require './lib/linkedlist'

RSpec.describe LinkedList do
    let(:list)   { LinkedList.new}

    it 'exists as an instance of LinkedList' do
      expect(list).to be_an_instance_of(LinkedList)
    end

    it 'can accesss attributes in LinkedList' do
      expect(list.head).to eq(nil)
    end

    it 'can append elements to the list' do
      list.append("doop")
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to eq(nil)

      list.append('deep')
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node.data).to eq('deep')
    end

    it 'can count the number of nodes on the list' do
        list.append("doop")
        expect(list.head.data).to eq("doop")
        expect(list.head.next_node).to eq(nil)
  
        list.append('deep')
        expect(list.head.data).to eq("doop")
        expect(list.head.next_node.data).to eq('deep')

        expect(list.count).to eq(2)
    end

    it 'can generate a string of all elements in the list' do
        list.append("doop")
        expect(list.head.data).to eq("doop")
        expect(list.head.next_node).to eq(nil)
  
        list.append('deep')
        expect(list.head.data).to eq("doop")
        expect(list.head.next_node.data).to eq('deep')

        expect(list.to_string).to eq("doop deep")
    end

    it 'can add nodes to the beginning of the list' do
        list.append("doop")
        list.append("deep")
        list.prepend("dop")

        expect(list.head.data).to eq("dop")
        expect(list.head.next_node.data).to eq("doop")
    end

    it 'can inset nodes to the list' do 
        list.append("doop")
        list.append("deep")
        list.prepend("dop")
        list.insert(1, 'woo')

        expect(list.to_string).to eq("dop woo doop deep")

        list.insert(2, 'beep')
        expect(list.to_string).to eq("dop woo beep doop deep")
    end

    it 'can find a node index and subsequently return quantity of data' do
        list.append("doop")
        list.append("deep")
        list.prepend("dop")
        list.insert(1, 'woo')

        expect(list.find(2, 1)).to eq("doop")

        expect(list.find(1, 3)).to eq("woo doop deep")
    end

    it 'can find a node value if it exists in list' do
        list.append("doop")
        list.append("deep")
        list.prepend("dop")
        list.insert(1, 'woo')

        expect(list.includes?("meow")).to eq(false)
        expect(list.includes?("woo")).to eq(true)
    end

    it 'can remove the last node in the list and return the data' do
        list.append("doop")
        list.append("deep")
        list.prepend("dop")
        list.insert(1, 'woo')

        expect(list.to_string).to eq("dop woo doop deep")

        expect(list.pop).to eq("deep")
        expect(list.to_string).to eq("dop woo doop")
    end

    it 'can append multiple nodes in the list' do
        list.append("doop")
        list.append("deep")
        list.prepend("dop")
        list.insert(1, 'woo')

        expect(list.to_string).to eq("dop woo doop deep")

        list.append("su wu mu")
        expect(list.to_string).to eq("dop woo doop deep su wu mu")
    end

    it 'can play our linkedlist' do
        list.append("who would win in a fight elon musk or our lizard")
        list.append("overlord the zuck er berkg you decide")
        list.play

        18.times{ list.pop }
     
        list.append("Epic Rap Battles of History")
        list.play
    end

    it 'can only add words on the approved list' do
        list.append("doop")
        list.append("deep")
        list.prepend("dop")
        list.insert(1, 'woo')
        list.append("su wu mu Mississippi")

        expect(list.to_string).to eq("dop woo doop deep su wu mu")
    end

    it 'can change the speed rate of the voice' do
        list.append("Epic Rap Battles of History")
        # list.play

        # only works if theres a char behind -v line 195
        list.rate(50)
        # list.play
    end
end