# Based on issue https://github.com/spree-contrib/spree_multi_vendor/issues/104
# This is a patch for Spree globalize to be friendly with the gem

class AddTranslationsToVendor < ActiveRecord::Migration[6.0]
  def up
    params = {name: :string, about_us: :text, contact_us: :text, slug: :string}
    if defined?(SpreeGlobalize)
      Spree::Vendor.create_translation_table!(params, {migrate_data: true})
    end
  end

  def down
    if defined?(SpreeGlobalize)
      Spree::Vendor.drop_translation_table! migrate_data: true
    end
  end
end
