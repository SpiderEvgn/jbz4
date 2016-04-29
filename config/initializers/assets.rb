# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

# 新加了一个 jquery 库文件，但没确定到底要不要用，目前座位图是画出来了，不过图片读取有点问题，待修复
# Rails.application.config.assets.precompile += %w( jquery-1.4.1.js )