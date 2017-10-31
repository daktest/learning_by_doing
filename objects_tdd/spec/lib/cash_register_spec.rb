require './lib/cash_register.rb'

describe CashRegister do
  it 'can be created' do
    expect(subject).to be_a(CashRegister)
  end

  describe '#total' do
    it 'returns 0.0 by default' do
      expect(subject.total).to eq(0.0)
    end
  end

  describe '#purchase(amount)' do
    it 'should add amount to total' do
      subject.purchase(5.75)
      subject.purchase(4.25)
      expect(subject.total).to eq(10.0)
    end
  end

  context '#pay(amount) behaviors' do
    it 'should subtract amount from the total' do
      subject.purchase(5.75)
      subject.pay(5.00)
      expect(subject.total).to eq(0.75)
    end

    it 'gives change and sets total to zero if amount > than the total' do
      subject.purchase(5.75)
      expect(subject.pay(6.00)).to eq('Your change is $0.25')
      expect(subject.total).to eq(0)
    end

    it 'if partial payment, gives new total' do
      subject.purchase(5.75)
      expect(subject.pay(5.00)).to eq('Your new total is $0.75')
    end
  end
end
