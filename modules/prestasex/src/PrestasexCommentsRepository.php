<?php

/**
 * Class PrestasexCommentsRepository
 *
 * @package             Module\Prestasex\src
 * @author              Didier Youn <didier.youn@gmail.com>, Marc Intha-Amnouay <marc.inthaamnouay@gmail.com>, Antoine Renault <antoine.renault.mmi@gmail.com>
 * @copyright           Copyright (c) 2017 Tinwork
 * @license             http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @link                https://github.com/Tinwork/prestasex
 */
use \PrestaShopBundle\Translation\TranslatorComponent as Translator;

class PrestasexCommentsRepository
{
    private $db;
    private $shop;
    private $db_prefix;
    private $translator;

    /**
     * {@inheritdoc}
     */
    public function __construct(Db $db, Shop $shop, Translator $translator)
    {
        $this->db = $db;
        $this->shop = $shop;
        $this->db_prefix = $db->getPrefix();
        $this->translator = $translator;
    }

    /**
     * Create tables
     *
     * @return bool
     */
    public function createTables()
    {
        $engine = _MYSQL_ENGINE_;
        $success = true;
        $this->dropTables();

        $queries = [
            "CREATE TABLE IF NOT EXISTS `{$this->db_prefix}prestasex_comments`(
    			`id_prestasex_comments` int(10) unsigned NOT NULL auto_increment,
    			`id_product` int(11) NOT NULL,
                `grade` float(11) NOT NULL,
                `comment` text NOT NULL,
                `date_add` datetime NOT NULL,
                PRIMARY KEY(`id_prestasex_comments`)
            ) ENGINE=$engine DEFAULT CHARSET=utf8"
        ];

        foreach ($queries as $query) {
            $success &= $this->db->execute($query);
        }

        return $success;
    }

    /**
     * Drop tables
     *
     * @return bool
     */
    public function dropTables()
    {
        $sql = "DROP TABLE IF EXISTS
			`{$this->db_prefix}prestasex_comments`";

        return $this->db->execute($sql);
    }
}
