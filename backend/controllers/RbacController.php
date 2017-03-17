<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2017/3/17
 * Time: 19:47
 */

namespace backend\controllers;

use Yii;
use yii\web\Controller;

class RbacController extends Controller
{
    public function actionInit()
    {
        $auth = Yii::$app->authManager;
        $blogIndex = $auth->createPermission('/blog/index');
        $blogIndex->description = '博客列表';
        $auth->add($blogIndex);
        $blogManager = $auth->createRole('博客管理');
        $auth->add($blogManager);
        $auth->addChild($blogManager, $blogIndex);
        $auth->assign($blogManager, 1);
    }

}