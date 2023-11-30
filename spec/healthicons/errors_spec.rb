# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Healthicons::Errors do
  subject(:unknown_icon_error) { described_class::UnknownIcon.new('BloodDraw.svg') }

  context 'when unknown icon error is thrown' do
    it do
      expect(unknown_icon_error.message).to eq('The BloodDraw.svg icon could not be found.')
    end
  end
end
