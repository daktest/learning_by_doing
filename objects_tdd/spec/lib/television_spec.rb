require './lib/television'

describe Television do
  it 'can be created' do
    expect(subject).to be_a(Television)
  end

  describe '#on?' do
    it 'returns false by default' do
      expect(subject.on?).to eq(false)
    end
  end

  context '#power is turned on for these tests' do
    before(:each) do
      subject.power
    end

    describe '#power' do
      it 'toggles power on and off' do
        expect(subject.on?).to eq(true)
        subject.power
        expect(subject.on?).to eq(false)
      end
    end

    describe '#set_channel(number)' do
      it 'sets the channel to the number if within valid range' do
        subject.channel_set(45)
        expect(subject.channel).to eq(45)
      end

      it 'leaves the channel unchanged if outside valid range' do
        subject.channel_set(874)
        expect(subject.channel).to eq(3)
      end
    end

    describe '#channel_up' do
      it 'increments the channel by one' do
        subject.channel_up
        expect(subject.channel).to eq(4)
      end

      it 'loops to first channel after reaching last channel' do
        subject.channel_set(500)
        subject.channel_up
        expect(subject.channel).to eq(3)
      end
    end

    describe '#channel_down' do
      it 'decrements the channel by one' do
        subject.channel_set(37)
        subject.channel_down
        expect(subject.channel).to eq(36)
      end

      it 'loops to last channel after reaching first channel' do
        subject.channel_down
        expect(subject.channel).to eq(500)
      end
    end

    describe '#channel_swap' do
      it 'sets channel to previous channel' do
        subject.channel_set(37)
        subject.channel_set(300)
        subject.channel_swap
        expect(subject.channel).to eq(37)
        subject.channel_swap
        expect(subject.channel).to eq(300)
      end
    end

    describe '#volume_up' do
      it 'increments the volume by one' do
        5.times { subject.volume_up }
        expect(subject.volume).to eq(5)
      end
    end

    describe '#volume_down' do
      it 'decrements the volume by one' do
        5.times { subject.volume_up }
        subject.volume_down
        expect(subject.volume).to eq(4)
      end
    end

    describe '#mute' do
      it 'toggles volume between 0 and whatever it was previously set to' do
        5.times { subject.volume_up }
        subject.mute
        expect(subject.volume).to eq(0)
        subject.mute
        expect(subject.volume).to eq(5)
      end
    end
  end
end
