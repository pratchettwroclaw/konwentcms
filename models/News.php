<?php
/**
 * Created by PhpStorm.
 * User: knapi_000
 * Date: 08.02.15
 * Time: 17:52
 */

namespace app\models;
use yii\db\ActiveRecord;

class News extends ActiveRecord{
    public static function tableName(){
        return 'newsy';
    }
} 