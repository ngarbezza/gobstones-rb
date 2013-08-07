describe ProgramExecutionContext do

  let(:context) { ProgramExecutionContext.for Program.new([], nil) }

  it "should have a head" do
    context.head.should be_a Head
  end

end
