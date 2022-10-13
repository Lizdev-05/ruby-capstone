require_relative '../classes/book'

describe Book do
  let(:book) { Book.new('publisher', 'cover_state', '2021-01-01') }

  describe '#initialize' do
    it 'should return publisher' do
      expect(book.publisher).to eq('publisher')
    end

    it 'should return cover_state' do
      expect(book.cover_state).to eq('cover_state')
    end

    it 'has a publish date' do
      expect(book.publish_date).to eq '2021-01-01'
    end
  end
end
