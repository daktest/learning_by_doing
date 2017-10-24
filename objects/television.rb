#! /usr/bin/env ruby

=begin

Create a new Television with 'new'.  It has channels 3 to 500 and the volume goes from
 0 to 25.

 - turn it on or off by calling 'power'; nothing else works unless it's on
 - 'channel_up'/'channel_down' will go up or down to the next channel; it will loop when
   reaching the first or last channel.
 - 'channel_set(999)' will jump to the selected channel as long as it's within 3-500.
 - 'channel_swap' will change to whatever previous channel you were on.
 - 'volume_up'/'volume_down' will increase or decrease the volume by 1 until the upper
   or lower limit is reached.
 - 'mute' sets the volume to 0; if the volume is already zero, it sets it to whatever it
   was before mute was called.
 - 'status' displays the current channel and volume settings.

=end

class Television

  CHANNEL_RANGE = 3..500
  VOLUME_RANGE = 0..25

  def initialize
    @powered = false
    @channel = 3
    @prev_channel = 3
    @volume = 0
    @pre_mute_volume = 0
  end

  def power
    @powered = !@powered
    puts "TV is now #{on? ? 'on' : 'off'}"
  end

  def set_channel(number)
    if on?
      if !CHANNEL_RANGE.include?(number)
        puts "channel #{number} does not exist."
      else
        @prev_channel = @channel
        @channel = number
      end
      channel_status
    end
  end

  def channel_up
    if on?
      @prev_channel = @channel
      @channel += 1
      @channel = CHANNEL_RANGE.first if @channel > CHANNEL_RANGE.last
      channel_status
    end
  end

  def channel_down
    if on?
      @prev_channel = @channel
      @channel -= 1
      @channel = CHANNEL_RANGE.last if @channel < CHANNEL_RANGE.first
      channel_status
    end
  end

  def channel_swap
    if on?
      temp_chan = @prev_channel
      @prev_channel = @channel
      @channel = temp_chan
      channel_status
    end
  end

  def volume_up
    if on?
      @volume += 1 if @volume < VOLUME_RANGE.last
      volume_status
    end
  end

  def volume_down
    if on?
      @volume -= 1 if @volume > VOLUME_RANGE.first
      volume_status
    end
  end

  def mute
    if on?
      if @volume == 0
        @volume = @pre_mute_volume
      else
        @pre_mute_volume = @volume
        @volume = 0
      end
      volume_status
    end
  end

  def status
    if on?
      channel_status
      volume_status
    end
  end

  private

  def on?
    @powered
  end

  def channel_status
    puts "channel set to #{@channel}"
  end

  def volume_status
    puts "volume set to #{@volume}"
  end
end
