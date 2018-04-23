RSpec.describe NoReturnStatement do
  subject(:no_return_statement) { described_class.new }

  let(:context) { clean_context }

  it 'does nothing when evaluating on a context' do
    expect { no_return_statement.evaluate(context) }.not_to change(context, :head)
  end
end
