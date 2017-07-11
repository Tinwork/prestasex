{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='header'}
    <div class="header-product-cover" id="header-product-cover" style="background-image: url({$product.cover.large.url})"></div>
    <div class="header-aside" id="header-aside">
        {block name='header_banner'}
            <div class="header-banner">
                {hook h='displayBanner'}
            </div>
        {/block}

        {block name='header_nav'}
            <nav class="header-nav">
                {hook h='displayNav1'}
            </nav>
        {/block}

        {block name='header_top'}
            <div class="header-top">
            </div>
            {hook h='displayNavFullWidth'}
        {/block}
    </div>

    <div class="header-button-toggle" id="header-button-toggle">
        <span id="button-toggle"></span>
    </div>
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

      <div class="col-md-12 col-lg-12">
        {block name='page_content_container'}
          <section class="page-content" id="content" style="padding: 0; margin: 0;">
            {block name='page_content'}
              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
              <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>

            {/block}
          </section>
        {/block}
        </div>
        <div class="col-md-12 col-lg-12">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
            {/block}
          {/block}

          <div class="product-information">
            {block name='product_description_short'}
              <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
            {/block}


              {block name='product_availability'}
                  <span id="product-availability">
                  {if $product.show_availability && $product.availability_message}
                      {if $product.availability == 'available'}
                          <i class="material-icons product-available">&#xE5CA;</i>
                    {elseif $product.availability == 'last_remaining_items'}
                      <i class="material-icons product-last-items">&#xE002;</i>
                    {else}
                      <i class="material-icons product-unavailable">&#xE14B;</i>
                      {/if}
                      {$product.availability_message}
                  {/if}
                </span>
              {/block}
          </div>
            <hr>
            <div class="product-actions">
                {block name='product_quantity'}
                    <div class="product-quantity">
                        <div class="qty">
                            <input
                                    type="text"
                                    name="qty"
                                    id="quantity_wanted"
                                    value="{$product.quantity_wanted}"
                                    class="input-group"
                                    min="{$product.minimal_quantity}"
                            >
                        </div>
                    </div>
                {/block}
                {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                {/block}
                {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}
                  {block name='product_refresh'}
                    <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
                  {/block}
                </form>
              {/block}

            </div>
            <hr>
            <div class="product-price">
                {block name='product_prices'}
                    {include file='catalog/_partials/product-prices.tpl'}
                {/block}
                <div class="add">
                    <button
                            class="btn btn-primary add-to-cart"
                            data-button-action="add-to-cart"
                            type="submit"
                            {if !$product.add_to_cart_url}
                                disabled
                            {/if}
                    >
                        <i class="material-icons shopping-cart">&#xE547;</i>
                        {l s='Add to cart' d='Shop.Theme.Actions'}
                    </button>
                </div>
            </div>
            <hr>

            {block name='product_additional_info'}
                {include file='catalog/_partials/product-additional-info.tpl'}
            {/block}

            {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}

            {block name='product_tabs'}
              <div class="tabs">
                <ul class="nav nav-tabs">
                  {if $product.description}
                  <li class="nav-item">
                    <a class="nav-link{if $product.description} active{/if}" data-toggle="tab" href="#description">
                      {l s='Description' d='Shop.Theme.Catalog'}
                    </a>
                  </li>
                  {/if}
                  <li class="nav-item">
                    <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#product-details">
                      {l s='Product Details' d='Shop.Theme.Catalog'}
                    </a>
                  </li>
                  {if $product.attachments}
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#attachments">
                      {l s='Attachments' d='Shop.Theme.Catalog'}
                    </a>
                  </li>
                  {/if}
                  {foreach from=$product.extraContent item=extra key=extraKey}
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}">{$extra.title}</a>
                  </li>
                  {/foreach}
                </ul>

                <div class="tab-content" id="tab-content">
                 <div class="tab-pane fade in{if $product.description} active{/if}" id="description">
                   {block name='product_description'}
                     <div class="product-description">{$product.description nofilter}</div>
                   {/block}
                 </div>

                 {block name='product_details'}
                   {include file='catalog/_partials/product-details.tpl'}
                 {/block}

                 {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments">
                       <section class="product-attachments">
                         <h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                               {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
              </div>
            {/block}
          </div>
        </div>

    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix">
          <h3 class="h5 text-uppercase">{l s='You might also like' d='Shop.Theme.Catalog'}</h3>
          <div class="products">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>

{/block}
