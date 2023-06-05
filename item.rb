class Item
 attr_accessor :id, :archived
 
    def initialize(genre, author, source, label, publish_date)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
    end

    def can_be_archived?
        @publish_date > 10.years.ago         
    end

     def move_to_archive
      self.can_be_archived? ? @archived = true : @archived = false
    end
end