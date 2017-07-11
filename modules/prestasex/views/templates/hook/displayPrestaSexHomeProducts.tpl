<section class="featured-products clearfix">
    <div class="products" id="tinwork-products">
        {foreach from=$products item="product"}
            {include file="catalog/_partials/miniatures/tinwork-product-home.tpl" product=$product}
        {/foreach}
    </div>
</section>
<script type="text/javascript">
    let itemHoverColor = "{$config['color']}";
</script>