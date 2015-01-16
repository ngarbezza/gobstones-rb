describe Main do

  let(:context) { clean_context }
  let(:return_tuple) { VarTuple.new ['x'.to_var_name, 'y'.to_var_name] }
  let(:return_from_main) { ReturnFromMain.new return_tuple }
  let(:assign_x) { SingleAssignment.new 'x'.to_var_name, 42.to_gbs_num }
  let(:assign_y) { SingleAssignment.new 'y'.to_var_name, verde }
  let(:command_block) { CommandBlock.new [assign_x, assign_y] }
  let(:main) { Main.new command_block, return_from_main }

  it "evaluates the body" do
    main.evaluate context
    expect(context.has_variable_named? 'x').to be(true)
    expect(context.has_variable_named? 'y').to be(true)
  end

  it "returns its return value, if there is one" do
    result = main.evaluate context
    expect(result).to eq({'x'.to_var_name => 42.to_gbs_num,
                          'y'.to_var_name => verde})
  end

end
