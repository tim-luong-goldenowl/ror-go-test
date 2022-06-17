require_relative './resolver'

RSpec.describe "find_desired_pairs method", :type => :request do
    let(:input_1) { ('8,5,3,4,5') }
    let(:input_2) { ('9,5,3,4,5') }
    describe "with input 1" do
        it "check find_desired_pairs to return correct data length (3) with input 1" do
            result = Resolver.send(:find_desired_pairs, input_1)
            expect(result.length).to   eq(3)
        end

        it "check find_desired_pairs to return correct data value" do
            result = Resolver.send(:find_desired_pairs, input_1)
            expect(result[0]).to   eq([5,3])
            expect(result[1]).to   eq([3,5])
            expect(result[2]).to   eq([4,4])
        end
    end
    
    describe "with input 2" do
        it "check find_desired_pairs to return correct data length (1) with input 1" do
            result = Resolver.send(:find_desired_pairs, input_2)
            expect(result.length).to   eq(1)
        end

        it "check find_desired_pairs to return correct data value" do
            result = Resolver.send(:find_desired_pairs, input_2)
            expect(result[0]).to   eq([5,4])
        end
    end
  end
  