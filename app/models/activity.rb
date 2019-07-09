class Activity < ApplicationRecord
  belongs_to :trip

  validates :description, presence: true
  validate :end_at_after_start_at, if: lambda {
    start_at.present? && end_at.present?
  }

  private

  def end_at_after_start_at
    return if start_at < end_at

    errors.add(:end_at, 'must be after the start at')
  end
end
