<?php
/**
 * Template part for displaying posts.
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

<?php $field = get_fields(); ?>

<?php if($field['component_type']) { ?>
	<?php foreach ($field['component_type'] as $type) { ?>
		<?php $comptype[] = $type->name; ?>
	<?php } ?>
<?php } ?>

<article id="post-<?php the_ID(); ?>" <?php post_class('tile'); ?>>
	<header class="entry-header">
		<h2 class="entry-title"><a href="<?php the_field( "website" ); ?>"><?php the_title(); ?></a> <small><?php if(in_array('Theme', $comptype)) { ?>for <?php echo get_field( 'cms' )->name;?>, <?php } ?><span class="byline">by <?php echo $field['vendor']->name; ?></span></small></h2>

		<?php if ( 'post' === get_post_type() ) : ?>
		<div class="entry-meta">
			<?php wai_components_posted_on(); ?>
		</div><!-- .entry-meta -->
		<?php endif; ?>
		<?php if($field['component_type']) { ?>
			<span class="visuallyhidden">Type:</span>
			<?php foreach ($comptype as $type) { ?>
				<span class="type"><?php echo $type; ?></span>
			<?php } ?>
		<?php } ?>
	</header><!-- .entry-header -->

	<div class="entry-content">
		<div class="thumbnail">
			<img src="<?php bloginfo('template_url'); ?>/screenshot.php?url=<?php urlencode(the_field( "website" )); ?>&amp;w=200" alt="Screenshot of “<?php the_title( ); ?>”">
		</div>
		<div class="description">
			<p>
			<?php
				/*the_content( sprintf(
					/* translators: %s: Name of current post. *//*
					wp_kses( __( 'Continue reading %s <span class="meta-nav">&rarr;</span>', 'wai_components' ), array( 'span' => array( 'class' => array() ) ) ),
					the_title( '<span class="screen-reader-text">"', '"</span>', false )
				) );*/
				if ( strlen(strip_tags($field['description'])) > 600 ) {
				   echo substr(strip_tags($field['description']),0,500).'…';
				} else {
					echo strip_tags($field['description']);
				}
			?>
			</p>
			<p><a href="<?php the_field( "website" ); ?>"><?php the_field( "website" ); ?></a></p>
		<?php
			wp_link_pages( array(
				'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'wai_components' ),
				'after'  => '</div>',
			) );
		?>
		<?php if($field['tags']) { ?>
			<aside class="tags">
				<h3>Tags</h3>
				<ul>
					<?php foreach ($field['tags'] as $tag) { ?>
						<li><a href="<?php echo get_term_link($tag) ?>"><?php echo $tag->name ?></a></li>
					<?php } ?>
				</ul>
			</aside>
		<?php } ?>
			<aside class="moreinfo">
				<p><?php if(get_field('license')) {?><strong>License:</strong> <?php echo get_field('license')->name; ?> • <?php } ?><strong>Information last updated:</strong> <?php the_modified_date("Y-m-d"); ?><?php if(get_field('a11y_statement')) {?> • <a href="<?php echo get_field('a11y_statement_url'); ?>">Accessibility Statement</a><?php } ?></p>
			</aside>
		</div>
	</div><!-- .entry-content -->
		<?php
			if ( strpos ( get_field( "development_url" ) , 'github.com' ) !== FALSE ) {
				$gh = preg_split ( '/\//' , str_replace(array("http://", "https://", 'www.', 'github.com/'), "", get_field( "development_url" ) ) );

				$gh['user'] = $gh[0];
				$gh['repo'] = $gh[1];

				$jdata = curlurl('https://api.github.com/repos/'.$gh['user'].'/'.$gh['repo']);

				// create a new cURL resource

		?>
		<div class="github">
			<ul>
				<li>Development <a href="<?php the_field( "development_url" ); ?>">on GitHub</a> <span class="arrow"></span></li>
				<li><?php echo wai_icon( "gh-star", "Starred:" ); ?> <?php echo $jdata->subscribers_count ?></li>
				<li><?php echo wai_icon( "gh-forked", "Forked" ); ?> <?php echo $jdata->forks ?></li>
				<li>Created: <?php echo strftime('%F %R', strtotime($jdata->created_at)) ?></li>
				<li>Updated: <?php echo strftime('%F %R', strtotime($jdata->updated_at)) ?></li>
				<li>Owner: <a rel="nofollow" href="<?php echo $jdata->owner->url?>"><img src="<?php echo $jdata->owner->avatar_url?>" class="github-avatar" alt="" width="20" height="20"> <?php echo $jdata->owner->login ?></a></li>
			</ul>
		</div>
		<?php } ?>

	<footer class="entry-footer">
		<?php wai_components_entry_footer(); ?>
	</footer><!-- .entry-footer -->
</article><!-- #post-## -->
