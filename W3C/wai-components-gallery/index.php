<?php
/**
 * The main template file.
 *
 * This is the most generic template file in a WordPress theme
 * and one of the two required files for a theme (the other being style.css).
 * It is used to display a page when nothing more specific matches a query.
 * E.g., it puts together the home page when no home.php file exists.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WAI_Components_Gallery
 */

get_header(); ?>

<?php get_sidebar(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main tiled" role="main">

		<?php $the_query = new WP_Query( array( 'page_id' => 336 ) ); ?>

		<?php if ( $the_query->have_posts() ) : ?>

			<?php //if ( is_home() && ! is_front_page() ) : ?>
				<header>
					<h1 class="page-title screen-reader-text"><?php single_post_title(); ?></h1>
				</header>
			<?php endif; ?>

			<div class="tile-content">

			<?php /* Start the Loop */ ?>

			<?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>
			<?php //var_dump($query->thepost()); ?>
				<?php

					/*
					 * Include the Post-Format-specific template for the content.
					 * If you want to override this in a child theme, then include a file
					 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
					 */
					get_template_part( 'template-parts/content', 'page') ;
				?>

			<?php endwhile; ?>

			<?php // the_posts_navigation(); ?>

		<?php /*else : ?>

			<?php var_dump(the_post(336));?>
			<?php get_template_part( 'template-parts/content', 'none' ); ?>

		<?php endif;*/ ?>

		<?php // the_posts_navigation(); ?>

		</div>

		</main><!-- #main -->
	</div><!-- #primary -->
<?php get_footer(); ?>
