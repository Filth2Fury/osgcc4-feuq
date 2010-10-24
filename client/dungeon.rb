class Dungeon
  
  def self.create_slot
    flow do
      para "DUNGEON"
    end
  end
  def initialize slot
    slot.style :hidden => false

     slot.replace do
       para "DUNGEON"
     end
   end
=begin
  @player = Player.new
  
  @player.y_pos = 360

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
        when 'w' then move_player_up
        when 'a' then move_player_left
        when 's' then move_player_down
        when 'd' then move_player_right
	else ""
      end
     if @player_top == 324 and @player_left == 1188
	battle
      end
    end
 # end
     
   
    

    def battle
      @main_flow.clear { para "battle!" }
      #window :height => 730, :width => 1305 do 
      #  @screen = []
	#@screen << "static/combatbox.gif"
	#432.times { @screen << "static/sand_1.gif" }
	#button "Attack", :top => 50, :left => 70 do
	#end
	#button "Special", :top => 150, :left => 70 do
	#end
	#@screen.each do |b| 
	#    image b
	#end
	#@war_image = image "static/bigWarrior.gif", :top=> 324, :left => 188
	#@uni_image = image "static/bigUnicorn.gif", :top=> 524, :left => 588
#	
 #     end
    #comment
    end
=end
  private 
  
  def append_to slot, &blk
     slot.app do
       slot.append {self.instance_eval &blk}
     end
   end
end

module HasDungeon
  def init_dungeon slot
    @_dungeon_class = Dungeon.new slot
  end
end