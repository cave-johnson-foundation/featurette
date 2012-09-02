class AddAttachmentLogoScreenshotToApps < ActiveRecord::Migration
  def self.up
    change_table :apps do |t|
      t.has_attached_file :logo
      t.has_attached_file :screenshot
    end
  end

  def self.down
    drop_attached_file :apps, :logo
    drop_attached_file :apps, :screenshot
  end
end
