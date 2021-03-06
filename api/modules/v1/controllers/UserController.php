<?php

namespace api\modules\v1\controllers;

use api\models\LoginForm;
use common\models\User;
use Yii;
use yii\filters\auth\QueryParamAuth;
use yii\helpers\ArrayHelper;
use yii\rest\ActiveController;
use yii\web\IdentityInterface;

class UserController extends ActiveController
{
    public $modelClass = 'common\models\User';

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function behaviors()
    {
        return ArrayHelper::merge(parent::behaviors(), [
            'authenticator' => [
                'class'      => QueryParamAuth::className(),
                'tokenParam' => 'token',
                'optional'   => [
                    'login',
                    'signup-test',
                    'user-profile',
                ],
            ],
        ]);
    }

    /**
     * 添加测试用户
     */
    public function actionSignupTest()
    {
        $user = new User();
        $user->generateAuthKey();
        $user->setPassword('123456');
        $user->username = '1112';
        $user->email    = '111@1111.com';
        $user->save(false);

        return [
            'code' => 0,
        ];
    }

    /**
     * 登录
     */
    public function actionLogin()
    {
        $model = new LoginForm;
        $model->setAttributes(Yii::$app->request->post());
        if ($user = $model->login()) {
            if ($user instanceof IdentityInterface) {
                return $user->access_token;
            } else {
                return $user->errors;
            }
        } else {
            return $model->errors;
        }
    }

    public function actionUserProfile($token)
    {
        $user = User::findIdentityByAccessToken($token);

        return [
            'id'    => $user->id,
            'email' => $user->email,
        ];
    }

}
