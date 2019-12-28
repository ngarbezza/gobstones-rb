RSpec.describe 'comparison expressions' do
  describe Equal do
    it 'evaluates same booleans as equal' do
      expect(described_class.new(false_value, false_value).evaluate).to eq(true_value)
      expect(described_class.new(true_value, true_value).evaluate).to eq(true_value)
      expect(described_class.new(false_value, true_value).evaluate).to eq(false_value)
      expect(described_class.new(true_value, false_value).evaluate).to eq(false_value)
    end

    it 'evaluates same colors as equal' do
      color_classes = Color.all
      color_classes.each do |color_class|
        expect(described_class.new(color_class.new, color_class.new).evaluate).to eq(true_value)
        (color_classes - [color_class]).each do |different_color_class|
          expect(described_class.new(color_class.new, different_color_class.new).evaluate).to eq(false_value)
        end
      end
    end

    it 'evaluates same directions as equal' do
      dir_classes = Direction.all
      dir_classes.each do |dir_class|
        expect(described_class.new(dir_class.new, dir_class.new).evaluate).to eq(true_value)
        (dir_classes - [dir_class]).each do |different_dir_class|
          expect(described_class.new(dir_class.new, different_dir_class.new).evaluate).to eq(false_value)
        end
      end
    end

    it 'evaluates same numbers as equal' do
      expect(described_class.new(42.to_gbs_num, 42.to_gbs_num).evaluate).to eq(true_value)
      expect(described_class.new(42.to_gbs_num, 15.to_gbs_num).evaluate).to eq(false_value)
    end
  end

  describe NotEqual do
    it 'evaluates booleans as not equal' do
      expect(described_class.new(false_value, false_value).evaluate).to eq(false_value)
      expect(described_class.new(true_value, true_value).evaluate).to eq(false_value)
      expect(described_class.new(false_value, true_value).evaluate).to eq(true_value)
      expect(described_class.new(true_value, false_value).evaluate).to eq(true_value)
    end

    it 'evaluates same colors as equal' do
      color_classes = Color.all
      color_classes.each do |color_class|
        expect(described_class.new(color_class.new, color_class.new).evaluate).to eq(false_value)
        (color_classes - [color_class]).each do |different_color_class|
          expect(described_class.new(color_class.new, different_color_class.new).evaluate).to eq(true_value)
        end
      end
    end

    it 'evaluates same directions as equal' do
      dir_classes = Direction.all
      dir_classes.each do |dir_class|
        expect(described_class.new(dir_class.new, dir_class.new).evaluate).to eq(false_value)
        (dir_classes - [dir_class]).each do |different_dir_class|
          expect(described_class.new(dir_class.new, different_dir_class.new).evaluate).to eq(true_value)
        end
      end
    end

    it 'evaluates same numbers as equal' do
      expect(described_class.new(42.to_gbs_num, 42.to_gbs_num).evaluate).to eq(false_value)
      expect(described_class.new(42.to_gbs_num, 15.to_gbs_num).evaluate).to eq(true_value)
    end
  end

  describe LessThan do
    it 'evaluates for booleans' do
      expect(described_class.new(false_value, false_value).evaluate).to eq(false_value)
      expect(described_class.new(false_value, true_value).evaluate).to eq(true_value)
      expect(described_class.new(true_value, false_value).evaluate).to eq(false_value)
      expect(described_class.new(true_value, true_value).evaluate).to eq(false_value)
    end

    it 'evaluates for numbers' do
      expect(described_class.new(15.to_gbs_num, 42.to_gbs_num).evaluate).to eq(true_value)
      expect(described_class.new(42.to_gbs_num, 15.to_gbs_num).evaluate).to eq(false_value)
      expect(described_class.new(42.to_gbs_num, 42.to_gbs_num).evaluate).to eq(false_value)
    end

    it 'evaluates for colors' do
      color_classes = Color.order
      color_classes.each_with_index do |color_class, index|
        # should not be less than itself
        expect(described_class.new(color_class.new, color_class.new).evaluate).to eq(false_value)
        color_classes.take(index).each do |previous_color_class|
          # should not be less than any previous value
          expect(described_class.new(color_class.new, previous_color_class.new).evaluate).to eq(false_value)
        end
        color_classes.drop(index + 1).each do |next_color_class|
          # should be less than any next value
          expect(described_class.new(color_class.new, next_color_class.new).evaluate).to eq(true_value)
        end
      end
    end

    it 'evaluates for directions' do
      dir_classes = Direction.order
      dir_classes.each_with_index do |dir_class, index|
        expect(described_class.new(dir_class.new, dir_class.new).evaluate).to eq(false_value)
        dir_classes.take(index).each do |previous_dir_class|
          expect(described_class.new(dir_class.new, previous_dir_class.new).evaluate).to eq(false_value)
        end
        dir_classes.drop(index + 1).each do |next_dir_class|
          expect(described_class.new(dir_class.new, next_dir_class.new).evaluate).to eq(true_value)
        end
      end
    end
  end

  describe LessEqual do
    it 'evaluates for booleans' do
      expect(described_class.new(false_value, false_value).evaluate).to eq(true_value)
      expect(described_class.new(false_value, true_value).evaluate).to eq(true_value)
      expect(described_class.new(true_value, false_value).evaluate).to eq(false_value)
      expect(described_class.new(true_value, true_value).evaluate).to eq(true_value)
    end

    it 'evaluates for numbers' do
      expect(described_class.new(15.to_gbs_num, 42.to_gbs_num).evaluate).to eq(true_value)
      expect(described_class.new(42.to_gbs_num, 15.to_gbs_num).evaluate).to eq(false_value)
      expect(described_class.new(42.to_gbs_num, 42.to_gbs_num).evaluate).to eq(true_value)
    end

    it 'evaluates for colors' do
      color_classes = Color.order
      color_classes.each_with_index do |color_class, index|
        expect(described_class.new(color_class.new, color_class.new).evaluate).to eq(true_value)
        color_classes.take(index).each do |previous_color_class|
          expect(described_class.new(color_class.new, previous_color_class.new).evaluate).to eq(false_value)
        end
        color_classes.drop(index + 1).each do |next_color_class|
          expect(described_class.new(color_class.new, next_color_class.new).evaluate).to eq(true_value)
        end
      end
    end

    it 'evaluates for directions' do
      dir_classes = Direction.order
      dir_classes.each_with_index do |dir_class, index|
        expect(described_class.new(dir_class.new, dir_class.new).evaluate).to eq(true_value)
        dir_classes.take(index).each do |previous_dir_class|
          expect(described_class.new(dir_class.new, previous_dir_class.new).evaluate).to eq(false_value)
        end
        dir_classes.drop(index + 1).each do |next_dir_class|
          expect(described_class.new(dir_class.new, next_dir_class.new).evaluate).to eq(true_value)
        end
      end
    end
  end

  describe GreaterThan do
    it 'evaluates for booleans' do
      expect(described_class.new(false_value, false_value).evaluate).to eq(false_value)
      expect(described_class.new(false_value, true_value).evaluate).to eq(false_value)
      expect(described_class.new(true_value, false_value).evaluate).to eq(true_value)
      expect(described_class.new(true_value, true_value).evaluate).to eq(false_value)
    end

    it 'evaluates for numbers' do
      expect(described_class.new(15.to_gbs_num, 42.to_gbs_num).evaluate).to eq(false_value)
      expect(described_class.new(42.to_gbs_num, 15.to_gbs_num).evaluate).to eq(true_value)
      expect(described_class.new(42.to_gbs_num, 42.to_gbs_num).evaluate).to eq(false_value)
    end

    it 'evaluates for colors' do
      color_classes = Color.order
      color_classes.each_with_index do |color_class, index|
        expect(described_class.new(color_class.new, color_class.new).evaluate).to eq(false_value)
        color_classes.take(index).each do |previous_color_class|
          expect(described_class.new(color_class.new, previous_color_class.new).evaluate).to eq(true_value)
        end
        color_classes.drop(index + 1).each do |next_color_class|
          expect(described_class.new(color_class.new, next_color_class.new).evaluate).to eq(false_value)
        end
      end
    end

    it 'evaluates for directions' do
      dir_classes = Direction.order
      dir_classes.each_with_index do |dir_class, index|
        expect(described_class.new(dir_class.new, dir_class.new).evaluate).to eq(false_value)
        dir_classes.take(index).each do |previous_dir_class|
          expect(described_class.new(dir_class.new, previous_dir_class.new).evaluate).to eq(true_value)
        end
        dir_classes.drop(index + 1).each do |next_dir_class|
          expect(described_class.new(dir_class.new, next_dir_class.new).evaluate).to eq(false_value)
        end
      end
    end
  end

  describe GreaterEqual do
    it 'evaluates for booleans' do
      expect(described_class.new(false_value, false_value).evaluate).to eq(true_value)
      expect(described_class.new(false_value, true_value).evaluate).to eq(false_value)
      expect(described_class.new(true_value, false_value).evaluate).to eq(true_value)
      expect(described_class.new(true_value, true_value).evaluate).to eq(true_value)
    end

    it 'evaluates for numbers' do
      expect(described_class.new(15.to_gbs_num, 42.to_gbs_num).evaluate).to eq(false_value)
      expect(described_class.new(42.to_gbs_num, 15.to_gbs_num).evaluate).to eq(true_value)
      expect(described_class.new(42.to_gbs_num, 42.to_gbs_num).evaluate).to eq(true_value)
    end

    it 'evaluates for colors' do
      color_classes = Color.order
      color_classes.each_with_index do |color_class, index|
        expect(described_class.new(color_class.new, color_class.new).evaluate).to eq(true_value)
        color_classes.take(index).each do |previous_color_class|
          expect(described_class.new(color_class.new, previous_color_class.new).evaluate).to eq(true_value)
        end
        color_classes.drop(index + 1).each do |next_color_class|
          expect(described_class.new(color_class.new, next_color_class.new).evaluate).to eq(false_value)
        end
      end
    end

    it 'evaluates for directions' do
      dir_classes = Direction.order
      dir_classes.each_with_index do |dir_class, index|
        expect(described_class.new(dir_class.new, dir_class.new).evaluate).to eq(true_value)
        dir_classes.take(index).each do |previous_dir_class|
          expect(described_class.new(dir_class.new, previous_dir_class.new).evaluate).to eq(true_value)
        end
        dir_classes.drop(index + 1).each do |next_dir_class|
          expect(described_class.new(dir_class.new, next_dir_class.new).evaluate).to eq(false_value)
        end
      end
    end
  end
end
