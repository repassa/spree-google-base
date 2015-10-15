module Spree
  module Admin
    module GoogleBaseHelper
      def setting_presentation_row(setting, hide_value = false)
        value = hide_value ? Spree.t(:not_shown) : Spree::GoogleBase::Config[setting].to_s
        value = "&mdash;" if value.blank?
        %(
        <tr>
          <th scope="row">#{Spree.t(setting, scope: :google_base)}:</th> 
          <td>#{value}</td>
        </tr>).html_safe
      end

      def setting_field(setting)
        type = Spree::GoogleBase::Config.preference_type(setting)
        res = ''
        res += label_tag(setting, Spree.t(setting, scope: :google_base) + ': ') + tag(:br) if type != :boolean
        res += preference_field_tag(setting, Spree::GoogleBase::Config[setting], type: type)
        res += ' ' + label_tag(setting, Spree.t(setting, scope: :google_base)) + tag(:br) if type == :boolean
        res.html_safe
      end
    end
  end
end
