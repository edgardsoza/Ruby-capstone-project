@main_menu_options = [
    { :name => 'List all music albums', :value => 1 },
    { :name => 'List all genres', :value => 2 },
    { :name => 'Add a music album', :value => 3 },
    { :name => 'Quit', :value => 4 }
]

def print_menu(title, main_menu_options)
    puts title
    main_menu_options.each do |option|
        puts "#{option[:value]}) #{option[:name]}"
    end
end


def valid_iput?(input, main_menu_options)
   valid_options = main_menu_options.map { |option| option[:value].to_s }
   valid_options.include?(input)
end

def get_user_input(main_menu_options)
    input = gets.chomp
    while(true)
        break if(valid_iput?(input, main_menu_options))
            puts 'please enter a valid option'
            input = gets.chomp
    end
    input
end

def app
    print_menu('Please select options', @main_menu_options)
    input = get_user_input(@main_menu_options)
    puts input
end

app