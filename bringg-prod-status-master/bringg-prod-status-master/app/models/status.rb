class Status < ActiveRecord::Base

  belongs_to :user, foreign_key: "created_by_user"

  ORIGINS = {
      rails: 0,
      node: 1,
      dashboard: 2,
      devops: 3,
      mobile: 4,
      other: 5
  }

  ORIGIN_LABELS = ['RAILS', 'NODE', 'DASHBOARD', 'DEVOPS', 'MOBILE', 'OTHER']

  def get_origin_label
    return ORIGIN_LABELS[self.incident_origin]
  end
end
