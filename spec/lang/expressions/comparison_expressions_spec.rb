describe "comparison expressions" do

  let(:false_value) { False.new }
  let(:true_value) { True.new }

  describe Equal do

    it "should evaluate same booleans as equal" do
      Equal.new(false_value, false_value).evaluate.should == true_value
      Equal.new(true_value, true_value).evaluate.should == true_value
      Equal.new(false_value, true_value).evaluate.should == false_value
      Equal.new(true_value, false_value).evaluate.should == false_value
    end

    it "should evaluate same colors as equal" do
      color_classes = [Azul, Negro, Rojo, Verde]
      color_classes.each do |color_class|
        Equal.new(color_class.new, color_class.new).
          evaluate.should == true_value
        (color_classes - [color_class]).each do |different_color_class|
          Equal.new(color_class.new, different_color_class.new).
            evaluate.should == false_value
        end
      end
    end

    it "should evaluate same directions as equal" do
      dir_classes = [Norte, Sur, Este, Oeste]
      dir_classes.each do |dir_class|
        Equal.new(dir_class.new, dir_class.new).
          evaluate.should == true_value
        (dir_classes - [dir_class]).each do |different_dir_class|
          Equal.new(dir_class.new, different_dir_class.new).
            evaluate.should == false_value
        end
      end
    end

    it "should evaluate same numbers as equal" do
      Equal.new(42.as_gbs_num, 42.as_gbs_num).evaluate.should == true_value
      Equal.new(42.as_gbs_num, 15.as_gbs_num).evaluate.should == false_value
    end

  end

  describe NotEqual do

    it "should evaluate booleans as not equal" do
      NotEqual.new(false_value, false_value).evaluate.should == false_value
      NotEqual.new(true_value, true_value).evaluate.should == false_value
      NotEqual.new(false_value, true_value).evaluate.should == true_value
      NotEqual.new(true_value, false_value).evaluate.should == true_value
    end

    it "should evaluate same colors as equal" do
      color_classes = [Azul, Negro, Rojo, Verde]
      color_classes.each do |color_class|
        NotEqual.new(color_class.new, color_class.new).
          evaluate.should == false_value
        (color_classes - [color_class]).each do |different_color_class|
          NotEqual.new(color_class.new, different_color_class.new).
            evaluate.should == true_value
        end
      end
    end

    it "should evaluate same directions as equal" do
      dir_classes = [Norte, Sur, Este, Oeste]
      dir_classes.each do |dir_class|
        NotEqual.new(dir_class.new, dir_class.new).
          evaluate.should == false_value
        (dir_classes - [dir_class]).each do |different_dir_class|
          NotEqual.new(dir_class.new, different_dir_class.new).
            evaluate.should == true_value
        end
      end
    end

    it "should evaluate same numbers as equal" do
      NotEqual.new(42.as_gbs_num, 42.as_gbs_num).evaluate.should == false_value
      NotEqual.new(42.as_gbs_num, 15.as_gbs_num).evaluate.should == true_value
    end

  end

  describe LessThan do

    it "should evaluate for booleans" do
      LessThan.new(false_value, false_value).evaluate.should == false_value
      LessThan.new(false_value, true_value).evaluate.should == true_value
      LessThan.new(true_value, false_value).evaluate.should == false_value
      LessThan.new(true_value, true_value).evaluate.should == false_value
    end

    it "should evaluate for numbers" do
      LessThan.new(15.as_gbs_num, 42.as_gbs_num).evaluate.should == true_value
      LessThan.new(42.as_gbs_num, 15.as_gbs_num).evaluate.should == false_value
      LessThan.new(42.as_gbs_num, 42.as_gbs_num).evaluate.should == false_value
    end

    it "should evaluate for colors" do
      color_classes = Color.order
      color_classes.each_with_index do |color_class, index|
        # should not be less than itself
        LessThan.new(color_class.new, color_class.new).
          evaluate.should == false_value
        color_classes.take(index).each do |previous_color_class|
          # should not be less than any previous value
          LessThan.new(color_class.new, previous_color_class.new).
            evaluate.should == false_value
        end
        color_classes.drop(index+1).each do |next_color_class|
          # should be less than any next value
          LessThan.new(color_class.new, next_color_class.new).
            evaluate.should == true_value
        end
      end
    end

    it "should evaluate for directions" do
      dir_classes = Direction.order
      dir_classes.each_with_index do |dir_class, index|
        LessThan.new(dir_class.new, dir_class.new).
          evaluate.should == false_value
        dir_classes.take(index).each do |previous_dir_class|
          LessThan.new(dir_class.new, previous_dir_class.new).
            evaluate.should == false_value
        end
        dir_classes.drop(index+1).each do |next_dir_class|
          LessThan.new(dir_class.new, next_dir_class.new).
            evaluate.should == true_value
        end
      end
    end

  end

end
