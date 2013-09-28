require 'spec_helper'
describe TrackMe do
  describe "Actor" do
    describe ".track_me" do
      it "must have a category" do
        expect{ user.track_me(category: '', label: 'Homepage') }.to raise_error
      end

      it "must have a label" do
        expect{ user.track_me(category: 'View', label: '') }.to raise_error
      end

      it "is valid with category and label" do
        expect{ user.track_me(data) }.not_to raise_error
      end
    end
  end
end
