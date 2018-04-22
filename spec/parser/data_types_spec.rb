RSpec.describe Gobstones::Parser, 'data types' do
  describe 'numbers' do
    it 'parses a positive number' do
      expect('42').to be_parsed_as(:expression).and_return(42.to_gbs_num)
    end

    it 'parses a negative number' do
      expect('-42').to be_parsed_as(:expression).and_return(-42.to_gbs_num)
    end
  end

  describe 'booleans' do
    it 'parses a true boolean' do
      expect('True').to be_parsed_as(:expression).and_return(true_value)
    end

    it 'parses a false boolean' do
      expect('False').to be_parsed_as(:expression).and_return(false_value)
    end
  end

  describe 'colors' do
    it "parses the 'Azul' color" do
      expect('Azul').to be_parsed_as(:expression).and_return(azul)
    end

    it "parses the 'Negro' color" do
      expect('Negro').to be_parsed_as(:expression).and_return(negro)
    end

    it "parses the 'Rojo' color" do
      expect('Rojo').to be_parsed_as(:expression).and_return(rojo)
    end

    it "parses the 'Verde' color" do
      expect('Verde').to be_parsed_as(:expression).and_return(verde)
    end
  end

  describe 'directions' do
    it "parses the 'Norte' direction" do
      expect('Norte').to be_parsed_as(:expression).and_return(norte)
    end

    it "parses the 'Este' direction" do
      expect('Este').to be_parsed_as(:expression).and_return(este)
    end

    it "parses the 'Sur' direction" do
      expect('Sur').to be_parsed_as(:expression).and_return(sur)
    end

    it "parses the 'Oeste' direction" do
      expect('Oeste').to be_parsed_as(:expression).and_return(oeste)
    end
  end
end
