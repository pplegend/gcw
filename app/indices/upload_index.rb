ThinkingSphinx::Index.define :upload, :with => :active_record do
  indexes upload_file_name
  indexes user.uploads.upload_file_name, :as => :related_videos

end
