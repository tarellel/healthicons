# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Healthicons::Icon do
  describe 'invalid icon' do
    it 'render#missing_icon_name' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'render#non_existant_icon' do
      expect { described_class.new('body/foo').render }.to raise_error(Healthicons::Errors::UnknownIcon)
    end
  end

  describe 'options' do
    context 'with varient' do
      it 'no variant specified' do
        expect(described_class.new('body/dna').variant).to eq(:outline)
      end

      it { expect(described_class.new('body/dna', variant: 'outline').variant).to eq(:outline) }
    end

    context 'with size' do
      it 'size option passed' do
        expect(described_class.new('body/dna', size: 12).options[:size]).to eq(12)
      end
    end
  end
end
