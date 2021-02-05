class BoardMessage < ApplicationRecord

  belongs_to :teacher_member

  BOARD_TAGS = %w(全体 文系 理系)
end
