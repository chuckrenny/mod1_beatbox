require 'pry'
require 'rspec'
require './lib/node'

RSpec.describe Node do
    let(:node)   { Node.new("plop") }
    let(:list)   { LinkedList.new}

    it 'exists as an instance of Node and LinkedList' do
      expect(node).to be_an_instance_of(Node)
      expect(list).to be_an_instance_of(LinkedList)
    end

    it 'can accesss attributes in Node and LinkedList' do
      expect(node.data).to eq ('plop')
      expect(node.next_node).to eq (nil)
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


end