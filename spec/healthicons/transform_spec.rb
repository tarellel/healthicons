# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Healthicons::Transform do
  describe 'basic defaults' do
    it 'without options' do
      expect(described_class.call('<svg>Stuff</svg>')).to eq('<svg height="24" width="24" aria-hidden="true" stroke="currentColor" focusable="false" role="img">Stuff</svg>')
    end

    it 'with options' do
      expect(described_class.call('<svg>Stuff</svg>', alt: 'something')).to eq('<svg height="24" width="24" aria-hidden="true" stroke="currentColor" focusable="false" role="img" alt="something">Stuff</svg>')
    end
  end

  describe 'options beging removed' do
    it 'remove width' do
      expect(described_class.call('<svg>Stuff</svg>', width: 17)).to eq('<svg height="24" width="24" aria-hidden="true" stroke="currentColor" focusable="false" role="img">Stuff</svg>')
    end
  end
end
