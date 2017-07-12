<div class="header-product-cover" id="header-product-cover"></div>
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