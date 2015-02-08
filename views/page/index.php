<?php
use yii\helpers\Html;
use yii\widgets\LinkPager;
?>
    <h1>Pages</h1>
    <ul>
        <?php foreach ($pages as $page): ?>
            <li>
                <?= Html::encode("{$page->id} ({$page->status})") ?>:
                <?= $page->user_id ?>
            </li>
        <?php endforeach; ?>
    </ul>

<?= LinkPager::widget(['pagination' => $pagination]) ?>