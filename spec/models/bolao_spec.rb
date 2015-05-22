require "rails_helper"

describe Bolao do

  it { should have_attached_file(:arquivo) }
  it { should validate_attachment_presence(:arquivo) }

end
