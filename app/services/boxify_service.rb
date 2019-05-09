# frozen_string_literal: true

# Extrapoled service class to use boxify gem with own logics
class BoxifyService
  def self.setup_measures(packs)
    boxes = packs[:packages].map { |package| new_box(package) }
    weighted_packages = packs[:packages].sum { |package| (package[:weight] || 1) * package[:quantity] }
    boxes_packed = pack(boxes)
    box_measures(boxes_packed, weighted_packages)
  end

  def self.new_box(package)
    Boxify::Box.new(
      width: package[:width],
      depth: package[:length],
      height: package[:height],
      total_count: package[:quantity]
    )
  end

  def self.pack(boxes)
    boxes_packed = Boxify::Pack.new(boxes: Boxify::BoxCollection.new(boxes: boxes))
    boxes_packed.pack
    boxes_packed
  end

  def self.box_measures(boxes_packed, weighted_packages)
    {
      packing_measures: {
        length: boxes_packed.container.depth,
        width: boxes_packed.container.width,
        height: boxes_packed.container.height,
        weight: weighted_packages
      }
    }
  end
end
