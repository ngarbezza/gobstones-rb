describe VarName do

  let(:context) { ExecutionContext.new }
  let(:var_name) { VarName.new 'var' }

  it "should return the associated value if it was defined in the context" do
    context.set var_name, 42.to_gbs_num
    var_name.evaluate(context).should == 42.to_gbs_num
  end

  it "should raise an error if there is no definition in context" do
    expect { var_name.evaluate context }
      .to raise_error(UndefinedVariableError)
  end

end