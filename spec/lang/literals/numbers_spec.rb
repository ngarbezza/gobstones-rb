describe Number do

  it "evaluates to itself" do
    num = 42.to_gbs_num
    expect(num.evaluate).to eq(num)
  end

end
