describe CapistranoDirty do
  shared_examples 'dirty' do |pattern|
    describe pattern do
      filename = pattern.gsub(' ', '_').downcase

      context 'when no matches exist' do
        around do |example|
          with_dir { example.run }
        end

        it 'returns false' do
          expect(CapistranoDirty.dirty?).to eq false
        end
      end

      context 'when matches exist' do
        around do |example|
          with_dir_with_fixture("#{filename}.rb") { example.run }
        end

        it 'returns a match list' do
          expect(CapistranoDirty.dirty?).to eq(
            CapistranoDirty::PatternMatch.new(pattern, "#{filename}.rb")
          )
        end
      end

      context 'when matches exist but are ignored' do
        around do |example|
          with_dir_with_fixture("#{filename}_ignored.rb") { example.run }
        end

        it 'returns false' do
          expect(CapistranoDirty.dirty?).to eq false
        end
      end
    end
  end

  describe '.dirty?' do
    include_examples 'dirty', 'FIXME'
    include_examples 'dirty', 'Git conflict markers'
    include_examples 'dirty', 'Pry'
  end
end
