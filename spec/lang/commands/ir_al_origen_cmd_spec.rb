describe IrAlOrigen do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }

  it "should evaluate and put the head in 0, 0" do
    context.head.move_north
    context.head.move_east
    ir_al_origen = IrAlOrigen.new

    ir_al_origen.evaluate context

    context.head.x_pos.should == 0
    context.head.y_pos.should == 0
  end

end