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

end
