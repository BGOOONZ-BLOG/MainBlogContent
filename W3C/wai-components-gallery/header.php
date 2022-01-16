<?php
/**
 * The header for our theme.
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package WAI_Components_Gallery
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div class="not-w3c-notification">This is an Editor’s draft, for <em>preview purposes only</em>.</div>
<div id="page" class="hfeed site">
  <a class="skip-link screen-reader-text" href="#search_filter_register_widget-2"><?php esc_html_e( 'Skip to filters', 'wai_components' ); ?></a>
	<a class="skip-link screen-reader-text" href="#content"><?php esc_html_e( 'Skip to content', 'wai_components' ); ?></a>

	<header id="masthead" class="site-header" role="banner">

    <div class="w3c-wai-header">
      <a href="http://w3.org/"><img alt="W3C" src="<?php bloginfo('template_url'); ?>/img/w3c.png" width="90"></a>
      <a href="http://w3.org/WAI/" class="wai"><img alt="Web Accessibility Initiative" src="<?php bloginfo('template_url'); ?>/img/wai.png"></a>
    </div>
    <span class="page-title">
    	<?php if ( is_front_page() ) : ?>
      	<span class="current-a">
			<?php else : ?>
				<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
    	<?php endif; ?>
      <?php bloginfo( 'name' ); ?>
      <?php if ( $_GET['hidesubhead'] == false ) : ?>
        <span class="subheading"><?php bloginfo( 'description' ); ?></span>
      <?php endif; ?>
      <?php if ( is_front_page() ) : ?>
      	</span>
			<?php else : ?>
				</a>
    	<?php endif; ?>
    </span>
	</header><!-- #masthead -->
  <div class="note"><a href="https://www.w3.org/blog/wai-components-gallery/wp-login.php?redirect_to=https%3A%2F%2Fwww.w3.org%2Fblog%2Fwai-components-gallery%2Fwp-admin%2Fpost-new.php%3Fpost_type%3Dwai_widgets">Add your Component</a><br><small>Requires a (free) <a href="https://www.w3.org/Help/Account/">W3C Account</a>. Components must follow the <a href="https://www.w3.org/blog/wai-components-gallery/submission-guidelines/">Submission Guidelines</a>.</small></div>
  <div class="intro">
    <p><strong>
      Information on this page is provided by vendors and others. W3C does not endorse specific products nor make assertions about their accessibility. See <a href="#text-4">Important Disclaimer</a>.
    </strong></p>
  </div>
	<div id="content" class="site-content">
