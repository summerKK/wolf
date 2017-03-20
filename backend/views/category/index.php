<?php

use yii\bootstrap\Modal;
use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\SearchCategory */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Categories';
$this->params['breadcrumbs'][] = $this->title;

Modal::begin([
    'id'     => 'operate-modal',
    'header' => '<h4 class="modal-title"></h4>',
]);
Modal::end();

// 创建
$requestCreateUrl = Url::toRoute('create');
$requestUpdateUrl = Url::toRoute('update');
$js = <<<JS
// 创建操作
$('#create').on('click', function () {
    $('.modal-title').html('创建栏目');
    $.get('{$requestCreateUrl}',
        function (data) {
      // 弹窗的主题渲染页面
            $('.modal-body').html(data);
        }  
    );
});
// 更新操作

$('.btn-update').on('click', function () {
    $('.modal-title').html('更新栏目');
    $.get('{$requestUpdateUrl}',{id:$(this).closest('tr').data('key')},
        function (data) {
      // 弹窗的主题渲染页面
            $('.modal-body').html(data);
        }  
    );
});
JS;


$this->registerJs($js);
?>
<div class="category-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?=
        // 创建一个按钮，并为其设置一个id,且设置属性data-toggle=moal && data-target属性指向刚刚创建的modal的id.
        Html::a('创建栏目', ['create'], [
            'class'       => 'btn btn-success',
            'id'          => 'create', // 按钮的id随意
            'data-toggle' => 'modal', // 固定写法
            'data-target' => '#operate-modal', // 等于4.1begin中设定的参数id值
        ])
        ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel'  => $searchModel,
        'columns'      => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'name',

            [
                'class'    => 'yii\grid\ActionColumn',
                'template' => '{update}{delete}',
                'header'   => '操作',
                'buttons'  => [
                    'update' => function ($url, $model, $key) {
                        return Html::a('更新', $url, [
                            'title'       => '栏目信息',
                            'class'       => 'btn btn-default btn-update',
                            'data-toggle' => 'modal',
                            'data-target' => '#operate-modal',
                        ]);
                    },
                    'delete' => function ($url, $model, $key) {
                        return Html::a('删除', $url, [
                            'title' => '删除',
                            'class' => 'btn btn-default',
                            'data'  => [
                                'confirm' => '确定删除吗?',
                                'method'  => 'post',
                            ],
                        ]);
                    },
                ],

            ],
        ],
    ]); ?>
</div>
