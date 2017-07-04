<?php

/**
 * Class PrestasexCommentsModuleFrontController
 *
 * @package             Pokemon\Common\Controller
 * @author              Didier Youn <didier.youn@gmail.com>, Marc Intha-Amnouay <marc.inthaamnouay@gmail.com>, Antoine Renault <antoine.renault.mmi@gmail.com>
 * @copyright           Copyright (c) 2017 Tinwork
 * @license             http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @link                https://github.com/Tinwork/ZendPokemon
 */
class PrestasexCommentsModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        parent::initContent();

        //$this->context->smarty->assign('comments', $this->getComments());
        //$this->context->smarty->assign('product', $this->getProduct());
        //$this->context->smarty->assign('page', $this->getCurrentPage());

        $this->setTemplate('module:prestasex/views/templates/front/comments.tpl');
    }

    protected function getProduct($productId = null)
    {
        if (!$productId) {
            $productId = $this->getProductTarget();
        }

        return new Product($productId);
    }

    protected function getComments()
    {
        $productId = $this->getProductTarget();
        $comments = 'SELECT * FROM ps_esgimodule_comments WHERE `id_product` = ' . (int)$productId;

        return $comments = Db::getInstance()->executeS($comments);
    }

    protected function getCurrentPage()
    {
        return Tools::getValue('page') ? Tools::getValue('page') : null;
    }

    protected function getProductTarget()
    {
        return Tools::getValue('product') ? Tools::getValue('product') : null;
    }
}