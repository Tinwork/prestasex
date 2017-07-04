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

class Prestasex extends Module
{
    /**
     * Prestasex constructor.
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
    }

    /**
     * Render configuration page
     *
     * @return string
     */
    public function getContent()
    {
        $this->processFormConfig();

        return $this->display(__FILE__, 'getContent.tpl');
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