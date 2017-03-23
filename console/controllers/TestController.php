<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2017/3/23
 * Time: 13:49
 */

namespace console\controllers;


use backend\models\Blog;
use Yii;
use yii\console\Controller;

class TestController extends Controller
{

    public function actionIndex($name, $age)
    {

//       echo 'This is my first console application';
        echo 'your name is:' . $name;
        echo 'your age is:' . $age;

        return self::EXIT_CODE_NORMAL;
    }

    public function actionRows($id)
    {
        $rows = Yii::$app->db->createCommand("select * from blog where id= '{$id}' ")->queryOne();
        var_dump($rows);

        return self::EXIT_CODE_NORMAL;
    }
}