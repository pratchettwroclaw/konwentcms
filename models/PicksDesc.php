<?php
/**
 * Created by PhpStorm.
 * User: knapi_000
 * Date: 08.02.15
 * Time: 17:55
 */

namespace app\models;
use yii\db\ActiveRecord;

class PicksDesc extends ActiveRecord{
    public static function tableName(){
        return 'zdjecia_opisy';
    }
} 