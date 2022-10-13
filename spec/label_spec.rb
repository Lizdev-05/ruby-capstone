require '../classes/label'

describe Label do
  let(:label) { Label.new('label', 'red') }

  it 'has a title' do
    expect(label.title).to eq('label')
  end

  it 'has a color' do
    expect(label.color).to eq('red')
  end

  it 'has an id' do
    expect(label.id).to be_a(Integer)
  end

  it 'has items' do
    expect(label.items).to eq([])
  end
end
