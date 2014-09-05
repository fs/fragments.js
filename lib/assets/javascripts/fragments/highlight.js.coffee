#= require utils

$ ->
  $(document).on 'fragment:update', '[data-highlight]', (_, $newElements, $oldElements) ->
    $newElements.findAndFilter('[data-updated-at]').each (_, element) ->
      updatedAtValue = $(element).attr('data-updated-at')
      updatedAtSelector = "[data-updated-at=\"#{updatedAtValue}\"]"

      unless $oldElements.findAndFilter(updatedAtSelector).length
        $(updatedAtSelector).addClass('is-updated-fragment')
