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
use yii\web\ForbiddenHttpException;

class AccessControl extends ActionFilter
{

    /**
     * @param \yii\base\Action $action
     */
    public function beforeAction($action)
    {
        //当前路由
        $actionId = Yii::$app->request->scriptUrl;
        $m = Yii::$app->controller->id;
        $a = Yii::$app->controller->action->id;
        $actionId = '/' . $m . '/' . $a;

        //当前登录的用户
        $user = Yii::$app->getUser();
        $userId = $user->id;

        // 获取当前用户已经分配过的路由权限
        // 写的比较简单，有过基础的可自行完善，比如解决"*"的问题，看不懂的该行注释自行忽略
        $routes = [];
        $manager = Yii::$app->getAuthManager();
        $a = $manager->getPermissionsByUser($userId);
        foreach ($manager->getPermissionsByUser($userId) as $name => $value) {
            if ($name[0] === '/') {
                $routes[] = $name;
            }
        }

        //判断当前用户是否有权限访问正在请求的路由
        if (in_array($actionId, $routes)) {
            return true;
        }

        $this->denyAccess($user);
    }

    /**
     *  拒绝用户访问
     *  访客，跳转去登录；已登录，抛出403
     *  @param $user 当前用户
     *  @throws ForbiddenHttpException 如果用户已经登录，抛出403.
     */
    public function denyAccess($user)
    {
        if ($user->getIsGuest()) {
            $user->loginRequired();
        } else {
            throw new ForbiddenHttpException('没有权限');
        }
    }

}