{block name='product_miniature_item'}
    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        <div class="thumbnail-container">
            {block name='product_thumbnail'}
                <a href="{$product.url}" class="thumbnail product-thumbnail">
                    <img
                        src = "{$product.cover.bySize.home_default.url}"
                        alt = "{$product.cover.legend}"
                        data-full-size-image-url = "{$product.cover.large.url}"
                    >
                </a>
            {/block}
            <div class="product-description">
                {block name='product_name'}
                    <h1 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name|truncate:30:'...'}</a></h1>
                {/block}
                {block name='product_price_and_shipping'}
                    {if $product.show_price}
                        <div class="product-price-and-shipping">
                            <span itemprop="price" class="price">{$product.price}</span>
                        </div>
                    {/if}
                {/block}
            </div>

            <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
                {block name='quick_view'}
                    <a class="quick-view" href="#" data-link-action="quickview">
                        <i class="material-icons search">&#xE8B6;</i> {l s='Quick view' d='Shop.Theme.Actions'}
                    </a>
                {/block}

                {block name='product_variants'}
                    {if $product.main_variants}
                        {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
                    {/if}
                {/block}
            </div>

    </article>
{/block}
