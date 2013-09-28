require 'spec_helper'
describe TrackMe do
  describe "Event" do
    describe ".publish" do
      it "must have an actor" do
        expect{ Event.publish(nil, data) }.to raise_error
      end

      it "must have a category" do
        expect{ Event.publish(user, { category: nil }) }.to raise_error
      end

      it "returns an event" do
        event = Event.publish(user, data)
        event.class.should eq(Event)
      end
    end

    describe ".create" do
      it "has an actor" do
        event.actor.should eq(user)
      end

      it "has a category" do
        event.category.should eq('View')
      end

      it "has a label" do
        event.label.should eq('Homepage')
      end

      it "has a value" do
        event.value.should eq('1')
      end
    end
  end
end
