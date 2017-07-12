<div id="js-product-list">
    <div class="products">
        {foreach from=$listing.products item="product"}
            {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/tinwork-product-home.tpl' product=$product}
            {/block}
        {/foreach}
    </div>

    <div class="hidden-md-up text-xs-right up">
        <a href="#header" class="btn btn-secondary">
            {l s='Back to top' d='Shop.Theme.Actions'}
            <i class="material-icons">&#xE316;</i>
        </a>
    </div>
</div>
