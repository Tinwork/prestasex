<div class="product-add-to-cart">
  {if !$configuration.is_catalog}
    {block name='product_quantity'}
      <div class="product-quantity">
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
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product-minimal-quantity">
        {if $product.minimal_quantity > 1}
          {l
          s='The minimum purchase order quantity for the product is %quantity%.'
          d='Shop.Theme.Checkout'
          sprintf=['%quantity%' => $product.minimal_quantity]
          }
        {/if}
      </p>
    {/block}
  {/if}
</div>
