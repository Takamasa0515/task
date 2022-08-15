class Post < ApplicationRecord
  validates :title, presence: true
  validates :post_start_at, presence: true
  validates :post_end_at, presence: true

  validate :post_date_check

private

  def post_date_check
    unless post_start_at == nil || post_end_at == nil
      start_date_check
      start_end_check
    end
  end

  def start_date_check
    if post_end_at < Date.today
      errors.add(:post_end_at, "は今日以降の日付で選択してください")
    end
  end

  def start_end_check
    if post_start_at > post_end_at
      errors.add(:post_end_at, "は開始日以降の日付で選択してください")
    end
  end
end