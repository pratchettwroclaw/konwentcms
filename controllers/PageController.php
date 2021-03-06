<?php

namespace app\controllers;

use yii\web\Controller;
use yii\data\Pagination;
use app\models\Page;
use app\models\PageDesc;

class PageController extends Controller
{
    public function actionIndex()
    {
        $query = Page::find();

        $pagination = new Pagination([
            'defaultPageSize' => 5,
            'totalCount' => $query->count(),
        ]);

        $pages = $query->orderBy('id')
            ->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();

        return $this->render('index', [
            'pages' => $pages,
            'pagination' => $pagination,
        ]);
    }
}