<?php

namespace api\modules\v1\controllers;

use yii\filters\auth\QueryParamAuth;
use yii\helpers\ArrayHelper;
use yii\rest\ActiveController;

class TestController extends ActiveController
{
    public $modelClass = 'api\models\Goods';

    public function actionIndex()
    {
        return $this->render('index');
    }

//    public function behaviors()
//    {
//        return ArrayHelper::merge(parent::behaviors(), [
//            'authenticator' => [
//                'class'    => QueryParamAuth::className(),
//                'optional' => [
//                    'login',
//                    'signup-test',
//                ],
//            ],
//        ]);
//    }

    public function actionSearch($name)
    {
        echo $name;
    }

}
