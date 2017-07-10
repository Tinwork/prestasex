{if isset($comments)}
{foreach $comments as $comment}
    <li>{$comment['comment']}</li>
{/foreach}
{/if}
<div id="bloc_commentaires">
    <div class="tabs">
        <h3 class="page-product-heading">Commentaires sur le produit</h3>
        <div class="rte">
            <form action="" method="POST" id="comment-form">
                <div class="form-group">
                    <label for="grade">Note:</label>
                    <div class="row">
                        <div class="col-xs-4">
                            <select id="grade" class="form-control" name="grade">
                                <option value="0">-- Choississez --</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="comment">Commentaire:</label>
                    <textarea name="comment" id="comment" class="form-control"></textarea>
                </div>
                <div class="submit">
                    <button type="submit" name="esgimodule_pc_submit_comment" class="bbtn btn-primary">
					<span>Envoyer
					<i class="icon-chevron-right right"></i>
					</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>	