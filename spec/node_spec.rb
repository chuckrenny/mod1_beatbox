require 'pry'
require 'rspec'
require './lib/node'
require './lib/linkedlist'

RSpec.describe Node do
    let(:node)   { Node.new("plop") }
    let(:list)   { LinkedList.new}

    it 'exists as an instance of Node' do
      expect(node).to be_an_instance_of(Node)
    end

    it 'can accesss attributes in Node' do
      expect(node.data).to eq ('plop')
      expect(node.next_node).to eq (nil)
    end

end