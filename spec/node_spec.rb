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
    end

    it 'can count the number of nodes on the list' do
      list.append("doop")
      expect(list.count).to eq(1)
    end
end