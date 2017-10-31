# Create a new Television with 'new'.  It has channels 3 to 500 and the volume
# goes from 0 to 25.
#
#  - check whether it's on or not by calling 'on?'; nothing else responds unless
#    it's on
#  - turn it on or off by calling 'power'.
#  - 'channel_up'/'channel_down' will go up or down to the next channel; it will
#    loop when reaching the first or last channel.
#  - 'channel_set(999)' will jump to the selected channel as long as it's within
#    3-500.
#  - 'channel_swap' will change to whatever previous channel you were on.
#  - 'volume_up'/'volume_down' will increase or decrease the volume by 1 until
#    the upper or lower limit is reached.
#  - 'mute' sets the volume to 0; if already muted, it sets it to whatever it
#    was before mute was called.
#  - 'status' displays the current channel and volume settings.
#
class Television
  attr_reader :on, :channel, :volume
  alias on? on

  CHANNEL_RANGE = 3..500
  VOLUME_RANGE = 0..25

  def initialize
    @on = false
    @channel = 3
    @prev_channel = 3
    @volume = 0
    @muted = false
    @pre_mute_volume = 0
  end

  def power
    @on = !@on
    puts "TV is now #{on? ? 'on' : 'off'}"
  end

  def channel_set(number)
    return unless on?
    if !CHANNEL_RANGE.include?(number)
      puts "channel #{number} does not exist."
    else
      @prev_channel = channel
      @channel = number
    end
    channel_status
  end

  def channel_up
    return unless on?
    @prev_channel = channel
    @channel += 1
    @channel = CHANNEL_RANGE.first if channel > CHANNEL_RANGE.last
    channel_status
  end

  def channel_down
    return unless on?
    @prev_channel = channel
    @channel -= 1
    @channel = CHANNEL_RANGE.last if channel < CHANNEL_RANGE.first
    channel_status
  end

  def channel_swap
    return unless on?
    temp_chan = @prev_channel
    @prev_channel = channel
    @channel = temp_chan
    channel_status
  end

  def volume_up
    return unless on?
    @muted = false
    @volume += 1 if @volume < VOLUME_RANGE.last
    volume_status
  end

  def volume_down
    return unless on?
    @muted = false
    @volume -= 1 if @volume > VOLUME_RANGE.first
    volume_status
  end

  def mute
    return unless on?
    if @muted
      @volume = @pre_mute_volume
      @muted = false
    else
      @pre_mute_volume = @volume
      @volume = 0
      @muted = true
    end
    volume_status
  end

  def status
    return unless on?
    channel_status
    volume_status
  end
end

private

def channel_status
  puts "channel set to #{channel}"
end

def volume_status
  puts "volume set to #{volume}"
end
