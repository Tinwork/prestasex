<html lang="{$language.iso_code}">
<head>
    {block name='head'}
        {include file='_partials/head.tpl'}
    {/block}
</head>
<body id="{$page.page_name}" class="{$page.body_classes|classnames} is-category">
{block name='hook_after_body_opening_tag'}
    {hook h='displayAfterBodyOpeningTag'}
{/block}
<main>
    {block name='product_activation'}
        {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    <header id="header">
        {block name='header'}
            <div class="header-product-cover" id="header-product-cover" style="background-image: url({$category.image.large.url})"></div>
            <div class="header-aside" id="header-aside">
                <div class="header-search">
                    {hook h='displaySearch'}
                </div>
                {block name='header_banner'}
                    <div class="header-banner">
                        {hook h='displayBanner'}
                    </div>
                {/block}
                <div class="header-account">
                    {hook h='displayNav2'}
                </div>
                {block name='header_top'}
                    <div class="header-top">
                        {hook h='displayTop'}
                    </div>
                {/block}
                <div class="header-follow">
                    <span>Nous suivre :</span>
                    <div class="follow">
                        <div class="row">
                            <a href="" class="facebook"></a>
                            <a href="" class="twitter"></a>
                            <a href="" class="facebook"></a>
                            <a href="" class="twitter"></a>
                        </div>
                        <div class="row">
                            <a href="" class="facebook"></a>
                            <a href="" class="twitter"></a>
                            <a href="" class="facebook"></a>
                            <a href="" class="twitter"></a>
                        </div>
                    </div>
                </div>

                <div class="header-company">
                    <span>Nos produits :</span>
                    <ul>
                        <li><a href="/content/1-livraison">Meilleures ventes</a></li>
                        <li><a href="/content/2-mentions-legales">Nouveautés</a></li>
                        <li><a href="/content/3-conditions-utilisation">Promotions</a></li>
                    </ul>
                </div>

                <div class="header-company">
                    <span>Notre compagnie :</span>
                    <ul>
                        <li><a href="/content/1-livraison">Livraison</a></li>
                        <li><a href="/content/2-mentions-legales">Mentions Légales</a></li>
                        <li><a href="/content/3-conditions-utilisation">Conditions d'utilisation</a></li>
                        <li><a href="/content/4-a-propos">A propos</a></li>
                        <li><a href="/content/5-paiement-securise">Paiement sécurisé</a></li>
                    </ul>
                </div>
            </div>

            <div class="header-button-toggle" id="header-button-toggle">
                <span id="button-toggle"></span>
            </div>

            {hook h=displayPrestaSexHeaderColor}
        {/block}
    </header>

    {block name='notifications'}
        {include file='_partials/notifications.tpl'}
    {/block}

    <section id="wrapper">
        {block name='breadcrumb'}
            {include file='_partials/breadcrumb.tpl'}
        {/block}

        {block name="content_wrapper"}
            <div id="content-wrapper" class="left-column right-column col-sm-8 col-md-9">
                {block name='content'}
                    <section id="main">
                        {block name='product_list_header'}
                            <div class="block-category card card-block hidden-sm-down">
                                <h1 class="h1">{$category.name}</h1>
                                {if $category.description}
                                    <div id="category-description" class="text-muted">{$category.description nofilter}</div>
                                {/if}
                            </div>
                            <div class="text-xs-center hidden-md-up">
                                <h1 class="h1">{$category.name}</h1>
                            </div>
                        {/block}
                        <section id="products">
                            {if $listing.products|count}
                                <div id="">
                                    {block name='product_list'}
                                        {include file='catalog/_partials/tinwork-products.tpl' listing=$listing}
                                    {/block}
                                </div>
                            {else}
                                {include file='errors/not-found.tpl'}
                            {/if}
                        </section>

                    </section>
                {/block}
            </div>
        {/block}

        {block name="left_column"}
            <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
                {if $page.page_name == 'product'}
                    {hook h='displayLeftColumnProduct'}
                {else}
                    {hook h="displayLeftColumn"}
                {/if}
            </div>
        {/block}
    </section>
</main>

{block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
{/block}

{block name='hook_before_body_closing_tag'}
    {hook h='displayBeforeBodyClosingTag'}
{/block}
</body>

</html>
