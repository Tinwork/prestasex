{block name='product_miniature_item'}
    <article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
        <div class="thumbnail-container">
            <div class="cover" id="cover">
                <a href="{$product.url}" class="thumbnail product-thumbnail">
                    <h1 class="h3 product-title" itemprop="name">{$product.name|truncate:30:'...'}</h1>
                    {if $product.show_price}
                        <div class="product-price-and-shipping">
                            <span itemprop="price" class="price">{$product.price}</span>
                        </div>
                    {/if}
                </a>
            </div>
            {block name='product_thumbnail'}
                <img
                        src = "{$product.cover.bySize.home_default.url}"
                        alt = "{$product.cover.legend}"
                        data-full-size-image-url = "{$product.cover.large.url}"
                >
            {/block}
            <span id="see-more" class="see-more">
                 {block name='quick_view'}
                     <a class="quick-view" href="#" data-link-action="quickview">
                        <i class="material-icons search">&#128065;</i>
                    </a>
                 {/block}
            </span>
        </div>
    </article>
{/block}
