<!doctype html>
<html lang="{$language.iso_code}">

  <head>
    {block name='head'}
      {include file='_partials/head.tpl'}
    {/block}
  </head>

  <body id="{$page.page_name}" class="{$page.body_classes|classnames}">

    {block name='hook_after_body_opening_tag'}
      {hook h='displayAfterBodyOpeningTag'}
    {/block}

    <header id="header">
      {block name='header'}
        {include file='checkout/_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
      {include file='_partials/notifications.tpl'}
    {/block}

    <section id="wrapper">
      <div class="container">

      {block name='content'}
        <section id="content">
          <div class="col-md-8 col-lg-12">
            {block name='cart_summary'}
              {render file='checkout/checkout-process.tpl' ui=$checkout_process}
            {/block}
          </div>
          <div class="col-md-4 col-lg-12">
            {block name='cart_summary'}
              {include file='checkout/_partials/cart-summary.tpl' cart = $cart}
            {/block}
            {hook h='displayReassurance'}
          </div>
        </section>
      {/block}
      </div>
    </section>

    {block name='javascript_bottom'}
      {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
      {hook h='displayBeforeBodyClosingTag'}
    {/block}

  </body>

</html>
