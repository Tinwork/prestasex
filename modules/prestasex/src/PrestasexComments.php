<?php

/**
 * Class PrestasexComments
 *
 * @package             Module\Prestasex\src
 * @author              Didier Youn <didier.youn@gmail.com>, Marc Intha-Amnouay <marc.inthaamnouay@gmail.com>, Antoine Renault <antoine.renault.mmi@gmail.com>
 * @copyright           Copyright (c) 2017 Tinwork
 * @license             http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 * @link                https://github.com/Tinwork/prestasex
 */
class PrestasexComments extends ObjectModel
{
    public $id_prestasex_comments;
    public $id_product;
    public $grade;
    public $comment;
    public $date_add;

    /**
     * {@inheritdoc}
     */
    public static $definition = array(
        'table' => 'prestasex_comments',
        'primary' => 'id_prestasex_comments',
        'multilang' => false,
        'fields' => array(
            'id_product'    =>  array('type' => self::TYPE_INT, 'validate'  => 'isUnsignedInt', 'required' => true),
            'grade'         =>  array('type' => self::TYPE_FLOAT, 'required' => true),
            'comment'       =>  array('type' => self::TYPE_HTML, 'validate' => 'isString', 'size' => 120000000,'required' => true),
            'date_add'      =>  array('type' => self::TYPE_DATE),
        ),
    );

    /**
     * {@inheritdoc}
     */
    public function __construct($id = null, $id_lang = null, $id_shop = null)
    {
        parent::__construct($id, $id_lang, $id_shop);
    }

    /**
     * Return comments from the current product
     *
     * @param int $limit
     * @return array
     */
    public function getComments($limit = null)
    {
        if (!$this->id_product) {
             return [];
        }
        $sql = new DbQuery();

        $sql->select('*');
        $sql->from($this->table, 'c');
        $sql->where('c.id_product = ' . $this->id_product);
        if ($limit) {
            $sql->limit($limit);
        }
        $sql->orderBy('date_add');

        $comments = Db::getInstance()->executeS($sql);

        foreach ($comments as $key => $comment)
        {
            if (array_key_exists('date_add', $comment)) {
                $dateAdd = new DateTime($comment['date_add']);
                $comments[$key]['date_add'] = 'Le ' . $dateAdd->format('d/m/Y');
            }
            if (array_key_exists('grade', $comment)) {
                $grade = (float)$comment['grade'];
                $stars = [];
                $count = 0;
                for ($i = 0.5 ; $i <= $grade; $i+=0.5) {
                    $count = $count + 0.5;
                    if ($count == 1) {
                        array_push($stars, 'full');
                        $count = 0;
                    }
                }
                if ($grade - sizeof($stars) > 0) {
                    array_push($stars, 'half');
                }
                while (5 - sizeof($stars) > 0) {
                    array_push($stars, 'empty');
                }

                $comments[$key]['grade'] = $stars;
            }
        }

        return $comments;
    }
}
