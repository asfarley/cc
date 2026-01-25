
# frozen_string_literal: true

module BatteryHelper
  # Renders a segmented battery icon.
  #
  # Usage:
  #   <%= battery_level_icon(device.battery_percent) %>
  #
  # Options:
  #   segments: number of segments (default: 5)
  #   size: :sm, :md, :lg (default: :md)
  #   show_label: add "NN%" text (default: false)
  #   title: tooltip text (default: "Battery: NN%")
  #   threshold classes are set on the root: .battery--ok/.battery--warn/.battery--crit
  def battery_level_icon(percent, segments: 5, size: :md, show_label: false, title: nil)
    p = clamp_percent(percent)
    filled = ((p / 100.0) * segments).round
    filled = [[filled, 0].max, segments].min

    state =
      if p <= 15
        "battery--crit"
      elsif p <= 35
        "battery--warn"
      else
        "battery--ok"
      end

    title ||= "Battery: #{p}%"

    content_tag(
      :span,
      class: ["battery", "battery--#{size}", state],
      role: "img",
      aria: { label: title },
      title: title,
      data: { percent: p }
    ) do
      safe_join([
        content_tag(:span, class: "battery__body", aria: { hidden: true }) do
          segs = (1..segments).map do |i|
            content_tag(:span, "", class: ["battery__seg", (i <= filled ? "is-filled" : "is-empty")], aria: { hidden: true })
          end
          safe_join(segs)
        end,
        content_tag(:span, "", class: "battery__cap", aria: { hidden: true }),
        (show_label ? content_tag(:span, "#{p}%", class: "battery__label") : nil)
      ].compact)
    end

  end

  private

  def clamp_percent(value)
    n =
      case value
      when nil then 0.0
      when String then (Float(value) rescue 0.0)
      else value.to_f
      end

    n = 0 if n.nan? || n.infinite?
    n = n.round
    [[n, 0].max, 100].min
  end
end
