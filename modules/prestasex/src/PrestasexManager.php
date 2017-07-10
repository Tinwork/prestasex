<?php

/**
 * Class PrestasexManager
 *
 * @package             Module\Prestasex\src
 * @author              Didier Youn <didier.youn@gmail.com>, Marc Intha-Amnouay <marc.inthaamnouay@gmail.com>, Antoine Renault <antoine.renault.mmi@gmail.com>
 * @copyright           Copyright (c) 2017 Tinwork
 * @license             http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @link                https://github.com/Tinwork/prestasex
 */
class PrestasexManager
{
    /** @var string FORM_COMMENTS_KEY */
    const FORM_COMMENTS_KEY = "prestasex_pc_submit_comment";
    /** @var PrestasexComments $model */
    private $model;
    /** @var Link $link */
    private $link;
    /** @var Context $context */
    private $context;

    /**
     * PrestasexManager constructor.
     *
     * @param $context
     */
    public function __construct(Context $context)
    {
        $this->model = new PrestasexComments($this->getProductTarget());
        $this->link = new Link();
        $this->context = $context;
    }

    /**
     * Load product by ID
     *
     * @return Product|null
     */
    public function getProductEntity()
    {
        $product = new Product($this->getProductTarget());

        return $product ? $product : null;
    }

    /**
     * Get product image
     *
     * @return string
     */
    public function getProductImagePath()
    {
        $product = $this->getProductEntity();
        $image = Image::getCover($product->id);
        $links = $product->link_rewrite;

        return 'http://' . $this->link->getImageLink(reset($links), $image['id_image'], 'home_default');
    }

    /**
     * Load comments from product target
     *
     * @return array
     */
    public function getComments()
    {
        return $this->model->getComments();
    }

    /**
     * Process submit form commentary
     *
     * @return $this
     */
    public function processFormComments()
    {
        if (Tools::isSubmit(self::FORM_COMMENTS_KEY)) {
            $insert = new PrestasexComments();
            $insert->hydrate([
                'id_product'    => $this->getProductTarget(),
                'grade'         => Tools::getValue('grade'),
                'comment'       => Tools::getValue('comment')
            ]);
            $res = $insert->save();

            return $res ? $this->context->smarty->assign('confirmation', true) : $this->context->smarty->assign('confirmation', false);
        }

        return $this;
    }

    /**
     * Get current page
     *
     * @return string|null
     */
    protected function getCurrentPage()
    {
        return Tools::getValue('page') ? Tools::getValue('page') : null;
    }

    /**
     * Get current product
     *
     * @return string|null
     */
    protected function getProductTarget()
    {
        return Tools::getValue('product') ? Tools::getValue('product') : null;
    }
}