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
    /** @var string FORM_PRODUCT_COMMENTS_KEY */
    const FORM_PRODUCT_COMMENTS_KEY = "prestasex_pc_product_submit_comment";
    /** @var string FORM_CONFIG_KEY */
    const FORM_CONFIG_KEY = "submit_prestasex_form_config";
    /** @var string CONFIG_ITEMS */
    const CONFIG_ITEMS = "PRESTASEX_CONFIG_ITEMS";
    /** @var string CONFIG_COLOR */
    const CONFIG_COLOR = "PRESTASEX_CONFIG_COLOR";
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
        return $this->getProductTarget() ? new Product($this->getProductTarget()) : null;
    }

    /**
     * Get product image
     *
     * @return string
     */
    public function getProductImagePath()
    {
        $product = $this->getProductEntity();
        if (!$product) {
            return null;
        }
        $image = Image::getCover($product->id);
        $links = $product->link_rewrite;

        return 'http://' . $this->link->getImageLink(reset($links), $image['id_image'], 'home_default');
    }

    /**
     * Get config values for admin panel
     *
     * @return array
     */
    public function getConfigurationValues()
    {
        return [
            'items' => Configuration::get(self::CONFIG_ITEMS),
            'color' => Configuration::get(self::CONFIG_COLOR)
        ];
    }

    /**
     * Load comments from product target
     *
     * @param int $limit
     * @return array
     */
    public function getComments($limit = null)
    {
        return $this->model->getComments($limit);
    }

    /**
     * Process submit form
     *
     * @return $this
     */
    public function processForm()
    {
        if (Tools::isSubmit(self::FORM_COMMENTS_KEY) || Tools::isSubmit(self::FORM_PRODUCT_COMMENTS_KEY)) {
            $insert = new PrestasexComments();
            $insert->hydrate([
                'id_product'    => $this->getProductTarget(),
                'grade'         => Tools::getValue('grade'),
                'comment'       => Tools::getValue('comment')
            ]);
            $res = $insert->save();

            return $res ? $this->context->smarty->assign('confirmation', true) : $this->context->smarty->assign('confirmation', false);
        }
        if (Tools::isSubmit(self::FORM_CONFIG_KEY)) {
            $items = Tools::getValue('miniatures');
            $color = Tools::getValue('color');
            if (!isset($items) || !is_numeric($items)) {
                $items = 12;
            }
            Configuration::updateValue(self::CONFIG_ITEMS, $items);
            Configuration::updateValue(self::CONFIG_COLOR, $color);

            return $this->context->smarty->assign('confirmation', true);
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
        return Tools::getValue('id_product') ? Tools::getValue('id_product') : null;
    }
}