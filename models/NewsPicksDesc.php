<?php
/**
 * Created by PhpStorm.
 * User: knapi_000
 * Date: 08.02.15
 * Time: 17:53
 */

namespace app\models;
use yii\db\ActiveRecord;

class NewsPicksDesc extends ActiveRecord{
    public static function tableName(){
        return 'newsy_zdjecia_opisy';
    }
} 