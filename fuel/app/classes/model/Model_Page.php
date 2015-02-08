<?php
/**
 * Created by PhpStorm.
 * User: knapi_000
 * Date: 08.02.15
 * Time: 14:59
 */

namespace Model;
use Orm;


class Model_Page extends Orm\Model{

    protected static $_table_name = 'strony';
    protected static $_properties = array('id', 'rodzic_id', 'zdjecie', 'status', 'ostatnia_edycja', 'user_id');
    protected static $_primary_key = array('id');
} 