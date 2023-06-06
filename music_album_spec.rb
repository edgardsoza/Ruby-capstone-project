require_relative '../music_album'

describe MusicAlbum do
    music = MusicAlbum.new(true, "The Wall", 1979, 1)
    context "when initialized" do
        it "should have a name" do
            expect(music.name).to eq("The Wall")
        end
        it "should have a publish date" do
            expect(music.publish_date).to eq(1979)
        end
        it "should have an id" do
            expect(music.id).to eq(1)
        end
        it "should have a genre" do
            expect(music.genre).to eq(nil)
        end
        it "should be on spotify" do
            expect(music.on_spotify).to eq(true)
        end

        music.add_genre(1, [Genre.new("Rock", 1)])
        it "should add a genre" do
            expect(music.genre.name).to eq("Rock")
        end

        music.can_be_archived?
        it "should be archived" do
            expect(music.archived).to eq(true)
        end

    end