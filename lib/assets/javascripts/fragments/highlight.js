(function (factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['jquery'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // Node/CommonJS
    module.exports = factory(require('jquery'));
  } else {
    // Browser globals
    factory(jQuery);
  }
}(function ($) {
  $(function() {
    return $(document).on('fragment:update', '[data-highlight]', function(_, $newElements, $oldElements) {
      return $newElements.findAndFilter('[data-updated-at]').each(function(_, element) {
        updatedAtValue = $(element).attr('data-updated-at');
        updatedAtSelector = "[data-updated-at=\"" + updatedAtValue + "\"]";

        if (!$oldElements.findAndFilter(updatedAtSelector).length) {
          return $(updatedAtSelector).addClass('is-updated-fragment');
        }
      });
    });
  });
}));