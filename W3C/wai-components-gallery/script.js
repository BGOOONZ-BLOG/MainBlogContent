// jQuery(document).ready(function() {

//   function init() {
//     console.log('init');

//     jQuery(".sf-field-taxonomy-wai_tags").first().append(jQuery('<button id="showalltags">Show all tags</button>'));

//     jQuery('#showalltags').on('click', function(e) {
//       var txt = jQuery('.sf-field-taxonomy-wai_tags').first().is('.open') ? 'Show all tags' : 'Show fewer tags';
//       jQuery(this).text(txt);
//       jQuery('.sf-field-taxonomy-wai_tags').first().toggleClass('open');
//       e.preventDefault();
//     });

//     jQuery('#search-filter-form-333').on('change', function(e) {
//       console.log('change');
//       window.setTimeout(function(e) {
//         init
//       }, 1500);
//     });

//   }

//   init();

// });