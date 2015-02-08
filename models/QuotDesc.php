<?php
/**
 * Created by PhpStorm.
 * User: knapi_000
 * Date: 08.02.15
 * Time: 17:50
 */

namespace app\models;


class QuotDesc extends ActiveRecord{
    public static function tableName(){
        return 'cytaty_opisy';
    }
} 