<?php
/**
 * Template part for displaying single posts.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WAI_Components_Gallery
 */

if (!function_exists('curlurl')) {
  function curlurl($url) {
    $ch = curl_init();

    // set URL and other appropriate options
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_HEADER, 0);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_USERAGENT, 'W3C-WAI');

    // grab URL and pass it to the browser
    $data = curl_exec($ch);
    // echo('<!--'."\n");
    // var_dump($data);
    // echo("\n".'-->');
    curl_close($ch);
    return json_decode ( $data );
  }
}

?>

<div class="search-filter-results">
<div class="results-details">

<?php $field = get_fields(); ?>

<?php $comptype = array(); ?>
<?php if($field['component_type']) { ?>
    <?php $comptype[] = $field['component_type']->name; ?>
<?php } ?>

<article id="component-<?php the_ID();?>" <?php post_class('tile');?>>
	<header class="entry-header">
		<h1 class="entry-title"><a href="<?php the_field( "website" ); ?>"><?php the_title(); ?> <?php echo wai_icon('link-external', 'External Link'); ?></a> <small><span class="byline">by <?php echo $field['vendor']->name; ?></span></small></h1>

    <?php if ( 'post' === get_post_type() ) : ?>
    <div class="entry-meta">
      <?php wai_components_posted_on(); ?>
    </div><!-- .entry-meta -->
    <?php endif; ?>
    <div class="permalink_wrapper"><a href="#component-<?php the_ID();?>" class="btn"><?php echo wai_icon('share'); ?><use xlink:href="#i-share"></use></svg>&nbsp;Share</a><div class="sharebox"><p><label>Link to this view:<input value="" readonly="" type="url"> Shortcut to copy the link: <kbd>ctrl</kbd>+<kbd>C</kbd> <em>or</em> <kbd>⌘</kbd><kbd>C</kbd></label></p><p><a href="">E-mail a link to this section</a><button>Close</button></p></div></div>
	</header><!-- .entry-header -->
	<div class="entry-content">
		<div class="thumbnail">
      <a aria-hidden="true" href="<?php the_field( "website" ); ?>">
        <img src="<?php bloginfo('template_url'); ?>/screenshot.php?url=<?php urlencode(the_field( "website" )); ?>&amp;w=200" alt="Screenshot of “<?php the_title( ); ?>”">
      </a>
    </div>
    <div class="description">
      <div class="desc-inner">
        <p>
        <?php
          if($comptype) {
            echo ('<span class="visuallyhidden">Component Type:</span>');
            foreach ($comptype as $type) {
              echo ('<span class="type type-'.strtolower($type).'">'.$type.'');
              if('Theme' == $type) {
                echo ' <span>for '.get_field( 'cms' )->name.'</span>';
              }
              echo ('</span> ');
            }
          }
          if ( strlen(strip_tags($field['description'])) > 600 ) {
            echo substr(strip_tags($field['description']),0,500).'…';
          } else {
            echo strip_tags($field['description']);
          }
        ?>
        </p>
        <p><a href="<?php the_field( "website" ); ?>"><?php the_field( "website" ); ?></a></p>
      </div>
    <?php
      wp_link_pages( array(
        'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'wai_components' ),
        'after'  => '</div>',
      ) );
    ?>
    <aside class="moreinfo">
      <ul>
      <?php if($field['tags']) { ?>
        <li class="tags">
          <h3>Tags</h3>
          <ul>
            <?php foreach ($field['tags'] as $tag) { ?>
              <li><?php /*<a href="<?php echo get_term_link($tag) ?>">*/?><?php echo $tag->name ?><?php /*</a>*/?></li>
            <?php } ?>
          </ul>
        </li>
      <?php } ?>
      <?php if(get_field('license')) { ?>
        <li><strong>License:</strong> <?php echo get_field('license')->name; ?></li>
      <?php } ?>
      <?php if(get_field('a11y_statement_url')) { ?>
        <li><strong>Accessibility:</strong> <a href="<?php echo get_field('a11y_statement_url'); ?>">Statement provided</a></li>
      <?php } ?>
      <?php if (get_field("development_url")) { ?>
        <li><strong>Repository:</strong> <a href="<?php the_field("development_url"); ?>">Source Code Available</a>
        <?php if ( strpos ( get_field( "development_url" ) , 'github.com' ) !== FALSE ) {
          $gh = preg_split ( '/\//' , str_replace(array("http://", "https://", 'www.', 'github.com/'), "", get_field( "development_url" ) ) );

          $gh['user'] = $gh[0];
          $gh['repo'] = $gh[1];

          $jdata = curlurl('https://api.github.com/repos/'.$gh['user'].'/'.$gh['repo']);

          // create a new cURL resource

          ?>
          <span class="github">(Github Statistics: <?php echo wai_icon( "gh-star", "" ); ?> <?php echo $jdata->subscribers_count ?> Stars, <?php echo wai_icon( "gh-forked", "" ); ?> <?php echo $jdata->forks ?> Forks, Last Update: <?php echo strftime('%F', strtotime($jdata->updated_at)) ?>)</span>
          <?php } ?>
          </li>
          <?php } ?>
          <li><strong>Component submitted:</strong> <?php the_modified_date("Y-m-d"); ?></li>
        </ul>
        <div class="entry-report" id="report">
			<button onclick="if (document.querySelector('#comment_form').getAttribute('hidden')) {document.querySelector('#comment_form').removeAttribute('hidden');} else {document.querySelector('#comment_form').setAttribute('hidden', true);}"><?php echo wai_icon( 'warning' ); ?> Report a problem with this entry</button>
				<div id="comment_form">
				<?php
					// If comments are open or we have at least one comment, load up the comment template.
					if ( comments_open() || get_comments_number() ) :
						comments_template();
					endif;
				?>
				</div>
				<script>
					if ('#report' !== window.location.hash) {
						document.querySelector('#comment_form').setAttribute('hidden', true);
					}
				</script>
				</div>
      </aside>
		</div>
	</div><!-- .entry-content -->

</article><!-- #post-## -->
</div>
</div>
