require './lib/cash_register.rb'

describe CashRegister do
  let(:cashregister) { CashRegister.new }
  it 'can be created' do
    expect(cashregister).to be_a(CashRegister)
  end

  describe '#total' do
    it 'returns 0.0 by default' do
      expect(cashregister.total).to eq(0.0)
    end
  end

  describe '#purchase(amount)' do
    it 'should add amount to total' do
      cashregister.purchase(5.75)
      expect(cashregister.total).to eq(5.75)
      cashregister.purchase(4.25)
      expect(cashregister.total).to eq(10.0)
    end
  end

  context '#pay(amount) behaviors' do
    it 'should subtract amount from the total' do
      cashregister.purchase(5.75)
      expect(cashregister.total).to eq(5.75)
      cashregister.pay(5.00)
      expect(cashregister.total).to eq(0.75)
    end

    it 'gives change and sets total to zero if amount > than the total' do
      cashregister.purchase(5.75)
      expect(cashregister.total).to eq(5.75)
      expect do
        cashregister.pay(6.00)
      end.to output("Your change is $0.25\n").to_stdout
      expect(cashregister.total).to eq(0)
    end

    it 'if partial payment, gives new total' do
      cashregister.purchase(5.75)
      expect(cashregister.total).to eq(5.75)
      expect do
        cashregister.pay(5.00)
      end.to output("Your new total is $0.75\n").to_stdout
      expect(cashregister.total).to eq(0.75)
    end
  end
end
