<?php
/**
 * Created by PhpStorm.
 * User: summer
 * Date: 2017/3/17
 * Time: 22:23
 */

namespace backend\components;


use yii\base\ActionFilter;

class MyBehavior extends ActionFilter
{

    public function beforeAction($action)
    {
        echo 1111;

        return true;
    }

    public function isGuest()
    {
        return \Yii::$app->user->isGuest;
    }
}