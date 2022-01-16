jQuery(document).ready(function() {
  jQuery('.acf-js-tooltip').each(function(index, el) {
    console.log(el);
    jQuery(el).on('mouseenter', function(event) {
      event.stopImmediatePropagation();
    }).on('mouseleave', function(event) {
      event.stopImmediatePropagation();
    });
    console.log(el);
  });
});