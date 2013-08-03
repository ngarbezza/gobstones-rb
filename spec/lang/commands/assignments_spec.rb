describe SingleAssignment do

  let(:context) { ExecutionContext.for double('GobstonesProgram') }

  it "should associate the var name with the evaluated expression" do
    var_name = VarName.new 'a'
    assign = SingleAssignment.new var_name, Add.new(3.to_gbs_num, 4.to_gbs_num)
    assign.evaluate context
    context.has_variable_named?('a').should be_true
    context.get(var_name).should == 7.to_gbs_num
  end

end
