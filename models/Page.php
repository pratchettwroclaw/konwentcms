<?php
/**
 * Created by PhpStorm.
 * User: knapi_000
 * Date: 08.02.15
 * Time: 17:17
 */

namespace app\models;
use yii\db\ActiveRecord;

class Page extends ActiveRecord{
    public static function tableName(){
        return 'strony';
    }

    public function getName(){
        $desc = PageDesc::find()->andWhere('main_id='.$this->id.' AND jezyk="pl"');
        var_dump($desc);
    }
} 