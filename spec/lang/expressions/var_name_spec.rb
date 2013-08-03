describe VarName do

  let(:context) { ExecutionContext.for double('GobstonesProgram') }

  it "should return the associated value if it was defined in the context" do
    var_name = VarName.new 'var'
    context.set var_name, 42.to_gbs_num
    var_name.evaluate(context).should == 42.to_gbs_num
  end

  it "should raise an error if there is no definition in context" do
    var_name = VarName.new 'var'
    expect { var_name.evaluate context }
      .to raise_error(UndefinedVariableError)
  end

end
