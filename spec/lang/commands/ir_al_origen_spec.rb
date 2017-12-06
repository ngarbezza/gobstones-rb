describe IrAlOrigen do
  let(:context) { clean_context }

  it 'puts the head in 0, 0 when evaluating' do
    context.head.move_north
    context.head.move_east
    IrAlOrigen.new.evaluate context

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(0)
  end
end
