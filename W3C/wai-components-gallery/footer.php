<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package WAI_Components_Gallery
 */

?>

	</div><!-- #content -->

	<footer role="contentinfo">
    <h2 class="visuallyhidden">Document Information</h2>
    <p><strong>Status:</strong> Updated April 2016<br>
    Lead Developer: <a href="http://www.w3.org/People/yatil/">Eric Eggert</a> (W3C). Project Lead: <a href="/People/shadi/">Shadi Abou-Zahra</a> (W3C).<br>
    User Interface developed with the Education and Outreach Working Group (<a href="/WAI/EO/"><abbr title="Education and Outreach Working Group">EOWG</abbr></a>). <a href="https://www.w3.org/blog/wai-components-gallery/acknowledgements/">Acknowledgements</a> lists contributors and previous editors. Developed  with support from the <a href="/WAI/DEV/">WAI-DEV Project</a> in 2016.</p>
    <p>See <a href="https://www.w3.org/blog/wai-components-gallery/disclaimer-and-information/">Important Disclaimer</a>.</p>
    <nav aria-label="Footer Navigation" class="footer-nav">
      <ul>
         <li><a href="http://www.w3.org/WAI/sitemap.html">WAI Site Map</a></li>
         <li><a href="http://www.w3.org/WAI/sitehelp.html">Help with WAI Website</a></li>
         <li><a href="http://www.w3.org/WAI/search.php">Search</a></li>
         <li><a href="/WAI/contacts">Contacting WAI</a></li>
      </ul>
    </nav>
    <section class="feedback" aria-label="Feedback">
      <p><strong>Feedback welcome to <a href="mailto:wai-eo-editors@w3.org">wai-eo-editors@w3.org</a></strong> (a publicly archived list) or <a href="mailto:wai@w3.org">wai@w3.org</a> (a WAI staff-only list).</p>
    </section>
    <section class="copyright" aria-label="Copyright Notice">
      <p>Copyright © 2016 W3C <sup>®</sup> (<a href="http://www.csail.mit.edu/"><abbr title="Massachusetts Institute of Technology">MIT</abbr></a>, <a href="http://www.ercim.eu/"><abbr title="European Research Consortium for Informatics and Mathematics">ERCIM</abbr></a>, <a href="http://www.keio.ac.jp/">Keio</a>, <a href="http://ev.buaa.edu.cn/">Beihang</a>) <a href="/Consortium/Legal/ipr-notice">Usage policies apply</a>.</p>
    </section><!-- end copyright -->
  </footer>
</div><!-- #page -->

<?php wp_footer(); ?>
<script>
  jQuery('#search-filter-results-333').on('click', '.permalink_wrapper>a', function(e) {
    e.preventDefault();
    if ('#' === jQuery(e.target).attr('href')) {
      var newhref = window.location.href;
    } else {
      var newhref = window.location.href.split('#')[0] + jQuery(e.target).attr('href');
    }
    jQuery(e.target).next('.sharebox').toggleClass('open').find('input').val(newhref);
  });

  jQuery('#search-filter-results-333').on('click', '.sharebox button', function(e) {
    e.preventDefault();
    jQuery(e.target).parent().parent().removeClass('open').parentsUntil('article').parent().attr('tabindex', '-1').focus();
  });
</script>

</body>
</html>
