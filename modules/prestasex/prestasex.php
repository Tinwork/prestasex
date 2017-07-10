<?php

/**
 * Class Prestasex
 *
 * @package             Module\Prestasex
 * @author              Didier Youn <didier.youn@gmail.com>, Marc Intha-Amnouay <marc.inthaamnouay@gmail.com>, Antoine Renault <antoine.renault.mmi@gmail.com>
 * @copyright           Copyright (c) 2017 Tinwork
 * @license             http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @link                https://github.com/Tinwork/ZendPokemon
 */
if (!defined('_PS_VERSION_')) {
    exit;
}

include_once(__DIR__ . '/src/PrestasexManager.php');
include_once(__DIR__ . '/src/PrestasexComments.php');
include_once(__DIR__ . '/src/PrestasexCommentsRepository.php');

class Prestasex extends Module
{
    /** @var PrestasexCommentsRepository $prestasexCommentsRepository */
    private $prestasexCommentsRepository;
    /** @var PrestasexManager $manager */
    private $manager;

    /**
     * Prestasex constructor.
     *
     * {@inheritdoc}
     */
    public function __construct()
    {
        $this->name = 'prestasex';
        $this->tab = 'front_office_feature';
        $this->version = '1.0.0';
        $this->author = 'Did Youn - Marc Intha Amnouay - Antoine Renault';
        $this->displayName = 'Prestasex Module';
        $this->description = 'Module et thème Prestashop';
        $this->bootstrap = true;

        parent::__construct();

        $this->prestasexCommentsRepository = new PrestasexCommentsRepository(Db::getInstance(), $this->context->shop, $this->getTranslator());
        $this->manager = new PrestasexManager($this->context);
    }

    /**
     * {@inheritdoc}
     */
    public function install()
    {
        return parent::install()
            && $this->prestasexCommentsRepository->createTables()
            && $this->registerHook('displayReassurance')
            && $this->registerHook('actionFrontControllerSetMedia')
            && $this->registerHook('actionAdminControllerSetMedia');
    }

    /**
     * {@inheritdoc}
     */
    public function uninstall()
    {
        return parent::uninstall()
            && $this->prestasexCommentsRepository->dropTables();
    }

    /**
     * Render configuration page
     *
     * @return string
     */
    public function getContent()
    {
        $this->manager->processForm();
        $this->context->smarty->assign('config', $this->manager->getConfigurationValues());

        return $this->display(__FILE__, 'getContent.tpl');
    }

    /**
     * Register JS and CSS files
     *
     * @param $params
     */
    public function hookActionFrontControllerSetMedia($params)
    {
        $path = 'modules/'. $this->name . '/assets';
        $this->context->controller->registerJavascript(
            'prestasex_js',
            $path .'/js/script.js',
            [
                'priority' => 10,
            ]
        );
        $this->context->controller->registerStylesheet(
            'prestasex_css',
            $path .'/css/styles.css',
            [
                'priority' => 10,
            ]
        );
    }

    /**
     * Register JS and CSS files
     *
     * @param $params
     */
    public function hookActionAdminControllerSetMedia($params)
    {
        $this->context->controller->addJS(array(
            $this->_path . 'assets/js/spectrum.js',
            $this->_path . 'assets/js/admin.js'
        ));
        $this->context->controller->addCSS(array(
            $this->_path . 'assets/css/spectrum.css'
        ));
    }

    /**
     * Render block
     *
     * @return string
     */
    public function hookDisplayReassurance()
    {
        $this->manager->processForm();
        $this->context->smarty->assign('comments', $this->manager->getComments(3));

        return $this->display(__FILE__, 'displayReassurance.tpl');
    }
}