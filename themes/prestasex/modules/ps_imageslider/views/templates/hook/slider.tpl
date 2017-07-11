{if $homeslider.slides}
  <div id="carousel" data-ride="carousel" class="carousel slide hidden-sm-down" data-interval="{$homeslider.speed}" data-wrap="{(string)$homeslider.wrap}" data-pause="{$homeslider.pause}">
    <ul class="carousel-inner" role="listbox">
      {foreach from=$homeslider.slides item=slide name='homeslider'}
        <li class="carousel-item {if $smarty.foreach.homeslider.first}active{/if}">
          <a href="{$slide.url}">
            <figure>
              <img src="{$slide.image_url}" alt="{$slide.legend|escape}">
              {if $slide.title || $slide.description}
                <figcaption class="caption">
                  <h2 class="display-1 text-uppercase">{$slide.title}</h2>
                  <div class="caption-description">{$slide.description nofilter}</div>
                </figcaption>
              {/if}
            </figure>
          </a>
        </li>
      {/foreach}
    </ul>
    <div class="direction">
      <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
        <span class="icon-prev hidden-xs" aria-hidden="true">
          <i class="material-icons">&#xE5CB;</i>
        </span>
        <span class="sr-only">{l s='Previous' d='Shop.Theme'}</span>
      </a>
      <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
        <span class="icon-next" aria-hidden="true">
          <i class="material-icons">&#xE5CC;</i>
        </span>
        <span class="sr-only">{l s='Next' d='Shop.Theme'}</span>
      </a>
    </div>
  </div>
{/if}
