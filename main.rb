require_relative './app'

# Main entry point of the program
def start
  app = App.new
  app.run
end

start
