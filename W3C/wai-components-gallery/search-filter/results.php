<?php
/**
 * Search & Filter Pro
 *
 * Sample Results Template
 *
 * @package   Search_Filter
 * @author    Ross Morsali
 * @link      http://www.designsandcode.com/
 * @copyright 2015 Designs & Code
 *
 * Note: these templates are not full page templates, rather
 * just an encaspulation of the your results loop which should
 * be inserted in to other pages by using a shortcode - think
 * of it as a template part
 *
 * This template is an absolute base example showing you what
 * you can do, for more customisation see the WordPress docs
 * and using template tags -
 *
 * http://codex.wordpress.org/Template_Tags
 *
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

if ( $query->have_posts() )
{
  ?>

    <div class="toolbar" aria-live="assertive">
      <div>
        <div>
          Showing <?php echo $query->found_posts; ?> Results <span class="visuallyhidden">(Page <?php echo $query->query['paged']; ?> of <?php echo $query->max_num_pages; ?>)</span>
        </div>
        <div class="filters">
        <?php
          global $searchandfilter;
          $sf_current_query = $searchandfilter->get(333)->current_query();
          if ($sf_current_query->is_filtered()) {
            $qq = $sf_current_query->get_array();
            $output = array();
            foreach ($qq as $q) {
              $getname = "name";
              if (count($q['active_terms'])==1) { $getname = "singular_name"; }
              $name = $q[$getname];
              $items = array();
              foreach ($q['active_terms'] as $key => $at) {
                $items[] = $at['name'];
              }
              $items_str =  implode ( ', ' , $items );
              $output[] = $name.': '.$items_str;
            }
            echo ( "(Filters: " . implode ( ' &bull; ' , $output ) . ")" );
          }
        ?>
        </div>
      </div>
      <?php if ($sf_current_query->is_filtered()) { ?>
      <div>
        <a href="<?php echo home_url( '/' );?>" style="" type="button" id="deselect" class="btn"><?php echo wai_icon('refresh'); ?> Clear filters</a>
      </div>
      <div class="permalink_wrapper" id="sharethisview"><a href="#" class="btn"><?php echo wai_icon('share'); ?><use xlink:href="#i-share"></use></svg>&nbsp;Share this view</a><div class="sharebox"><p><label>Link to this view:<input value="" readonly="" type="url"> Shortcut to copy the link: <kbd>ctrl</kbd>+<kbd>C</kbd> <em>or</em> <kbd>⌘</kbd><kbd>C</kbd></label></p><p><a href="">E-mail a link to this section</a><button>Close</button></p></div></div>
      <?php } ?>
    </div>
    <div class="results-details">

    <nav class="pagination" label="Seitennavigation">
      <ul role="presentation">
        <li class="nav-next" role="presentation"><?php previous_posts_link( 'Previous Page' ); ?></li>
        <li class="nav-info" aria-hidden="true" id="toppaginationtitle"><span class="visuallyhidden">Pagination: </span>Page <?php echo $query->query['paged']; ?> of <?php echo $query->max_num_pages; ?></li>
        <li class="nav-prev" role="presentation"><?php next_posts_link( 'Next Page', $query->max_num_pages ); ?></li>
      </ul>
    </nav>

  <?php
  while ($query->have_posts())
  {
    $query->the_post();

    ?>
    <?php $field = get_fields(); ?>

<?php $comptype = array(); ?>
<?php if($field['component_type']) { ?>
    <?php $comptype[] = $field['component_type']->name; ?>
<?php } ?>

<article id="component-<?php the_ID();?>" <?php post_class('tile'); ?>>
  <header class="entry-header">
    <h2 class="entry-title"><a href="<?php the_field( "website" ); ?>"><?php the_title(); ?> <?php echo wai_icon('link-external', 'External Link'); ?></a> <small><span class="byline">by <?php echo $field['vendor']->name; ?></span></small></h2>

    <?php if ( 'post' === get_post_type() ) : ?>
    <div class="entry-meta">
      <?php wai_components_posted_on(); ?>
    </div><!-- .entry-meta -->
    <?php endif; ?>
    <div class="permalink_wrapper"><a href="<?php the_permalink(); ?>" class="btn"><?php echo wai_icon('share'); ?><use xlink:href="#i-share"></use></svg>&nbsp;Share</a><div class="sharebox"><p><label>Link to this view:<input value="<?php the_permalink(); ?>" readonly="" type="url"> Shortcut to copy the link: <kbd>ctrl</kbd>+<kbd>C</kbd> <em>or</em> <kbd>⌘</kbd><kbd>C</kbd></label></p><p><a href="mailto:?body=<?php the_permalink(); ?>">E-mail a link to this section</a><button>Close</button></p></div></div>
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
        <p class="support"><a href="<?php the_permalink(); ?>#report"><?php echo wai_icon( 'warning' ); ?> Report a problem with this entry</a> <?php wai_components_entry_footer(); ?></p>
      </aside>
    </div>
  </div><!-- .entry-content -->
</article><!-- #post-## -->

    <?php
  }
  ?>
    <nav class="pagination" labelledby="bottompaginationtitle">
      <ul role="presentation">
        <li class="nav-next" role="presentation"><?php previous_posts_link( 'Previous Page' ); ?></li>
        <li class="nav-info" aria-hidden="true" id="bottompaginationtitle"><span class="visuallyhidden">Pagination: </span>Page <?php echo $query->query['paged']; ?> of <?php echo $query->max_num_pages; ?></li>
        <li class="nav-prev" role="presentation"><?php next_posts_link( 'Next Page', $query->max_num_pages ); ?></li>
      </ul>
    </nav>
  </div>
  <?php
}
else
{?>
   <div class="toolbar" aria-live="assertive">
      0 Results
    </div>
  <?php
}
?>