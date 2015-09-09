@button_two = false
@button_three = false
@button_four = false
@cage_key = false
@bridge_button = false
@key_two = false
@key_three = false
@key_four = false
@key_five = false
@crowbar = false
@gas = false
@emp = false
@rocket = false
@light_bulb = false
@light_on = false

def menu
  puts " 
                                             
                                           _
                                          |*|    
                      ___  _ _   __      /[|]\\      
                       |   |_|  |__     [ \\|/ ]      
                       |   | |  |__       } {
  _______________________________________ ] [ ________                     
    ___    ___     ___    _    _       _    ___    _ _
   |      |   |   |       |    |       |     |     | |
   |___   |___|   |       |    |       |     |     |_|
   |      |   |   |       |    |       |     |      |
   |      |   |   |___    |    |___    |     |      |

   "
  puts " 
      1 > return: START "
  print "> "
  choice = $stdin.gets.chomp
  puts "======================"
  if choice.include?("1") || choice.include?(" ")
    start
  else
    puts "Goodbye!"
  end
end

def start
  puts "
  START
        You are in a room with a door in front of you. "
  while true
    puts "
        1: Open Door
        2: Search Room "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      first_key
      break
    elsif choice.include?("2")
      puts "There's nothing in this room, except the door in front of you."
    else
      puts "Not an option."
    end
  end
end

def first_key
  puts "
  DON'T FORGET TO SEARCH
        This room is similar to the room before. 
        There is a door in front of you. "
  got_key = false
  while true
    puts "    
        1: Open Door
        2: Search Room
        3: Go back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !got_key 
      puts "The door is locked."
    elsif choice.include?("2") && !got_key 
      puts "You found a key with a heart indention on it! You may now open the door."
      got_key = true
    elsif choice.include?("2") && got_key 
      puts "Nothing else of interest in here."
    elsif choice.include?("3") 
      start
      break
    elsif choice.include?("1") && got_key 
      first_button 
      break
    else
      puts "Not an option."
    end
  end
end

def first_button
  puts "
  AND PRESS BUTTONS TOO
        This room has a door in front of you, and a button that says 'push'. "
  
  pushed_button = false
  while true
    puts "
        1: Open door
        2: Search Room
        3: Push Button 
        4: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !pushed_button 
      puts "There are bars blocking the door."
    elsif choice.include?("2") 
      puts "Nothing else in here but the button."
    elsif choice.include?("3") && !pushed_button 
      puts "The gate over the door rises. You may now open the door."
      pushed_button = true
    elsif choice.include?("4") 
      first_key
      break
    elsif choice.include?("1") && pushed_button 
      two_door
      break
    elsif choice.include?("3") && pushed_button 
      puts "This button has already been pressed."
    else
      puts "Not an option."
    end
  end
end

def two_door
  puts "
  RIVER ROOM
  This room has two doors, one on the west side and one on the east. "
  while true
    puts "
        1: Open West Door
        2: Open East Door
        3: Search Room 
        4: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !@button_two 
      puts "There are bars blocking this door as well."
    elsif choice.include?("2") 
      second_button
      break
    elsif choice.include?("3") && !@bridge_button 
      puts "There is a side-rail overlooking a river straight ahead.
      Looking down stream to the west, you can see a bridge up.
      Nothing too special on the east side. "
    elsif choice.include?("4") 
      first_button
      break
    elsif choice.include?("1") && @button_two && !@bridge_button
      bridge_room
      break
    elsif choice.include?("3") && @bridge_button 
      puts "Looking west down the river, you see that the bridge is now down for you to cross."
    elsif choice.include?("1") && @button_two && @bridge_button
      bridge_room_two
      break
    else
      puts "Not an option."
    end
  end 
end

def second_button
  puts "
  RIVER ROOM EAST
  There is a door to the east, and the door you came from to the west."
  while true
    puts "
        1: Open East Door
        2: Search Room
        3: Go Back"
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !@bridge_button 
      guard_one
      break
    elsif choice.include?("2") && !@button_two
      puts "There is a button on the wall.
          
        0: Push Button"
    elsif choice.include?("3") 
      two_door
      break
    elsif choice.include?("0") 
      puts "You hear a metallic clanging noise coming from the previous room."
      @button_two = true
    elsif choice.include?("1") && @bridge_button 
      guard_one_two
      break
    elsif choice.include?("2") && @button_two
      puts "You have already pressed the button on the wall."
    else
      puts "Not an option."
    end
  end
end

def guard_one
  puts "
  RIVER GUARD
  There is a guard sleeping in a chair. No doors aside from where you came."
  while true
    puts "
        1: Search Room
        2: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") 
      puts "There is another side-rail overlooking the same river.
      There is a button on the side-rail."
      puts "
          0: Press Side-Rail Button"
    elsif choice.include?("2") 
      second_button
      break
    elsif choice.include?("0") 
      puts "Great noises start to happen. Sirens and flashing yellow lights.
      The guard starts to wake up as you flee to the previous room."
      puts "======================"
      @bridge_button = true
      second_button
      break
    else
      puts "Not an option."
    end
  end
end

def bridge_room
  puts "
  BRIDGE
  There is a bridge that you can not cross at this time."
  while true
    puts "
        1: Search Room
        2: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") 
      puts "There is a door on the other side of the bridge."
    elsif choice.include?("2") 
      two_door
      break
    else
      puts "Not an option."
    end
  end
end

def guard_one_two
  puts "
  RIVER GUARD
  The guard who was previously napping looks quite angry with you for waking him up."
  guard_asleep = false
  while true
    if !@gas
      puts "
          1: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1") 
        second_button
        break
      else
        puts "Not an option"
      end
    end
    if @gas
      puts "
          1: Gas guard
          2: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1") && !guard_asleep
        puts "The guard dozes off to sleep with a smile on his face.
        You notice the guard has a key with a diamond emblem indention.
        You take the key."
        guard_asleep = true
        @key_two = true
      elsif choice.include?("2") 
        second_button
        break
      elsif choice.include?("1") && guard_asleep 
        puts "He's already unconcious."
      else
        puts "Not an option."
      end
    end
  end
end

def bridge_room_two
  puts "
  BRIDGE
  The bridge is down! You may cross."
  while true
    puts "
        1: Open Door(across bridge)
        2: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") 
      gas_room
      break
    elsif choice.include?("2") 
      two_door
      break
    else
      puts "Not an option."
    end
  end
end

def gas_room
  puts "
  NERVE GAS WORKS
  To no one's great surprise, there is another door to the east!"
  while true
    puts "
        1: Open Door
        2: Search Room
        3: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") 
      cage_room
      break
    elsif choice.include?("2") 
      puts "You find spritzer bottles that say 'sleep' on the side of them.
      You pick one up."
      @gas = true
    elsif choice.include?("3") 
      bridge_room_two
      break
    else
      puts "Not an option."
    end
  end
end

def cage_room
  puts "
  UTILITIES
  Oh look, another door, and a small metal cage."
  while true
    puts "
        1: Open Door
        2: Open Cage
        3: Search Room
        4: Go Back"
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !@key_two 
      puts "The door is locked. The lock has a diamond emblem above it."
    elsif choice.include?("2") && !@cage_key 
      puts "The cage is sealed shut. There is no way to open it from here."
    elsif choice.include?("3") 
      puts "Nothing of interest other than the cage."
    elsif choice.include?("4") 
      gas_room
      break
    elsif choice.include?("1") && @key_two && !@light_on
      light_room
      break
    elsif choice.include?("2") && @cage_key 
      puts "You found a crowbar and a light bulb."
      @crowbar = true
      @light_bulb = true
    elsif choice.include?("1") && @key_two && @light_on
      number_room
      break
    else
      puts "Not an option."
    end
  end
end

def light_room
  if @light_on
    number_room
  end
  if !@light_bulb
    puts "
    ROBOTICS TRANSIT
    The light in this room is out.
    A door to the east is open, lighting the room slightly."
    while true
      puts "
          1: Enter East Room
          2: Search Room
          3: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        dog_room
        break
      elsif choice.include?("2")
        puts "It's too dark to search the room."
      elsif choice.include?("3")
        cage_room
        break
      else
        puts "Not an option."
      end
    end
  end
  if @light_bulb
    puts "
    ROBOTICS TRANSIT
    The light fixture is in view. You can reach it to replace the bulb."
    while true
      puts "
          1: Replace Light Bulb
          2: Enter East Room
          3: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        puts "The light in the room shines all around. You may now search."
        @light_on = true
        number_room
        break
      elsif choice.include?("2")
        dog_room
        break
      elsif choice.include?("3")
        cage_room
        break
      else
        puts "Not an option."
      end
    end
  end   
end

def number_room
  puts "
  ROBOTICS TRANSIT
  With the light now on, there is another door straight ahead."
  while true
    puts "
        1: Open Door
        2: Search Room
        3: Enter East Room
        4: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !@key_three
      puts "The door is locked with a 'club' suit emblem above it."
    elsif choice.include?("2") 
      puts "There are three numbers recently written in white paint on the wall: 3-9-2"
    elsif choice.include?("3")
      dog_room_two
      break
    elsif choice.include?("4")
      cage_room
      break
    elsif choice.include?("1") && @key_three
      final_door_room
      break
    else
      puts "Not an option."
    end
  end
end

def dog_room
  puts "
  WATCHDOG ROOM
  There is a door to the east.
  There is also a little weiner dog...
  You don't know why, but there is.
  On the wall next to him(or her) is a small silver key."
  dog_asleep = false
  while true
    puts "
        1: Open East Door
        2: Take Key
        3: Pet Dog
        4: Search Room
        5: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1") && !dog_asleep
      puts "The dog shows terrifying teeth and bites at your feet."
      puts "
          0: Gas The Dog! "
    elsif choice.include?("2") && !dog_asleep
      puts "The dog shows terrifying teeth and bites at your hand."
      puts "
          0: Gas The Dog! "
    elsif choice.include?("3") && !dog_asleep
      puts "The dog shows terrifying teeth and bites at your hand."
      puts "
          0: Gas The Dog! "
    elsif choice.include?("4") && !dog_asleep
      puts "The dog shows terrifying teeth and bites at your feet."
      puts "
          0: Gas The Dog!"
    elsif choice.include?("5") && !@light_on
      light_room
      break
    elsif choice.include?("0")
      puts "With one quick, short spritz, the dog goes down and falls asleep."
      dog_asleep = true
    elsif choice.include?("1") && dog_asleep
      guard_two
      break
    elsif choice.include?("2") && dog_asleep
      puts "The key says, 'Utilities Locker' on one side and 'cage' in pen on the other."
      @cage_key = true
      dog_room_two
      break
    elsif choice.include?("3")
      puts "Best to let the sleeping dog lie...teeheehee..."
    elsif choice.include?("4")
      puts "Nothing of interest."
    elsif choice.include?("5") && @light_on
      number_room
      break
    else
      puts "Not an option."
    end
  end
end

def dog_room_two
  puts "
  WATCHDOG ROOM
  The dog is still unconcious."
  while true
    puts "
        1: Open East Door
        2: Pet Dog
        3: Search Room
        4: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      guard_two
      break
    elsif choice.include?("2")
      puts "Best to let the sleeping dog lie...teeheehee..."
    elsif choice.include?("3")
      puts "Nothing of interest."
    elsif choice.include?("4") && !@light_on
      light_room
      break
    elsif choice.include?("4") && @light_on
      number_room
      break
    else
      puts "Not an Option."
    end
  end
end

def guard_two
  puts "
  TRANSIT GUARD
  Gasp! Another guard! This one has a gas mask on! What are you going to do???"
  guard_ko = false
  while true
    if !@crowbar && !guard_ko
      puts "
        1: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        dog_room_two
        break
      else
        puts "Not an option."
      end
    end
    if @crowbar && !guard_ko
      puts "
      1: Crowbar of JUSTICE!!!
      2: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        puts "With a slightly mighty swing of your crowbar, the guard is out like a light.
        He has a key with a 'club' suit indention on it.
        You take the key."
        guard_ko = true
        @key_three = true
      elsif choice.include?("2")
        dog_room_two
        break
      else
        puts "Not an Option."
      end
    end
    if @crowbar && guard_ko
      puts "The guard is still knocked out."
      puts "
          1: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1") 
        dog_room_two
        break
      end
    end
  end
end

def final_door_room
  puts "
  ROBOTICS DIVISION
  There are three doors to the west, north, and east.
  The north door has a picture of a spade on it."
  while true
    puts "
        1: Open West Door
        2: Open Spade Door
        3: Open East Door
        4: Search Room
        5: Go Back "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      keypad_room
      break
    elsif choice.include?("2") && !@key_five && !@rocket
      puts "The door is locked...with a really impressive looking lock might I add."
    elsif choice.include?("3")
      crate_room
      break
    elsif choice.include?("4")
      puts "There's a sign by the north door that says, 'Robotics Division'.
      Other than that, nothing very interesting."
    elsif choice.include?("5")
      number_room
      break
    elsif choice.include?("2") && @key_five && !@rocket
      puts "You should probably open the barrel first."
    elsif choice.include?("2") && @key_five && @rocket
      boss_room_one
      break
    else
      puts "Not an option."
    end
  end
end

def keypad_room
  keypad_open = false
  puts "
  ADVANCED WARFARE RESEARCH
  There is a door to the south for once, and a futuristic looking box.
  The box requires a combination to open."
  while true
    if !keypad_open
      puts "
          1: Open South Door
          2: Enter Keypad Number
          3: Search Room
          4: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1") && !@key_four && !@button_three
        puts "Bars on this door. No entry right now."
      elsif choice.include?("2")
        puts "Enter three numbers."
        print "> "
        choice = $stdin.gets.chomp
        if choice.include?("392")
          puts "The box is opened! 
          There's a strange looking device inside that says 'EMP'.
          You take it."
          @emp = true
          keypad_open = true
        else
          puts "Wrong combination."
        end
      elsif choice.include?("3")  
        puts "You realize this place's scenery is getting a lot less interesting."
      elsif choice.include?("4")
        final_door_room
        break
      elsif choice.include?("1") && !@key_four && @button_three
        puts "The bars are gone, but the door is still locked."
      elsif choice.include?("1") && @key_four && @button_three
        robot_room
        break
      else
        puts "Not an option."
      end
    end
    if keypad_open
  
      puts "
          1: Open South Door
          2: Search Room
          3: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1") && !@key_four && !@button_three
        puts "Bars on this door. No entry right now."
      elsif choice.include?("2")
        puts "You realize this place's scenery is getting a lot less interesting."
      elsif choice.include?("3")
        final_door_room
        break
      elsif choice.include?("1") && !@key_four && @button_three
        puts "The bars are gone, but the door is still locked."
      elsif choice.include?("1") && @key_four && @button_three
        robot_room
        break
      else
        puts "Not an option."
      end
    end
  end  
end

def crate_room
  crate_moved = false
  puts "
  METAL STORAGE
  There is a door to the north and a large metal box with no forseeable way to open it."
  if !crate_moved
    while true
      puts "
          1: Open North Door
          2: Search Room
          3: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        barrel_room
        break
      elsif choice.include?("2")
        puts "As you look around, you see that there is a screen showing a door with bars on it.
        You also see a button behind the crate.
        You also notice, the crate has wheels."
        puts "
            0: Move Crate "
        elsif choice.include?("3")
          final_door_room
          break
        elsif choice.include?("0")
          puts "On the screen, you see the bars being removed from the door."
          crate_moved = true
          @button_three = true
        else
          puts "Not an option."
      end
    end
  end
  if crate_moved
    while true
      puts "
          1: Open North Door
          2: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        barrel_room
        break
      elsif choice.include?("2")
        final_door_room
      else
        puts "Not an option."
      end
    end
  end
end

def barrel_room
  if !@button_four
    puts "
    THE VAULT
    There is a barrel inside of a circular cage."
    while true
      puts "
        1: Open Cage
        2: Search Room
        3: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        puts "Impossible to open."
      elsif choice.include?("2")
        puts "You found a key on the wall."
        @key_four = true
      elsif choice.include?("3")
        crate_room
        break
      else
        puts "Not an option."
      end
    end
  end
  if @button_four
    puts "The circular cage is gone."
    while true
      puts "
          1: Open Barrel(Crowbar)
          2: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        puts "You found a very awesome looking weapon."
        @rocket = true
      elsif choice.include?("2")
        crate_room
        break
      else
        puts "Not an option."
      end      
    end    
  end
end

def robot_room
  robot_down = false
  if !@emp && !robot_down
    puts "
    ROBO-GUARD
    In this room, there is a robot ready to put you down if you take a step forward."
    while true
      puts "
          1: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        keypad_room
        break
      else
        puts "Not an option."
      end
    end
  end
  if @emp && !robot_down
    while true
      puts "
      ROBO-GUARD
      In this room, there is a robot ready to put you down if you take a step forward."
      puts "
          1: Fire EMP
          2: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================"
      if choice.include?("1")
        puts "The robot fizzles and shuts down, dropping a large key with a spade indention."
        robot_down = true
        @key_five = true
        robot_room_two
        break
      elsif choice.include?("2")
        keypad_room 
        break
      else
        puts "Not an option."
      end
    end
  end
end

def robot_room_two
    puts "With the robot down, you may now search the room.
    There is a button on the wall with a screen showing the barrel room from earlier."
    while true
      puts "
          1: Press Button
          2: Search room 
          3: Go Back "
      print "> "
      choice = $stdin.gets.chomp
      puts "======================" 
      if choice.include?("1")
        puts " The bars around the barrel are gone."
        @button_four = true
      elsif choice.include?("2")
        puts "Nothing but the remains of a robot."
      elsif choice.include?("3")
        keypad_room
        break
      else
        puts "Not an option."
      end
    end
  end

def boss_room_one
  puts "
  SUPER ROBOTICS DIVISION
  There is a giant robot! 
  It's red eyes are on you, and it sees you as an intruder!
  Don't just stand there! Hit it with something!"
  while true
    puts "
        1: Use Sleeper Gas!
        2: Use Crowbar!
        3: Use EMP!
        4: Use Awesome Weapon! "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      puts "NO EFFECT!"
    elsif choice.include?("2")
      puts "NO EFFECT!"
    elsif choice.include?("3")
      boss_room_two 
      break
    elsif choice.include?("4")
      puts "NO EFFECT!"
    else
      puts "NOT AN OPTION!"
    end
  end
end
def boss_room_two
  puts "The robot is slightly frazzled but manages to fry your EMP.
  Luckily his targeting system is messed up for you to get in close."
  while true
    puts "
        1: Use Sleeper Gas!
        2: Use Crowbar!
        3: Use Awesome Weapon! "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      puts "NO EFFECT!"
    elsif choice.include?("2")
      boss_room_three
      break
    elsif choice.include?("3")
      puts "NO EFFECT!"
    else
      puts "NOT AN OPTION!"
    end
  end
end

def boss_room_three
  puts "You've managed to expose the heart of the robot by pulling off the plating with your crowbar!
  In doing so, you have broken your crowbar!
  There is a force-field around the heart!"
  while true
    puts "
        1: Use Sleeper Gas!
        2: Use Awesome Weapon! 
        3: CRY! "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      boss_room_four
      break
    elsif choice.include?("2")
      puts "NO EFFECT!"
    elsif choice.include?("3")
      puts "Stop crying! You're in a danger zone!!!"
    else
      puts "NOT AN OPTION!"
    end
  end
end

def boss_room_four
  puts "By turning the nozzle of the spritzer bottle, 
  you have managed to turn the misty gas into a stream of liquid nerve juice!
  Interesting idea!
  Using all of the liquid in the bottle has disrupted the shield,
  creating a small opening to strike at the heart!
  Think fast!"
  while true
    puts "
        1: Cry Some More!
        2: Panic!
        3: Rest A Bit!
        4: Use Awesome Weapon! "
    print "> "
    choice = $stdin.gets.chomp
    puts "======================"
    if choice.include?("1")
      puts "NO!"
    elsif choice.include?("2")
      puts "WHAT'S THAT GONNA DO?!"
    elsif choice.include?("3")
      puts "THERE'S NO TIME TO WASTE! SEIZE THE DAY!"
    elsif choice.include?("4")
      conclusion
      break
    else
      puts "NOT AN OPTION!"
    end
  end
end

def conclusion
  puts "
  OUTSIDE
  Having fired on the enemy with the AWESOME weapon, 
  the shockwave of the impact hurls the robotic behemoth into a giant door.
  The collision with said door causes a massive explosion, opening the door with great force!
  The fresh air from the outside world fills your lungs as you walk toward the opening.
  Freedom is yours at last!"
  puts "THANK YOU FOR PLAYING!!!"
  exit(0)
end

menu