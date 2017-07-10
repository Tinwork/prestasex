{extends file='page.tpl'}

{block name="page_content"}
    {if isset($product)}
        <div class="product-info">
            <h1>Commentaires du produit : {reset($product->name)}#{$product->id}</h1>
            {if isset($confirmation)}
                <div class="alert alert-success">
                    Votre commentaire a bien été sauvegardé
                </div>
            {/if}
            <div class="product-thumbnail">
                <img src="{$product_thumbnail}" alt="{reset($product->name)}">
            </div>
            <hr>
        </div>
        {if isset($comments) && sizeof($comments) >= 1}
        <div class="comments">
            {foreach $comments as $comment}
                <div class="comment">
                    <div class="content">
                        <div class="date">
                        <span>{$comment['date_add']} :</span>
                        </div>
                        <div class="rating-box">
                            {foreach $comment['grade'] as $grade}
                                <span class="rating-star {$grade}"></span>
                            {/foreach}
                        </div>
                        <p class="content">
                            {$comment['comment']}
                        </p>
                        <hr />
                    </div>
                </div>
            {/foreach}
        </div>
        {else}
            <div class="no-comments">
                <span>Pas encore de commentaires</span>
            </div>
            <hr>
        {/if}
        <div class="tabs">
            <h3 class="page-product-heading">Ajouter un nouveau commentaire</h3>
            <div class="rte">
                <form action="" method="POST" id="comment-form">
                    <div class="form-group">
                        <label for="grade">Note:</label>
                        <div class="row">
                            <div class="col-xs-4">
                                <fieldset class="rating">
                                    <input type="radio" id="star5" name="grade" value="5" />
                                    <label class = "full" for="star5" title="Awesome - 5 stars"></label>
                                    <input type="radio" id="star4half" name="grade" value="4.5" />
                                    <label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
                                    <input type="radio" id="star4" name="grade" value="4" />
                                    <label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                                    <input type="radio" id="star3half" name="grade" value="3.5" />
                                    <label class="half" for="star3half" title="Meh - 3.5 stars"></label>
                                    <input type="radio" id="star3" name="grade" value="3" />
                                    <label class = "full" for="star3" title="Meh - 3 stars"></label>
                                    <input type="radio" id="star2half" name="grade" value="2.5" />
                                    <label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
                                    <input type="radio" id="star2" name="grade" value="2" />
                                    <label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                                    <input type="radio" id="star1half" name="grade" value="1.5" />
                                    <label class="half" for="star1half" title="Meh - 1.5 stars"></label>
                                    <input type="radio" id="star1" name="grade" value="1" />
                                    <label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                                    <input type="radio" id="starhalf" name="grade" value="0.5" />
                                    <label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="comment">Commentaire:</label>
                        <textarea name="comment" id="comment" class="form-control"></textarea>
                    </div>
                    <div class="submit">
                        <button type="submit" name="prestasex_pc_submit_comment" class="bbtn btn-primary">
					<span>Envoyer
					<i class="icon-chevron-right right"></i>
					</span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    {/if}
{/block}