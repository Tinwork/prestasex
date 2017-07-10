<?php

/**
 * Class PrestasexCommentsModuleFrontController
 *
 * @package             Modules\Prestasex\Controllers\Front
 * @author              Didier Youn <didier.youn@gmail.com>, Marc Intha-Amnouay <marc.inthaamnouay@gmail.com>, Antoine Renault <antoine.renault.mmi@gmail.com>
 * @copyright           Copyright (c) 2017 Tinwork
 * @license             http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @link                https://github.com/Tinwork/prestasex
 */
class PrestasexCommentsModuleFrontController extends ModuleFrontController
{
    /** @var PrestasexCommentsRepository $repository */
    private $repository;
    /** @var PrestasexManager $manager */
    private $manager;

    /**
     * PrestasexCommentsModuleFrontController constructor.
     *
     * {@inheritdoc}
     */
    public function __construct()
    {
        parent::__construct();

        $this->repository = new PrestasexCommentsRepository(
            Db::getInstance(),
            $this->context->shop,
            $this->context->getTranslator()
        );

        $this->manager = new PrestasexManager($this->context);
    }

    /**
     * {@inheritdoc}
     */
    public function initContent()
    {
        parent::initContent();

        $this->manager->processForm();

        $this->context->smarty->assign('product', $this->manager->getProductEntity());
        $this->context->smarty->assign('product_thumbnail', $this->manager->getProductImagePath());
        $this->context->smarty->assign('comments', $this->manager->getComments());

        $this->setTemplate('module:prestasex/views/templates/front/comments.tpl');
    }

    /**
     * Form process
     */
    public function processFormConfig()
    {
        if (Tools::isSubmit('submit_prestasexmodule_form')) {
            $this->context->smarty->assign('confirmation', true);
        }
    }
}