Shoes.setup do
  gem "httparty"
end

require "httparty"
require 'json'

Shoes.app :height => 730, :width => 1296 do

  require '../shared/player'

  @player = Player.new
  
  @player.y_pos = 320

  @board = []

  720.times { @board << "static/sand_1.gif" } 

  (0..35).each {|i| @board[i] = "static/wall_t_1.gif"}
  (0..20).each {|i| @board[i * 36 - 1 ] = "static/wall_r_1.gif"}
  (0..19).each {|i| @board[i * 36] = "static/wall_l_1.gif"}
  (2..37).each {|i| @board[i * 18] = "static/wall_l_1.gif"}
  (0..34).each {|i| @board[i + 684] = "static/wall_t_1.gif"}
  (0..1).each  {|i| @board[324 + i * 36] = "static/sand_1.gif"}
  (0..1).each  {|i| @board[342 + i * 36] = "static/sand_1.gif"}
  (0..6).each  {|i| @board[280 + i] = "static/wall_t_1.gif"}
  (0..6).each  {|i| @board[460 + i] = "static/wall_t_1.gif"}
  (0..3).each  {|i| @board[316 + i * 36] = "static/wall_l_1.gif"}

  @board[352] = "static/sandweird.gif"

  @image_array = []

  @board.each do |b| 
    image b
  end
  @uni_image = image "static/unicorn.gif", :top=> 324, :left => 1188
  @nar_image = image "static/narhwal.gif", :top =>360 , :left =>720
  @nar_top = 360
  @nar_left = 720
  def mover_nar_around
  	  variable = 1 + rand(4)
  	if variable == 1
  		if @board[(@nar_top + (@nar_left/36)) - 36]=="static/sand_1.gif"
  	  	  @nar_top -= 36
  	  	  @nar_image.style :top => @nar_top
  	  	end
  	end
  	if variable == 2
  		if @board[(@nar_top + (@nar_left/36)) + 36]=="static/sand_1.gif"
  			@nar_top += 36
  			@nar_image.style :top => @nar_top
  		end
  	end
  	if variable == 3
  		if @board[(@nar_top + (@nar_left/36)) + 1]=="static/sand_1.gif"
  			@nar_left += 36
  			@nar_image.style :left => @nar_left
  		end
  	end
  	if variable == 4
  		if @board[(@nar_top + (@nar_left/36)) - 1]=="static/sand_1.gif"
  			@nar_left -= 36
  			@nar_image.style :left => @nar_left
  		end
  	end
  		
  end
  @player_top = 360
  @player_left = 0
  @player_image = image "static/Warrior.gif", :top => 360, :left => 0

  def move_player_up
    if @board[(@player_top + (@player_left/36)) - 36]=="static/sand_1.gif" 
    @player_top -= 36
    @player_image.style :top => @player_top
    end
    
  end

  def move_player_down
    if @board[(@player_top + (@player_left/36)) + 36]=="static/sand_1.gif"
    @player_top += 36
    @player_image.style :top => @player_top
    end
 end

  def move_player_right
    if @board[(@player_top + (@player_left/36)) + 1]=="static/sand_1.gif" || @board[(@player_top + (@player_left/36)) + 1]=="static/sandweird.gif"    
    @player_left += 36
    @player_image.style :left => @player_left
    end
  end

  def move_player_left
    if @board[(@player_top + (@player_left/36)) - 1]=="static/sand_1.gif" || @board[(@player_top + (@player_left/36)) - 1]=="static/sandweird.gif" 
    @player_left -= 36
    @player_image.style :left => @player_left
    end
  end

  #animate 30 do

   #input = get_input
   # update(input)

#  end

#  def get_input
    keypress do |k|
      case k
      when 'w' then move_player_up and mover_nar_around
      when 'a' then move_player_left and mover_nar_around
      when 's' then move_player_down and mover_nar_around
      when 'd' then move_player_right and mover_nar_around
	else ''
      end
     if @player_top == 324 and @player_left == 1188
	battle
      end
    end
 # end
     
   
    

    def battle
      window :height => 730, :width => 1305 do 
        @screen = []
	@screen << "static/combatbox.gif"
	432.times { @screen << "static/sand_1.gif" }
	button "Attack", :top => 50, :left => 70 do
	end
	button "Special", :top => 150, :left => 70 do
	end
	@screen.each do |b| 
	    image b
	end
	@war_image = image "static/bigWarrior.gif", :top=> 324, :left => 188
	@uni_image = image "static/bigUnicorn.gif", :top=> 524, :left => 588
	
      end
    #comment
    end

 # end
end
 
end
