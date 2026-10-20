Redmine::Plugin.register :redmine_inline_image_attachments do
  name 'Redmine Inline Image Attachments'
  author 'ablida'
  description 'When downloading image attachments, display image in browser tab instead of triggering download'
  version '0.0.1'
  url 'https://github.com/ablida/redmine_inline_image_attachments'
  author_url 'https://github.com/ablida'


  RedmineApp::Application.config.after_initialize do
    AttachmentsController.prepend InlineAttachmentImages
  end
end
