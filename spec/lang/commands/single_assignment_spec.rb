# frozen_string_literal: true

RSpec.describe SingleAssignment do
  let(:context) { clean_context }
  let(:a) { 'a'.to_var_name }

  it 'evaluates the associated expression to the var name' do
    assign = described_class.new(a, Add.new(3.to_gbs_num, 4.to_gbs_num))
    assign.evaluate context

    expect(context.has_variable_named?('a')).to be(true)
    expect(context.get(a)).to eq(7.to_gbs_num)
  end
end
