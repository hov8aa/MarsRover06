class Move
    DIRECTIONS = ['N','E','S','W'] #Clockwise directions

    def initialize(x, y, direction)
        @x = x
        @y = y
        if DIRECTIONS.include?(direction)
          @direction = direction
        else
          raise ArgumentError, "Invalid direction: #{direction}. Must be one of #{DIRECTIONS.join(', ')}"
        end
    end
    
    def run_commands(commands)
        commands.each_char do |command|
            case command
                when 'L'
                    turn_left
                when 'R'
                    turn_right
                when 'M'
                    move
                end
            end
    end
  
    def turn_left
        current_index = DIRECTIONS.index(@direction)
        @direction = DIRECTIONS[(current_index - 1) % 4]
    end

    def turn_right
        current_index = DIRECTIONS.index(@direction)
        @direction = DIRECTIONS[(current_index + 1) % 4]
    end

    def move
        case @direction
        when 'N'
            @y += 1
        when 'S'
            @y -= 1
        when 'E'
            @x += 1
        when 'W'
            @x -= 1
        end
    end

    def position
        [@x, @y, @direction]
    end

    def display_position
        puts "#{@x} #{@y} #{@direction}"
        puts "thanks for playing again. :)"
    end
end

# Move the user input functionality to a separate method
def get_user_input
    # Get the upper-right plateau coordinates (we are not using them in this example)
    puts "Enter the upper-right coordinates of the plateau (e.g., 5 5)"
    plateau_size = gets.chomp

    # Get initial rover position
    puts "Enter the rover's initial position and direction (e.g., 1 2 N)"
    initial_position = gets.chomp.split

    x = initial_position[0].to_i
    y = initial_position[1].to_i
    direction = initial_position[2]

    # Create a Move instance
    move = Move.new(x, y, direction)

    # Get the movement instructions
    puts "Enter the movement instructions (e.g., LMLMLMLMM)"
    commands = gets.chomp

    # Run the commands
    move.run_commands(commands)

    # Display final position and direction
    move.display_position
end

# Only call get_user_input when the script is run directly, not when required/loaded
if __FILE__ == $0
    get_user_input
end