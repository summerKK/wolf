<?php
/**
 * Created by PhpStorm.
 * User: summer
 * Date: 2017/3/17
 * Time: 22:53
 */

namespace backend\components;


use Yii;
use yii\base\ActionFilter;

class ThemeControl extends ActionFilter
{

    public function init()
    {
        $switch = Yii::$app->request->get('switch');
        $theme = $switch ? 'spring' : 'christmas';

        Yii::$app->view->theme = Yii::createObject([
            'class'   => 'yii\base\Theme',
            'pathMap' => [
                '@app/views' => [
                    '@app/themes/' . $theme,
                ],
            ],
        ]);
    }

}