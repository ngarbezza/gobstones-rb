describe NoReturnStatement do

  let(:context) { clean_context }
  let(:no_return_statement) { NoReturnStatement.new }

  it 'does nothing when evaluating on a context' do
    expect { no_return_statement.evaluate context }.not_to change { context.head }
  end

end
