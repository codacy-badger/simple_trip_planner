class Trip::GraphData
  def initialize(trip)
    @trip = trip
  end

  def self.fetch(trip)
    new(trip).fetch
  end

  def fetch
    grouped_collection.each_with_object({}) do |(category, activities), hash|
      hash[category] = activities.pluck(:price).sum
      hash
    end
  end

  private

  attr_reader :trip

  def grouped_collection
    trip.activities.group_by(&:category)
  end
end