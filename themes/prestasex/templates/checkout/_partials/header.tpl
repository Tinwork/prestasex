<div class="header-product-cover" id="header-product-cover"></div>
<div class="header-aside" id="header-aside">
    {block name='header_banner'}
      <div class="header-banner">
          {hook h='displayBanner'}
      </div>
    {/block}
    {block name='header_nav'}
      <nav class="header-nav">
          {hook h='displayNav1'}
          {hook h='displayNav2'}
      </nav>
    {/block}
  <div class="hidden-md-up text-xs-center mobile">
    <div class="pull-xs-left" id="menu-icon">
      <i class="material-icons d-inline">&#xE5D2;</i>
    </div>
    <div class="pull-xs-right" id="_mobile_cart"></div>
    <div class="pull-xs-right" id="_mobile_user_info"></div>
    <div class="top-logo" id="_mobile_logo"></div>
    <div class="clearfix"></div>
  </div>
  <div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
    <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
    <div class="js-top-menu-bottom">
      <div id="_mobile_currency_selector"></div>
      <div id="_mobile_language_selector"></div>
      <div id="_mobile_contact_link"></div>
    </div>
  </div>
    {block name='header_top'}
      <div class="header-top">
      </div>
        {hook h='displayNavFullWidth'}
    {/block}
</div>

<div class="header-button-toggle" id="header-button-toggle">
  <span id="button-toggle"></span>
</div>

{hook h=displayPrestaSexHeaderColor}