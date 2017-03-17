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

    public function actionInit2()
    {
        //view,create,update,delete
        $auth = Yii::$app->authManager;
        $blogView = $auth->createPermission('/post/view');
        $auth->add($blogView);
        $blogCreate = $auth->createPermission('/post/create');
        $auth->add($blogCreate);
        $blogUpdate = $auth->createPermission('/post/update');
        $auth->add($blogUpdate);
        $blogDelete = $auth->createPermission('/post/delete');
        $auth->add($blogDelete);

        $blogManager = $auth->getRole('博客管理');
        $auth->addChild($blogManager, $blogView);
        $auth->addChild($blogManager, $blogCreate);
        $auth->addChild($blogManager, $blogUpdate);
        $auth->addChild($blogManager, $blogDelete);


    }

}