if Rails.env.development?
  Bullet.enable = true
  Bullet.bullet_logger = true
  Bullet.rails_logger = true
end
