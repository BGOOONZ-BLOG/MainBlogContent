<?php
/**
 * The template for displaying archive pages.
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package WAI_Components_Gallery
 */

get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main tiled" role="main">

			<div class="toolbar">
				<button>
					<?php echo wai_icon( "share" ); ?>
					Share link to this view
				</button>
				<?php get_search_form(true); ?>
				<label>
					Sort by:
					<select name="orderby" id="orderby">
						<option value="da">Date Added</option>
						<option value="title">Title A–Z</option>
					</select>
				</label>
			</div>

		<?php if ( have_posts() ) : ?>

			<header class="page-header">
				<?php
					if ( is_post_type_archive() ) {
			      echo '<h1 class="page-title">' . post_type_archive_title( '', false ) . '</h1>';
			    } else {
						the_archive_title( '<h1 class="page-title">', '</h1>' );
					}
					the_archive_description( '<div class="taxonomy-description">', '</div>' );
				?>
			</header><!-- .page-header -->

			<div class="tile-content">

			<?php /* Start the Loop */ ?>
			<?php while ( have_posts() ) : the_post(); ?>

				<?php

					/*
					 * Include the Post-Format-specific template for the content.
					 * If you want to override this in a child theme, then include a file
					 * called content-___.php (where ___ is the Post Format name) and that will be used instead.
					 */
					get_template_part( 'template-parts/content', 'tiles' );
				?>

			<?php endwhile; ?>

			</div>

			<?php the_posts_navigation(); ?>

		<?php else : ?>

			<?php get_template_part( 'template-parts/content', 'none' ); ?>

		<?php endif; ?>

		</main><!-- #main -->
	</div><!-- #primary -->

<?php get_sidebar(); ?>
<?php get_footer(); ?>
