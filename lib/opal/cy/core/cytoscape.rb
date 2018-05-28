module CY
  class Cytoscape
    include Native
    
    def initialize
      @native = `Cytoscape()`
    end
    # Graph manipulation
    alias_native :add
    alias_native :remove
    alias_native :collection
      # Collection
    alias_native :getElementById
#    alias_native :$
    alias_native :batch
    alias_native :destroy
    alias_native :scratch
    alias_native :removeScratch
    # Events
    alias_native :on
    alias_native :promiseOn
    alias_native :one
    alias_native :removeListener
    alias_native :emit
    alias_native :ready
    # Viewport manipulation
    alias_native :container
    alias_native :center
    alias_native :fit
    alias_native :reset
    alias_native :pan
    alias_native :panBy
    alias_native :panningEnabled
    alias_native :userPanningEnabled
    alias_native :zoom
    alias_native :zoomingEnabled
    alias_native :userZoomingEnabled
    alias_native :minZoom
    alias_native :maxZoom
    alias_native :viewport
    alias_native :boxSelectionEnabled
    alias_native :width
    alias_native :height
    alias_native :extent
    alias_native :autolock
    alias_native :autoungrabify
    alias_native :autounselectify
    alias_native :forceRender
    alias_native :resize
    # Animation
    alias_native :animated
    alias_native :animate
    alias_native :animation
    alias_native :delay
    alias_native :delayAnimation
    alias_native :stop
    alias_native :clearQueue
    # Layout
    alias_native :layout
    # Style
    alias_native :style
  end
end