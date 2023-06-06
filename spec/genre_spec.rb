require_relative '../genre'

describe Genre do
 genre = Genre.new("Rock", 1)
 context "when initialized" do
    it "should have a name" do
     expect(genre.name).to eq("Rock")
    end
    it "should have an id" do
     expect(genre.id).to eq(1)
    end
    it "should have an empty array of items" do
     expect(genre.items).to eq([])
    end
    genre.add_item("item")
    it "should add an item to the items array" do
        expect(genre.items).to eq(["item"])
        end
    end    
end