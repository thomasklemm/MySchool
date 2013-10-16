# LocalizedFields for ActiveRecord
#
# class User < AR::B
#   localize_fields :born_on, :last_seen_at
# end
#
module LocalizedFields
  extend ActiveSupport::Concern

  def localize_fields(*fields)
    fields.each do |field|
      # Returns a localized string if possible
      define_method field do
        I18n.l(self[field]) rescue self[field]
      end

      # Returns the raw object
      define_method "raw_#{field}" do
        self[field]
      end
    end
  end

  alias_method :localize_field, :localize_fields
end

ActiveRecord::Base.send(:extend, LocalizedFields)
