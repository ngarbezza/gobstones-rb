describe SingleAssignment do

  let(:context) { ExecutionContext.new }
  let(:a) { VarName.new 'a' }

  it "should associate the var name with the evaluated expression" do
    assign = SingleAssignment.new a, Add.new(3.to_gbs_num, 4.to_gbs_num)
    assign.evaluate context
    context.has_variable_named?('a').should be_true
    context.get(a).should == 7.to_gbs_num
  end

end