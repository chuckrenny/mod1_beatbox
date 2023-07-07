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

    
end