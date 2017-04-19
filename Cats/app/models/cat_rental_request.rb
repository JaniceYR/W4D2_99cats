require 'byebug'
class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: ["APPROVED", "DENIED", "PENDING"]
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest.where(cat_id: self.cat_id).where("end_date BETWEEN ? AND ? OR start_date BETWEEN ? AND ?", self.start_date, self.end_date, self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors.add(:overlapped, "request")
    end
  end

  def approved!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save
      deny!
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def deny!
    overlapping_pending_requests.map do |deny|
      deny.update(status: 'DENIED')
    end
  end

end
